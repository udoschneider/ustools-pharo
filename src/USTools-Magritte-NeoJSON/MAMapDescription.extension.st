Extension { #name : #MAMapDescription }

{ #category : #'*USTools-Magritte-NeoJSON' }
MAMapDescription >> beJsonMapped [
	self jsonMapper: MAMapDescriptionJsonMapper new
]
