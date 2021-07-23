Class {
	#name : #USIntervalScheduler,
	#superclass : #USScheduler,
	#instVars : [
		'nextSnapshot',
		'latestSnapshot',
		'checkInterval',
		'minimumInterval',
		'maximumInterval'
	],
	#category : #'USTools-Misc-Persistence'
}

{ #category : #defaults }
USIntervalScheduler class >> defaultMaximumInterval [
	^ 0.5 days
]

{ #category : #defaults }
USIntervalScheduler class >> defaultMinimumInterval [
	^ 5 minutes
]

{ #category : #accessing }
USIntervalScheduler >> checkInterval [
	^ checkInterval ifNil: [ checkInterval := super checkInterval ]
]

{ #category : #accessing }
USIntervalScheduler >> checkInterval: aDuration [
	^ checkInterval := aDuration
]

{ #category : #actions }
USIntervalScheduler >> disable [
	latestSnapshot := nextSnapshot := nil
]

{ #category : #testing }
USIntervalScheduler >> dueNextMessage [
	^ 'Due check ' , (DateAndTime now - nextSnapshot roundTo: self checkInterval) humanReadablePrintString
]

{ #category : #testing }
USIntervalScheduler >> duePausedMessage [
	^ 'Due check - PAUSED @' , nextSnapshot asFileNameCompatibleString
]

{ #category : #actions }
USIntervalScheduler >> enable [
	self scheduleFirst
]

{ #category : #testing }
USIntervalScheduler >> isDue [
	self isPaused
		ifTrue: [ database messageNotify: self duePausedMessage.
			^ false ].
	database messageNotify: self dueNextMessage.
	^ DateAndTime now > nextSnapshot
]

{ #category : #testing }
USIntervalScheduler >> isEnabled [
	^ nextSnapshot notNil
]

{ #category : #accessing }
USIntervalScheduler >> maximumInterval [
	^ maximumInterval ifNil: [ maximumInterval := self class defaultMaximumInterval ]
]

{ #category : #accessing }
USIntervalScheduler >> maximumInterval: aDuration [
	^ maximumInterval := aDuration
]

{ #category : #accessing }
USIntervalScheduler >> minimumInterval [
	^ minimumInterval ifNil: [ minimumInterval := self class defaultMinimumInterval ]
]

{ #category : #accessing }
USIntervalScheduler >> minimumInterval: aDuration [
	^ minimumInterval := aDuration
]

{ #category : #actions }
USIntervalScheduler >> prioritize [
	nextSnapshot := nextSnapshot min: DateAndTime now + self minimumInterval
]

{ #category : #actions }
USIntervalScheduler >> scheduleAgain [
	latestSnapshot := nextSnapshot := DateAndTime now + self maximumInterval
]
