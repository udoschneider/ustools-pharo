Extension { #name : #MAVisitor }

{ #category : #'*USTools-Magritte' }
MAVisitor >> visitMapDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : #'*USTools-Magritte' }
MAVisitor >> visitUuidDescription: aMAUuidDescription [ 
	self visitElementDescription: aMAUuidDescription
]
