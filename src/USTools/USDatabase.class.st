Class {
	#name : #USDatabase,
	#superclass : #Object,
	#instVars : [
		'scheduler',
		'process',
		'store'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'USTools-Persistence'
}

{ #category : #defaults }
USDatabase class >> defaultSchedulerClass [
	^ USIntervalScheduler
]

{ #category : #defaults }
USDatabase class >> defaultStoreClass [
	^ USFileStore
]

{ #category : #configuration }
USDatabase class >> initialize [
	self ~= USDatabase
		ifTrue: [ SessionManager default registerUserClassNamed: self name ]
]

{ #category : #accessing }
USDatabase class >> reset [
	uniqueInstance := nil
]

{ #category : #'system startup' }
USDatabase class >> shutDown: isGoingDown [
	isGoingDown
		ifTrue: [ self uniqueInstance
				pause;
				saveCurrent;
				cleanCurrent ]
]

{ #category : #'system startup' }
USDatabase class >> startUp: isComingUp [
	isComingUp
		ifTrue: [ self uniqueInstance
				restoreLast;
				resume ]
]

{ #category : #configuration }
USDatabase class >> uninitialize [
	SessionManager default unregisterClassNamed: self name
]

{ #category : #accessing }
USDatabase class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new
				enable;
				yourself ]
]

{ #category : #actions }
USDatabase >> backgroundSave [
	[ self saveCurrent ]
		forkAt: Processor userBackgroundPriority
		named: 'snapshot: ' , self class name
]

{ #category : #actions }
USDatabase >> basicSaveCurrent [
	self store save: self storageObject
]

{ #category : #actions }
USDatabase >> cleanCurrent [
	self restoreStorageObject: nil
]

{ #category : #defaults }
USDatabase >> defaultScheduler [
	^ self class defaultSchedulerClass new
		database: self;
		yourself
]

{ #category : #defaults }
USDatabase >> defaultStore [
	^ self class defaultStoreClass new
		database: self;
		yourself
]

{ #category : #configuration }
USDatabase >> disable [
	self scheduler disable
]

{ #category : #configuration }
USDatabase >> enable [
	process isNotNil
		ifTrue: [ ^ self ].
	process := [ [ self scheduler enable.
	self messageNotify: 'Scheduling enabled'.
	self scheduleLoop ]
		ensure: [ process := nil.
			self messageNotify: 'Scheduling disabled' ] ]
		forkAt: Processor userBackgroundPriority
		named: 'Scheduled Snapshot: ' , self class name
]

{ #category : #actions }
USDatabase >> markDirty [
	self scheduler prioritize
]

{ #category : #'user notifications' }
USDatabase >> messageError: message [
	Transcript
		show:
			self messagePrefix , ' ERROR: ' , message;
		cr
]

{ #category : #'user notifications' }
USDatabase >> messageNotify: message [
	Transcript
		show: self messagePrefix , ': ' , message;
		cr
]

{ #category : #private }
USDatabase >> messagePrefix [
	| messagePrefix |
	messagePrefix := self class name , ' (' , DateAndTime now asFileNameCompatibleString , ')'.
	^ messagePrefix
]

{ #category : #'user notifications' }
USDatabase >> messageWarning: message [
	Transcript
		show: self messagePrefix , ' WARNING: ' , message;
		cr
]

{ #category : #accessing }
USDatabase >> model [
	self subclassResponsibility
]

{ #category : #actions }
USDatabase >> pause [
	self scheduler pause
]

{ #category : #private }
USDatabase >> resetScheduleProcess [
	process ifNotNil: [ process terminate ].
	process := nil
]

{ #category : #private }
USDatabase >> resetScheduler [
	self scheduler: nil
]

{ #category : #actions }
USDatabase >> restoreLast [
	self store lastSnapshot
		ifNotNil: [ :storageObject | self restoreStorageObject: storageObject ].
	self scheduler scheduleAgain
]

{ #category : #hooks }
USDatabase >> restoreStorageObject: storageObject [
	self model restoreFromStorageObject: storageObject.
	Smalltalk garbageCollectMost
]

{ #category : #actions }
USDatabase >> resume [
	self scheduler resume
]

{ #category : #actions }
USDatabase >> saveCurrent [
	[ self basicSaveCurrent.
	self scheduler scheduleNext ]
		on: Error
		do: [ :ex | self messageError: ex description ]
]

{ #category : #private }
USDatabase >> scheduleLoop [
	[ [ self scheduler isEnabled
		ifFalse: [ ^ self ].
	self scheduler isDue ]
		whileFalse: [ self scheduler checkInterval wait ].
	self saveCurrent ] repeat
]

{ #category : #private }
USDatabase >> scheduleProcess [
	^ process
]

{ #category : #accessing }
USDatabase >> scheduler [
	^ scheduler ifNil: [ scheduler := self defaultScheduler ]
]

{ #category : #accessing }
USDatabase >> scheduler: aKNScheduler [
	scheduler := aKNScheduler
]

{ #category : #hooks }
USDatabase >> storageObject [
	^ self model storageObject
]

{ #category : #accessing }
USDatabase >> store [
	^ store ifNil: [ store := self defaultStore ]
]

{ #category : #accessing }
USDatabase >> store: aKNStore [
	store := aKNStore
]
