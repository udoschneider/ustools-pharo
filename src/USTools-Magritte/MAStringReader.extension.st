Extension { #name : #MAStringReader }

{ #category : #'*USTools-Magritte' }
MAStringReader >> visitUuidDescription: aDescription [
	self object: (UUID fromString: self contents)
]
