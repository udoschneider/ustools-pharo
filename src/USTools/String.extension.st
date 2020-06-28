Extension { #name : #String }

{ #category : #'*USTools' }
String >> asPageSize [
	^ TNTypeAreaCalculator perform: self asSymbol
]
