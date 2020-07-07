Extension { #name : #DateAndTime }

{ #category : #'*USTools-Misc' }
DateAndTime class >> fromYYYYMMDDhhmmString: aString [
	| stream |
	stream := aString readStream.
	^ self
		year: (stream next: 4) asNumber
		month: (stream next: 2) asNumber
		day: (stream next: 2) asNumber
		hour: (stream next: 2) asNumber
		minute: (stream next: 2) asNumber
]

{ #category : #'*USTools-Misc' }
DateAndTime >> printGermanDate [
	^ self asDate printGermanDate
]
