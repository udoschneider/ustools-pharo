Class {
	#name : #USScheduler,
	#superclass : #Object,
	#instVars : [
		'database',
		'paused'
	],
	#category : #'USTools-Misc-Persistence'
}

{ #category : #defaults }
USScheduler class >> defaultCheckInterval [
	^ 1 minute
]

{ #category : #accessing }
USScheduler >> checkInterval [
	^ self class defaultCheckInterval
]

{ #category : #accessing }
USScheduler >> database [
	^ database
]

{ #category : #accessing }
USScheduler >> database: aKNDatabase [
	database := aKNDatabase
]

{ #category : #actions }
USScheduler >> disable [
	self subclassResponsibility
]

{ #category : #actions }
USScheduler >> enable [
	self subclassResponsibility
]

{ #category : #testing }
USScheduler >> isDue [
	self subclassResponsibility
]

{ #category : #testing }
USScheduler >> isEnabled [
	self subclassResponsibility
]

{ #category : #testing }
USScheduler >> isPaused [
	^ paused ifNil: [ paused := false ]
]

{ #category : #actions }
USScheduler >> pause [
	paused := true
]

{ #category : #actions }
USScheduler >> prioritize [
	self subclassResponsibility
]

{ #category : #actions }
USScheduler >> resume [
	paused := false
]

{ #category : #actions }
USScheduler >> scheduleAgain [
	self subclassResponsibility
]

{ #category : #actions }
USScheduler >> scheduleFirst [
	self scheduleAgain
]

{ #category : #actions }
USScheduler >> scheduleNext [
	self scheduleAgain
]
