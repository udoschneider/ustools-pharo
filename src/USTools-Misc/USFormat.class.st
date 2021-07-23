Class {
	#name : #USFormat,
	#superclass : #Object,
	#category : #'USTools-Misc-Persistence'
}

{ #category : #constants }
USFormat class >> fileExtension [
	self subclassResponsibility
]

{ #category : #'serialize/materialize' }
USFormat class >> materializeFromFile: aFileReference [
	^ aFileReference
		binaryReadStreamDo: [ :stream | self materializeFromStream: stream ]
]

{ #category : #private }
USFormat class >> materializeFromStream: binaryStream [
	self subclassResponsibility
]

{ #category : #'serialize/materialize' }
USFormat class >> serialize: anObject toFile: aFileReference [
	aFileReference
		ensureDelete;
		binaryWriteStreamDo: [ :stream | self serialize: anObject toStream: stream ]
]

{ #category : #private }
USFormat class >> serialize: anObject toStream: binaryStream [
	self subclassResponsibility
]
