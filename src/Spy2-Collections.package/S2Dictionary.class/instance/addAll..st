as yet unclassified
addAll: aKeyedCollection
	aKeyedCollection == self ifFalse: [
		aKeyedCollection keysAndValuesDo: [:key :value |
			self at: key put: value]].
	^aKeyedCollection