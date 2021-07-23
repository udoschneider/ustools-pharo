Class {
	#name : #USGrowingIntervalScheduler,
	#superclass : #USIntervalScheduler,
	#instVars : [
		'currentInterval'
	],
	#category : #'USTools-Misc-Persistence'
}

{ #category : #defaults }
USGrowingIntervalScheduler class >> defaultMaximumInterval [
	^ 1 day
]

{ #category : #accessing }
USGrowingIntervalScheduler >> currentInterval [
	^ currentInterval ifNil: [ self resetCurrentInterval ]
]

{ #category : #testing }
USGrowingIntervalScheduler >> dueNextMessage [
	^ super dueNextMessage , ' Δ' , self currentInterval humanReadablePrintString
]

{ #category : #private }
USGrowingIntervalScheduler >> increaseCurrentInterval [
	currentInterval := self currentInterval * 2
]

{ #category : #actions }
USGrowingIntervalScheduler >> prioritize [
	self resetCurrentInterval.
	nextSnapshot := (nextSnapshot min: DateAndTime now + self currentInterval) min: latestSnapshot
]

{ #category : #private }
USGrowingIntervalScheduler >> resetCurrentInterval [
	^ currentInterval := self minimumInterval
]

{ #category : #actions }
USGrowingIntervalScheduler >> scheduleAgain [
	latestSnapshot := nextSnapshot := DateAndTime now
		+ (self currentInterval min: self maximumInterval)
]

{ #category : #actions }
USGrowingIntervalScheduler >> scheduleFirst [
	self resetCurrentInterval.
	self scheduleAgain
]

{ #category : #actions }
USGrowingIntervalScheduler >> scheduleNext [
	self increaseCurrentInterval.
	self scheduleAgain
]
