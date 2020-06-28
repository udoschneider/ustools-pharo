Extension { #name : #CssSelector }

{ #category : #'*USTools' }
CssSelector >> first [
	^ CssPseudoClassSelector named: 'first' over: self
]

{ #category : #'*USTools' }
CssSelector >> left [
	^ CssPseudoClassSelector named: 'left' over: self
]

{ #category : #'*USTools' }
CssSelector >> page [
	^ self descendantOfType: '@page'
]

{ #category : #'*USTools' }
CssSelector >> princePdf [
	^ self descendantOfType: '@prince-pdf'
]

{ #category : #'*USTools' }
CssSelector >> right [
	^ CssPseudoClassSelector named: 'right' over: self
]
