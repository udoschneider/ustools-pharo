Extension { #name : #NeoJSONObjectMapping }

{ #category : #'*USTools' }
NeoJSONObjectMapping >> mapInstVar: instVarName to: propertyName getter: readBlock setter: writeBlock [
	| propertyMapping index |
	index := subjectClass
		instVarIndexFor: instVarName
		ifAbsent: [ self error: 'Inst var not found: ' , instVarName printString ].
	^ self
		mapProperty: propertyName
		getter: [ :object | readBlock value: (object instVarAt: index) ]
		setter: [ :object :value | object instVarAt: index put: (writeBlock value: value) ]
]
