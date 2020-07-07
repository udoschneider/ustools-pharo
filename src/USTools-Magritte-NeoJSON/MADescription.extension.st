Extension { #name : #MADescription }

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> beJsonMapped [
	self jsonMapper: MAElementDescriptionJsonMapper new
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription class >> defaultJsonMapper [
	^ MANullJsonMapper new
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> fromJson: aString [
	^ self fromString: aString
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonGetter [
	^ self
		propertyAt: #jsonGetter
		ifAbsent: [ self accessor defaultJsonGetter ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonGetter: aBlock [
	self propertyAt: #jsonGetter put: aBlock
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonMapper [
	^ self propertyAt: #jsonMapper ifAbsent: [ self class defaultJsonMapper ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonMapper: aBlock [
	self propertyAt: #jsonMapper put: aBlock
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonProperty [
	^ self
		propertyAt: #jsonProperty
		ifAbsent: [ self accessor defaultJsonProperty ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonProperty: aString [
	self propertyAt: #jsonProperty put: aString
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonSetter [
	^ self
		propertyAt: #jsonSetter
		ifAbsent: [ self accessor defaultJsonSetter ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonSetter: aBlock [
	self propertyAt: #jsonSetter put: aBlock
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> jsonValueSchema [
	^ nil
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> map: aClass toJsonMapper: aNeoJSONMapper [
	self jsonMapper
		description: self;
		mappedClass: aClass;
		mapToJsonMapper: aNeoJSONMapper
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MADescription >> toJson: object [
	^ self toString: object
]
