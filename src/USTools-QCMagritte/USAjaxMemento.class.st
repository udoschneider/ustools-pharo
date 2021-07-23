Class {
	#name : #USAjaxMemento,
	#superclass : #QCAjaxMemento,
	#category : #'USTools-QCMagritte'
}

{ #category : #actions }
USAjaxMemento >> commit [
	super commit.
	self model
		updateTimestamp;
		markDirty
]
