Class {
	#name : #USObject,
	#superclass : #QCObject,
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
USObject >> createdAt [
	^ createdAt
]

{ #category : #accessing }
USObject >> createdAt: anObject [
	createdAt := anObject
]

{ #category : #actions }
USObject >> markDirty [
	TNDatabase uniqueInstance markDirty
]

{ #category : #'magritte-description' }
USObject >> mementoClass [
	^ USAjaxMemento
]

{ #category : #accessing }
USObject >> uid [
	^ uid
]

{ #category : #accessing }
USObject >> uid: anObject [
	uid := anObject
]

{ #category : #accessing }
USObject >> updatedAt [
	^ updatedAt
]

{ #category : #accessing }
USObject >> updatedAt: anObject [
	^ updatedAt := anObject
]
