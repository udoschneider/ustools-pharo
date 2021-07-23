Trait {
	#name : #TUSObject,
	#category : #'USTools-QCMagritte'
}

{ #category : #comparing }
TUSObject >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self uid = anObject uid
]

{ #category : #visitor }
TUSObject >> acceptVisitor: aVisitor [
	self subclassResponsibility
]

{ #category : #accessing }
TUSObject >> contractSize [
	^ 32
]

{ #category : #'methodsFor:' }
TUSObject >> hasUserRights [
	^ true
]

{ #category : #comparing }
TUSObject >> hash [
	^ self uid hash
]

{ #category : #initialization }
TUSObject >> initalizeTimestamps [
	| ts |
	ts := DateAndTime now.
	self
		createdAt: ts;
		updatedAt: ts
]

{ #category : #initialization }
TUSObject >> initalizeUid [
	self uid: UUID new
]

{ #category : #initialization }
TUSObject >> initialize [
	super initialize.
	self initalizeUid.
	self initalizeTimestamps
]

{ #category : #accessing }
TUSObject >> latestUpdatedAt [
	^ self explicitRequirement
]

{ #category : #helpers }
TUSObject >> memento [
	^ self mementoClass model: self
]

{ #category : #'magritte-description' }
TUSObject >> mementoClass [
	^ USAjaxMemento
]

{ #category : #helpers }
TUSObject >> mementoCommit: aBlock [
	| memento |
	memento := self memento.
	aBlock value: memento.
	memento commit
]

{ #category : #accessing }
TUSObject >> uid [
	^ self explicitRequirement
]

{ #category : #accessing }
TUSObject >> uid: aUid [
	^ self explicitRequirement
]

{ #category : #updating }
TUSObject >> updateTimestamp [
	self updatedAt: DateAndTime now
]
