Extension { #name : #CssDeclarationBlock }

{ #category : #'*USTools' }
CssDeclarationBlock >> pageBreakAfter: aCssValue [
	self propertyAt: 'page-break-after' put: aCssValue
]

{ #category : #'*USTools' }
CssDeclarationBlock >> pageBreakBefore: aCssValue [
	self propertyAt: 'page-break-before' put: aCssValue
]

{ #category : #'*USTools' }
CssDeclarationBlock >> pageBreakInside: aCssValue [
	self propertyAt: 'page-break-inside' put: aCssValue
]

{ #category : #'*USTools' }
CssDeclarationBlock >> princePdfPageLayout: aCssValue [
	self propertyAt: 'prince-pdf-page-layout' put: aCssValue
]

{ #category : #'*USTools' }
CssDeclarationBlock >> size: aCssValue [
	self propertyAt: 'size' put: aCssValue
]
