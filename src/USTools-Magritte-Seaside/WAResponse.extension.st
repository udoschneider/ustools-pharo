Extension { #name : #WAResponse }

{ #category : #'*USTools-Magritte-Seaside' }
WAResponse >> inlineDocument: aDocument [
	| document mimeType filename |
	document := aDocument seasideMimeDocument.
	mimeType := document mimeType.
	filename := document fileName.
	mimeType isBinary
		ifTrue: [ self binary ].
	self
		inlineWithFileName: filename;
		contentType: mimeType;
		nextPutAll: document content
]
