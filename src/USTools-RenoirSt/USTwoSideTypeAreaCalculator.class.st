Class {
	#name : #USTwoSideTypeAreaCalculator,
	#superclass : #USTypeAreaCalculator,
	#category : #'USTools-RenoirSt'
}

{ #category : #css }
USTwoSideTypeAreaCalculator >> leftPageMarginCss: style [
	style
		marginTop: (self toCm: self boxSize y + self inset origin y);
		marginRight: (self toCm: self boxSize x + self bindingCorrection + self inset extent x);
		marginBottom: (self toCm: self boxSize y * 2 + self inset extent y);
		marginLeft: (self toCm: self boxSize x * 2 + self inset origin x)
]

{ #category : #css }
USTwoSideTypeAreaCalculator >> rightPageMarginCss: style [
	style
		marginTop: (self toCm: self boxSize y + self inset origin y);
		marginRight: (self toCm: self boxSize x * 2 + self inset extent x);
		marginBottom: (self toCm: self boxSize y * 2 + self inset extent y);
		marginLeft: (self toCm: self boxSize x + self bindingCorrection + self inset origin x)
]
