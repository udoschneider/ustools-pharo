Class {
	#name : #USStonFormat,
	#superclass : #USFormat,
	#category : #'USTools-Persistence'
}

{ #category : #constants }
USStonFormat class >> fileExtension [
	^ 'ston'
]

{ #category : #private }
USStonFormat class >> materializeFromStream: binaryStream [
	^ ZnBufferedReadStream
		on: binaryStream
		do:
			[ :buffererdStream | STON fromStream: (ZnCharacterReadStream on: buffererdStream encoding: #utf8) ]
]

{ #category : #private }
USStonFormat class >> serialize: anObject toStream: binaryStream [
	^ ZnBufferedWriteStream
		on: binaryStream
		do:
			[ :bufferedStream | STON put: anObject onStreamPretty: (ZnCharacterWriteStream on: bufferedStream encoding: #utf8) ]
]
