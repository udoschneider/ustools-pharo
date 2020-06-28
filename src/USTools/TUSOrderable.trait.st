Trait {
	#name : #TUSOrderable,
	#category : #'USTools-Core'
}

{ #category : #comparing }
TUSOrderable >> < aComparable [
	"Answer whether the receiver is less than the argument."

	self explicitRequirement
]

{ #category : #comparing }
TUSOrderable >> <= aComparable [ 
	"Answer whether the receiver is less than or equal to the argument."

	^(self > aComparable) not
]

{ #category : #comparing }
TUSOrderable >> > aComparable [ 
	"Answer whether the receiver is greater than the argument."

	^aComparable < self
]

{ #category : #comparing }
TUSOrderable >> >= aComparable [ 
	"Answer whether the receiver is greater than or equal to the argument."

	^aComparable <= self
]

{ #category : #testing }
TUSOrderable >> between: min and: max [ 
	"Answer whether the receiver is less than or equal to the argument, max, 
	and greater than or equal to the argument, min."

	^self >= min and: [self <= max]
]

{ #category : #comparing }
TUSOrderable >> compareWith: anotherComparable ifLesser: lesserBlock ifEqual: equalBlock ifGreater: greaterBlock [

	^ self < anotherComparable
		ifTrue: lesserBlock
		ifFalse: [ 
			self = anotherComparable
				ifTrue: equalBlock
				ifFalse: greaterBlock ]
]

{ #category : #comparing }
TUSOrderable >> max: aComparable [ 
	"Answer the receiver or the argument, whichever has the greater 
	value."

	self > aComparable
		ifTrue: [^self]
		ifFalse: [^aComparable]
]

{ #category : #comparing }
TUSOrderable >> min: aComparable [ 
	"Answer the receiver or the argument, whichever has the lesser 
	value."

	self < aComparable
		ifTrue: [^self]
		ifFalse: [^aComparable]
]

{ #category : #comparing }
TUSOrderable >> min: aMin max: aMax [ 

	^ (self min: aMin) max: aMax
]
