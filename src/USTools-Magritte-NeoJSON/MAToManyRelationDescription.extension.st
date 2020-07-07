Extension { #name : #MAToManyRelationDescription }

{ #category : #'*USTools-Magritte-NeoJSON' }
MAToManyRelationDescription >> beJsonMapped [
	self jsonMapper: MAToManyRelationDescriptionJsonMapper new
]
