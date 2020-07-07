Extension { #name : #MAToOneRelationDescription }

{ #category : #'*USTools-Magritte-NeoJSON' }
MAToOneRelationDescription >> beJsonMapped [
	self jsonMapper: MAToOneRelationDescriptionJsonMapper new
]
