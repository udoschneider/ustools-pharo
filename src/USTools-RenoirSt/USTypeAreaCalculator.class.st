Class {
	#name : #USTypeAreaCalculator,
	#superclass : #Object,
	#instVars : [
		'pageSize',
		'bindingCorrection',
		'divisions',
		'inset'
	],
	#pools : [
		'RenoirSt'
	],
	#category : #'USTools-RenoirSt'
}

{ #category : #constants }
USTypeAreaCalculator class >> a4 [
	^ self aPaperSize: 4
]

{ #category : #'private-helpers' }
USTypeAreaCalculator class >> aPaperSize: number [
	| size |
	size := (1 / (2 nthRoot: 4)) @ (2 nthRoot: 4).	"0"
	number
		timesRepeat: [ size := size x > size y
				ifTrue: [ (size x / 2) @ size y ]
				ifFalse: [ size x @ (size y / 2) ] ].
	^ size
]

{ #category : #'instance creation' }
USTypeAreaCalculator class >> oneSide [
	^ USOneSideTypeAreaCalculator new
]

{ #category : #'instance creation' }
USTypeAreaCalculator class >> twoSide [
	^ USTwoSideTypeAreaCalculator new
]

{ #category : #accessing }
USTypeAreaCalculator >> bindingCorrection [
	^ bindingCorrection ifNil: [ bindingCorrection := 0 ]
]

{ #category : #accessing }
USTypeAreaCalculator >> bindingCorrection: aNumber [
	bindingCorrection := aNumber
]

{ #category : #calculations }
USTypeAreaCalculator >> boxSize [
	^ self contentSize / self divisions
]

{ #category : #calculations }
USTypeAreaCalculator >> contentHeight [
	^ pageSize y - self inset origin y - self inset extent y
]

{ #category : #calculations }
USTypeAreaCalculator >> contentSize [
	^ self contentWidth @ self contentHeight
]

{ #category : #calculations }
USTypeAreaCalculator >> contentWidth [
	^ pageSize x - self bindingCorrection - self inset origin x
		- self inset extent x
]

{ #category : #accessing }
USTypeAreaCalculator >> divisions [
	^ divisions ifNil: [ divisions := 9 ]
]

{ #category : #accessing }
USTypeAreaCalculator >> divisions: anInteger [
	divisions := anInteger
]

{ #category : #css }
USTypeAreaCalculator >> imageSizeCss: style [
	style
		maxWidth: (self toCm: self contentWidth / 2);
		maxHeight: (self toCm: self contentHeight / 2);
		width: #auto;
		height: #auto
]

{ #category : #accessing }
USTypeAreaCalculator >> inset [
	^ inset ifNil: [ inset := 0 @ 0 extent: 0 @ 0 ]
]

{ #category : #accessing }
USTypeAreaCalculator >> inset: aRectangle [
	inset := aRectangle
]

{ #category : #css }
USTypeAreaCalculator >> leftPageMarginCss: style [
	self subclassResponsibility
]

{ #category : #accessing }
USTypeAreaCalculator >> pageSize: aSymbolOrPoint [
	pageSize := aSymbolOrPoint asPageSize
]

{ #category : #css }
USTypeAreaCalculator >> rightPageMarginCss: style [
		self subclassResponsibility
]

{ #category : #initialization }
USTypeAreaCalculator >> setPageSize: aPoint [
	pageSize := aPoint
]

{ #category : #calculations }
USTypeAreaCalculator >> toCm: aFloat [
	^ (aFloat * 100 round: 2) cm
]
