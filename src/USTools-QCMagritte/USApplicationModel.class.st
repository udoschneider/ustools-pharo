Class {
	#name : #USApplicationModel,
	#superclass : #QCBootstrapApplicationModel,
	#category : #'USTools-QCMagritte'
}

{ #category : #visiting }
USApplicationModel >> accept: aVisitor [
	aVisitor visitApplicationModel: self
]

{ #category : #visiting }
USApplicationModel >> database [
	self subclassResponsibility
]

{ #category : #actions }
USApplicationModel >> markDirty [
	self database markDirty
]

{ #category : #'as yet unclassified' }
USApplicationModel >> restoreFromStorageObject: aStorageObject [
	self class default: aStorageObject
]

{ #category : #actions }
USApplicationModel >> restoreLast [
	self database restoreLast
]

{ #category : #actions }
USApplicationModel >> saveCurrent [
	^ self database saveCurrent
]

{ #category : #hooks }
USApplicationModel >> storageObject [
	^ self
]
