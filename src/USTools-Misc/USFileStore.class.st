Class {
	#name : #USFileStore,
	#superclass : #USStore,
	#instVars : [
		'fsMonitor'
	],
	#category : #'USTools-Misc-Persistence'
}

{ #category : #public }
USFileStore >> blobAt: key [
	| fileReference |
	fileReference := self blobFile: key.
	fileReference exists
		ifFalse: [ ^ ByteArray new ].
	^ fileReference binaryReadStreamDo: [ :stream | stream contents ]
]

{ #category : #public }
USFileStore >> blobAt: key put: aByteArray [
	| fileReference |
	fileReference := self blobFile: key.
	fileReference
		binaryWriteStreamDo: [ :stream | stream nextPutAll: aByteArray ]
]

{ #category : #accessing }
USFileStore >> blobDirectory [
	^ (self snapshotDirectory / 'blob')
		ensureCreateDirectory;
		yourself
]

{ #category : #private }
USFileStore >> blobFile: key [
	^ self blobDirectory / key asFileName
]

{ #category : #accessing }
USFileStore >> format [
	^ USFuelFormat
]

{ #category : #accessing }
USFileStore >> historyCount [
	^ 15
]

{ #category : #initialization }
USFileStore >> initialize [
	super initialize.
	fsMonitor := Monitor new
]

{ #category : #public }
USFileStore >> lastSnapshot [
	^ self lastSnapshotFile
		ifNil: [ nil ]
		ifNotNil: [ :fileRef | 
			fsMonitor
				critical: [ | storageObject |
					database messageNotify: 'Loading ' , fileRef basename.
					storageObject := self format materializeFromFile: fileRef.
					database messageNotify: 'Loaded ' , fileRef basename.
					storageObject ] ]
]

{ #category : #private }
USFileStore >> lastSnapshotFile [
	^ self snapshotFiles detectMax: [ :each | each basename asInteger ]
]

{ #category : #private }
USFileStore >> nextSnapshotVersion [
	^ self lastSnapshotFile
		ifNil: [ 1 ]
		ifNotNil: [ :fileRef | ($. split: fileRef basename) first asInteger + 1 ]
]

{ #category : #public }
USFileStore >> save: storageObject [
	fsMonitor
		critical: [ | filename fileRef |
			self trim.
			filename := self nextSnapshotVersion asString , '.' , self format fileExtension.
			fileRef := self snapshotDirectory / filename , 'tmp'.
			database messageNotify: 'Saving to ' , filename.
			[ self format serialize: storageObject toFile: fileRef.
			fileRef renameTo: filename ]
				ifCurtailed: [ fileRef ensureDelete ].
			database messageNotify: 'Saved to ' , filename ]
]

{ #category : #accessing }
USFileStore >> snapshotDirectory [
	^ FileLocator imageDirectory
		ensureCreateDirectory;
		yourself
]

{ #category : #private }
USFileStore >> snapshotFiles [
	^ self snapshotDirectory childrenMatching: '*.' , self format fileExtension
]

{ #category : #private }
USFileStore >> trim [
	| entries versionsToKeep |
	versionsToKeep := self historyCount.
	entries := self snapshotFiles.
	entries size < versionsToKeep
		ifTrue: [ ^ self ].
	((entries sorted: [ :a :b | a basename asInteger < b basename asInteger ]) allButLast: versionsToKeep)
		do: [ :entry | entry delete ]
]
