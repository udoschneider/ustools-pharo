Extension { #name : #ZnConstants }

{ #category : #'*USTools-Misc' }
ZnConstants class >> maximumLineLength [
	"Return the maximum line length to accept.
	Used by ZnLineReader and thus for reading request/status lines as well as headers.
	This helps to protect us from malicious content."
	
	^ 4096 * 4
]
