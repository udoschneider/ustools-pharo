Extension { #name : #PRDocumentItem }

{ #category : #'*USTools-Misc' }
PRDocumentItem >> canvas [
	^ self propertyAt: #canvas
]

{ #category : #'*USTools-Misc' }
PRDocumentItem >> parent [
	^ self propertyAt: #parent
]

{ #category : #'*USTools-Misc' }
PRDocumentItem >> removeProperty: key [
	self properties removeKey: key ifAbsent: [  ]
]

{ #category : #'*USTools-Misc' }
PRDocumentItem >> setParent: parent canvas: canvas [
	self
		propertyAt: #parent put: parent;
		propertyAt: #canvas put: canvas
]

{ #category : #'*USTools-Misc' }
PRDocumentItem >> with: aBlock [
	^ self canvas nest: aBlock
]
