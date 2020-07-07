Trait {
	#name : #TUSDisplayName,
	#category : #'USTools-Misc-Core'
}

{ #category : #accessing }
TUSDisplayName >> displayName [
	^ (self displayTemplate asMustacheTemplate
		value: self displayTemplateContext) contractTo: self contractSize
]

{ #category : #accessing }
TUSDisplayName >> displayTemplate [
	self explicitRequirement
]

{ #category : #accessing }
TUSDisplayName >> displayTemplateContext [
	self explicitRequirement
]
