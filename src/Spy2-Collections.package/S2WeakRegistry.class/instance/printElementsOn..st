as yet unclassified
printElementsOn: aStream
	sema ifNil: [^super printElementsOn: aStream].
	aStream nextPutAll: '(<this WeakRegistry is locked>)'