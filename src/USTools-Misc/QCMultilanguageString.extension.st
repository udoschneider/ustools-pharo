Extension { #name : #QCMultilanguageString }

{ #category : #'*USTools-Misc' }
QCMultilanguageString >> asMustacheTemplate [
	^ self stringValue asMustacheTemplate
]
