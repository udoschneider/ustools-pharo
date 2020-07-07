Extension { #name : #CssDeclarationBlock }

{ #category : #'*USTools-RenoirSt' }
CssDeclarationBlock >> pageBreakAfter: aCssValue [
	self propertyAt: 'page-break-after' put: aCssValue
]

{ #category : #'*USTools-RenoirSt' }
CssDeclarationBlock >> pageBreakBefore: aCssValue [
	self propertyAt: 'page-break-before' put: aCssValue
]

{ #category : #'*USTools-RenoirSt' }
CssDeclarationBlock >> pageBreakInside: aCssValue [
	self propertyAt: 'page-break-inside' put: aCssValue
]

{ #category : #'*USTools-RenoirSt' }
CssDeclarationBlock >> size: aCssValue [
	self propertyAt: 'size' put: aCssValue
]
