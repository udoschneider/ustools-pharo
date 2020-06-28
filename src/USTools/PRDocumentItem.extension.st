Extension { #name : #PRDocumentItem }

{ #category : #'*USTools' }
PRDocumentItem >> canvas [
	^ self propertyAt: #canvas
]

{ #category : #'*USTools' }
PRDocumentItem >> parent [
	^ self propertyAt: #parent
]

{ #category : #'*USTools' }
PRDocumentItem >> removeProperty: key [
	self properties removeKey: key ifAbsent: [  ]
]

{ #category : #'*USTools' }
PRDocumentItem >> setParent: parent canvas: canvas [
	self
		propertyAt: #parent put: parent;
		propertyAt: #canvas put: canvas
]

{ #category : #'*USTools' }
PRDocumentItem >> with: aBlock [
	^ self canvas nest: aBlock
]
