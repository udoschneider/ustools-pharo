Extension { #name : #QCMultilanguageString }

{ #category : #'*USTools-QCMagritte' }
QCMultilanguageString >> asMustacheTemplate [
	^ self stringValue asMustacheTemplate
]
