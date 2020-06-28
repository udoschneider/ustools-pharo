Class {
	#name : #USModelPart,
	#superclass : #QCModelPart,
	#traits : 'TUSObject',
	#classTraits : 'TUSObject classTrait',
	#instVars : [
		'uid',
		'createdAt',
		'updatedAt'
	],
	#category : #'USTools-Core'
}

{ #category : #accessing }
USModelPart >> createdAt [
	^ createdAt
]

{ #category : #accessing }
USModelPart >> createdAt: anObject [
	createdAt := anObject
]

{ #category : #actions }
USModelPart >> markDirty [
	self model markDirty
]

{ #category : #'magritte-description' }
USModelPart >> mementoClass [
	^ USAjaxMemento
]

{ #category : #accessing }
USModelPart >> uid [
	^ uid
]

{ #category : #accessing }
USModelPart >> uid: anObject [
	uid := anObject
]

{ #category : #accessing }
USModelPart >> updatedAt [
	^ updatedAt
]

{ #category : #accessing }
USModelPart >> updatedAt: anObject [
	updatedAt := anObject
]
