Class {
	#name : #USStonGzFormat,
	#superclass : #USStonFormat,
	#category : #'USTools-Misc-Persistence'
}

{ #category : #constants }
USStonGzFormat class >> fileExtension [
	^ super fileExtension , '.gz'
]

{ #category : #private }
USStonGzFormat class >> materializeFromStream: binaryStream [
	^ GZipReadStream
		with: binaryStream
		do: [ :gzipStream | super materializeFromStream: gzipStream ]
]

{ #category : #private }
USStonGzFormat class >> serialize: anObject toStream: binaryStream [
	^GZipWriteStream
		with: binaryStream
		do: [ :gzipStream | super serialize: anObject toStream: gzipStream ]
]
