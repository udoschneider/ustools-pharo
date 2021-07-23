Extension { #name : #CssSelector }

{ #category : #'*USTools-RenoirSt' }
CssSelector >> first [
	^ CssPseudoClassSelector named: 'first' over: self
]

{ #category : #'*USTools-RenoirSt' }
CssSelector >> left [
	^ CssPseudoClassSelector named: 'left' over: self
]

{ #category : #'*USTools-RenoirSt' }
CssSelector >> page [
	^ self descendantOfType: '@page'
]

{ #category : #'*USTools-RenoirSt' }
CssSelector >> princePdf [
	^ self descendantOfType: '@prince-pdf'
]

{ #category : #'*USTools-RenoirSt' }
CssSelector >> right [
	^ CssPseudoClassSelector named: 'right' over: self
]
