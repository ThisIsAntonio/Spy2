visiting
visitMessageNode: aMessageNode 
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded]) 
		ifTrue: [self visitNode: aMessageNode receiver].
	self halt.
	aMessageNode arguments do: [:each | self visitNode: each]