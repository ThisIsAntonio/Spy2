as yet unclassified
findInterned: aString

	self hasInterned:aString ifTrue:[:symbol| ^symbol].
	^nil.