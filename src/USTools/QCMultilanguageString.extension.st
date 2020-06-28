Extension { #name : #QCMultilanguageString }

{ #category : #'*USTools' }
QCMultilanguageString >> asMustacheTemplate [
	^ self stringValue asMustacheTemplate
]
