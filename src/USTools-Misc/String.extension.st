Extension { #name : #String }

{ #category : #'*USTools-Misc' }
String >> asPageSize [
	^ USTypeAreaCalculator perform: self asSymbol
]
