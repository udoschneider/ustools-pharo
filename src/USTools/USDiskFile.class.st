Class {
	#name : #USDiskFile,
	#superclass : #MAFileModel,
	#instVars : [
		'uid'
	],
	#category : #'USTools-File'
}

{ #category : #accessing }
USDiskFile >> contents [
	^ self store blobAt: self storeKey
]

{ #category : #accessing }
USDiskFile >> contents: aByteArray [
	self store blobAt: self storeKey put: aByteArray.
	super contents: aByteArray
]

{ #category : #accessing }
USDiskFile >> database [
	self subclassResponsibility 
]

{ #category : #accessing }
USDiskFile >> document [
	| mimeType |
	mimeType := WAMimeType fromString: self mimetype.
	^ WAMimeDocument
		on:
			(mimeType isBinary
				ifTrue: [ self contents asByteArray ]
				ifFalse: [ self contents asString ])
		mimeType: mimeType
		fileName: self filename
]

{ #category : #actions }
USDiskFile >> downloadFile [
	WACurrentRequestContext value
		respond: [ :response | 
			response
				doNotCache;
				inlineDocument: self document ] 
]

{ #category : #initialization }
USDiskFile >> initialize [
	super initialize.
	uid := UUID new
]

{ #category : #rendering }
USDiskFile >> renderIconOn: html [
	html div
		fontAwesome;
		with: [ html span fontAwesomeFileOutlinedIcon ]
]

{ #category : #rendering }
USDiskFile >> renderOn: html [
	"Renders a download link of the receiver."

	html anchor
		title:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: self filename;
						nextPutAll: ' (';
						nextPutAll: self filesize asFileSize;
						nextPutAll: ', ';
						nextPutAll: self mimetype;
						nextPut: $) ]);
		callback: [ self downloadFile ];
		with: [ self renderIconOn: html.
			html text: self filename ]
]

{ #category : #accessing }
USDiskFile >> store [
	^ self database store
]

{ #category : #accessing }
USDiskFile >> storeKey [
	^ uid asString36 , '_' , self filename
]

{ #category : #accessing }
USDiskFile >> uid [
	^ uid
]

{ #category : #accessing }
USDiskFile >> url [
	"Answer a link to a request handler for the given file."
 
	| handler registry url key |
	handler := MAFileModelHandler on: self.
	registry := WACurrentRequestContext value registry.
	url := registry url.
	url addToPath: self filename.
	key := registry register: handler.
	registry trackingStrategy addKey: key toUrl: url.
	^ url
]
