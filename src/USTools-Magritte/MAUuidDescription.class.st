Class {
	#name : #MAUuidDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'USTools-Magritte'
}

{ #category : #visiting }
MAUuidDescription >> acceptMagritte: aVisitor [
	aVisitor visitUuidDescription: self
]

{ #category : #'as yet unclassified' }
MAUuidDescription >> jsonValueSchema [
	^ #'string-uuid'
]
