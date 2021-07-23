Class {
	#name : #USVisitor,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'USTools-Misc-Visitor'
}

{ #category : #initialization }
USVisitor >> initialize [
	super initialize.
	properties := Dictionary new
]

{ #category : #visiting }
USVisitor >> start: anObject [
	self visit: anObject
]

{ #category : #visiting }
USVisitor >> visit: anObject [
	anObject accept: self
]

{ #category : #visiting }
USVisitor >> visitAll: aCollection [
	aCollection do: [ :each | self visit: each ]
]

{ #category : #visiting }
USVisitor >> visitApplicationModel: anApplicationModel [
	
]
