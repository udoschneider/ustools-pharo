Extension { #name : #MAToManyScalarRelationDescription }

{ #category : #'*USTools-Magritte-NeoJSON' }
MAToManyScalarRelationDescription >> beJsonMapped [
	self jsonMapper: MAToManyScalarRelationDescriptionJsonMapper new
]
