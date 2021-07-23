Extension { #name : #String }

{ #category : #'*USTools-RenoirSt' }
String >> asPageSize [
	^ USTypeAreaCalculator perform: self asSymbol
]
