Extension { #name : #PRDocumentItem }

{ #category : #'*USTools-Pillar' }
PRDocumentItem >> canvas [
	^ self propertyAt: #canvas
]

{ #category : #'*USTools-Pillar' }
PRDocumentItem >> removeProperty: key [
	self properties removeKey: key ifAbsent: [  ]
]

{ #category : #'*USTools-Pillar' }
PRDocumentItem >> setParent: parent canvas: canvas [
	self
		propertyAt: #parent put: parent;
		propertyAt: #canvas put: canvas
]

{ #category : #'*USTools-Pillar' }
PRDocumentItem >> with: aBlock [
	^ self canvas nest: aBlock
]
