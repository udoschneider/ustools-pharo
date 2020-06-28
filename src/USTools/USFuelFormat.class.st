Class {
	#name : #USFuelFormat,
	#superclass : #USFormat,
	#category : #'USTools-Persistence'
}

{ #category : #constants }
USFuelFormat class >> fileExtension [
	^ 'fuel'
]

{ #category : #private }
USFuelFormat class >> materializeFromStream: binaryStream [
	^ (FLMaterializer new materializeFrom: binaryStream) root
]

{ #category : #private }
USFuelFormat class >> serialize: anObject toStream: binaryStream [
	FLSerializer serialize: anObject on: binaryStream
]
