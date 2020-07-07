Extension { #name : #CssDeclarationBlock }

{ #category : #'*USTools-Misc' }
CssDeclarationBlock >> princePdfPageLayout: aCssValue [
	self propertyAt: 'prince-pdf-page-layout' put: aCssValue
]
