Extension { #name : #Date }

{ #category : #'*USTools' }
Date >> printGermanDate [
	^ self printFormat: #(1 2 3 $. 1 1 2)
]
