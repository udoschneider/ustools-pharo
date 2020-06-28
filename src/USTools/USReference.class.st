Class {
	#name : #USReference,
	#superclass : #USModelPart,
	#instVars : [
		'location'
	],
	#category : #'USTools-File'
}

{ #category : #comparing }
USReference >> = anObject [
	anObject species = self species
		ifFalse: [ ^ false ].
	^ anObject location = self location
]

{ #category : #'magritte-description' }
USReference >> descriptionLocation [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Location' asMultilanguageString;
		accessor: #location;
		priority: 10;
		visibleInLabel: false;
		visibleInReport: true;
		yourself	"MAUrlDescription"
]

{ #category : #actions }
USReference >> fetchContent: anUrl [
	| client |
	[ client := ZnClient new
		get: anUrl;
		yourself ]
		on: Error
		do: [ :ex | 
			| url |
			url := location asUrl.
			url scheme = #https
				ifTrue: [ url scheme: #http.
					client := ZnClient new
						get: url;
						yourself ]
				ifFalse: [ ex signal ] ].
	^ client
]

{ #category : #comparing }
USReference >> hash [
	^ self location hash
]

{ #category : #accessing }
USReference >> location [
	^ location
]

{ #category : #accessing }
USReference >> location: aString [
	location := aString
]
