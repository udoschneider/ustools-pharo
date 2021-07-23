Extension { #name : #MAStringWriter }

{ #category : #'*USTools-Magritte' }
MAStringWriter >> visitUuidDescription: aMAUuidDescription [ 
	self stream nextPutAll: self object asString
]
