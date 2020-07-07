Extension { #name : #NeoJSONMapper }

{ #category : #'*USTools-Magritte-NeoJSON' }
NeoJSONMapper >> mapMagritteClass: aClass [
	(aClass magritteTemplate magritteDescription
		allSatisfy: [ :description | description jsonMapper isNullMapper ])
		ifTrue: [ self
				traceCr:
					'Referenced class ' , aClass name
						, '. But this class has no JSON mapped descriptions!' ].
	aClass magritteTemplate magritteDescription
		do:
			[ :description | self mapMagritteDescription: description class: aClass ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
NeoJSONMapper >> mapMagritteDescription: aMADescription class: aClass [
	aMADescription map: aClass toJsonMapper: self
]
