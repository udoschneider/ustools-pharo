Class {
	#name : #USStore,
	#superclass : #Object,
	#instVars : [
		'database'
	],
	#category : #'USTools-Misc-Persistence'
}

{ #category : #accessing }
USStore >> database [
	^ database
]

{ #category : #accessing }
USStore >> database: anObject [
	database := anObject
]
