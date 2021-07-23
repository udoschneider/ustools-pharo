Class {
	#name : #USDiskFile,
	#superclass : #MAFileModel,
	#instVars : [
		'uid'
	],
	#category : #'USTools-Magritte'
}

{ #category : #accessing }
USDiskFile >> contents [
	^ self store blobAt: self storeKey
]

{ #category : #accessing }
USDiskFile >> contents: aByteArray [
	self store blobAt: self storeKey put: aByteArray.
	super contents: aByteArray
]

{ #category : #accessing }
USDiskFile >> database [
	self subclassResponsibility 
]

{ #category : #initialization }
USDiskFile >> initialize [
	super initialize.
	uid := UUID new
]

{ #category : #accessing }
USDiskFile >> store [
	^ self database store
]

{ #category : #accessing }
USDiskFile >> storeKey [
	^ uid asString36 , '_' , self filename
]

{ #category : #accessing }
USDiskFile >> uid [
	^ uid
]
