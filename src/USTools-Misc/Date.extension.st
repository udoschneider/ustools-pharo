Extension { #name : #Date }

{ #category : #'*USTools-Misc' }
Date >> printGermanDate [
	^ self printFormat: #(1 2 3 $. 1 1 2)
]
