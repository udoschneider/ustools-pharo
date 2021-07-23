Extension { #name : #QCObject }

{ #category : #'*USTools-QCMagritte' }
QCObject class >> stonAllInstVarNames [
	"Override to encode my instances using a custom set of instance variables or to define their order."

	^ super allInstVarNames copyWithout: #parent
]
