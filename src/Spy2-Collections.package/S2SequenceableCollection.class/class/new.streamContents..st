as yet unclassified
new: newSize streamContents: blockWithArg
	| stream |
	stream := WriteStream on: (self streamSpecies new: newSize).
	blockWithArg value: stream.
	^ stream contents