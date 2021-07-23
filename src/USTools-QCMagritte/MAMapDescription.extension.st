Extension { #name : #MAMapDescription }

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canAdd [
	^self isDefinitive not and: [ self canAddBlock value ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canAdd: aUser [
	^self canAddBlock cull: aUser
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canAddBlock [
	^self propertyAt: #canAddBlock ifAbsent: [ self class defaultCanAddBlock ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canAddBlock: aBlock [ 
	self propertyAt: #canAddBlock put: aBlock
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canExport [
	^self propertyAt: #canExport ifAbsent: [ self class defaultCanExport ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> canExport: aBoolean [
	^self propertyAt: #canExport put: aBoolean
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription class >> defaultCanAddBlock [
	^[ true ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription class >> defaultCanExport [
	^true
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription class >> defaultHasQuery [
	^false
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription class >> defaultShowFilter [
	^true
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription class >> defaultTabDisplay [
	^true
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> defaultVisibleInReport [
	^false
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> hasQuery [
	^self propertyAt: #hasQuery ifAbsent: [ self class defaultHasQuery ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> hasQuery: aBoolean [
	^self propertyAt: #hasQuery put: aBoolean
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> isOverviewRoot [
	^self isRoot
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> possibleSelection [
	^self propertyAt: #possibleSelection ifAbsent: [ self ownedIn ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> possibleSelection: aBlockOrCollection [ 
	self propertyAt: #possibleSelection put: aBlockOrCollection
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> showFilter [
	^self propertyAt: #showFilter ifAbsent: [ self class defaultShowFilter ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> showFilter: aBoolean [
	self propertyAt: #showFilter put: aBoolean
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> showTabAsContainer [
	^false
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> shownColumns [
	^self reference select: [ :each | each visibleInReport ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> startEditAll [
	^self propertyAt: #startEditAll ifAbsent: [ false ]
]

{ #category : #'*USTools-QCMagritte' }
MAMapDescription >> startEditAll: aBoolean [ 
	self propertyAt: #startEditAll put: aBoolean
]
