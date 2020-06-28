Class {
	#name : #USAjaxMemento,
	#superclass : #QCAjaxMemento,
	#category : #'USTools-Ajax'
}

{ #category : #actions }
USAjaxMemento >> commit [
	super commit.
	self model
		updateTimestamp;
		markDirty
]
