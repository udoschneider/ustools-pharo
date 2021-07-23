Extension { #name : #USDiskFile }

{ #category : #'*USTools-Magritte-Seaside' }
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

{ #category : #'*USTools-Magritte-Seaside' }
USDiskFile >> downloadFile [
	WACurrentRequestContext value
		respond: [ :response | 
			response
				doNotCache;
				inlineDocument: self document ] 
]

{ #category : #'*USTools-Magritte-Seaside' }
USDiskFile >> renderIconOn: html [
	html div
		fontAwesome;
		with: [ html span fontAwesomeFileOutlinedIcon ]
]

{ #category : #'*USTools-Magritte-Seaside' }
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

{ #category : #'*USTools-Magritte-Seaside' }
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
