Class {
	#name : #USTargetAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'target'
	],
	#category : #'USTools-Core'
}

{ #category : #'instance creation' }
USTargetAnnouncement class >> target: anObject [
	^ self new
		setTarget: anObject;
		yourself
]

{ #category : #initialization }
USTargetAnnouncement >> setTarget: anObject [
	target := anObject
]

{ #category : #accessing }
USTargetAnnouncement >> target [
	^ target
]
