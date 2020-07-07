Class {
	#name : #MANullJsonMapper,
	#superclass : #MADescriptionJsonMapper,
	#category : #'USTools-Magritte-NeoJSON'
}

{ #category : #testing }
MANullJsonMapper class >> isAbstract [
	^ false
]

{ #category : #testing }
MANullJsonMapper >> isNullMapper [
	^ true
]
