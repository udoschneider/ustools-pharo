Extension { #name : #MASelectorAccessor }

{ #category : #'*USTools-Magritte-NeoJSON' }
MASelectorAccessor >> defaultJsonGetter [
	^ [ :object | object perform: self readSelector ]
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MASelectorAccessor >> defaultJsonProperty [
	^ self readSelector
]

{ #category : #'*USTools-Magritte-NeoJSON' }
MASelectorAccessor >> defaultJsonSetter [
	^ [ :object :value | object perform: self writeSelector with: value ]
]
