as yet unclassified
asSortedCollection: aSortBlock 
	"Answer a SortedCollection whose elements are the elements of the receiver. The sort order is defined by the argument, aSortBlock. Note that this is better to use #sorted: if you don't really need a SortedCollection, but a sorted collection!!"

	| aSortedCollection |
	aSortedCollection := S2SortedCollection new: self size.
	aSortedCollection sortBlock: aSortBlock.
	aSortedCollection addAll: self.
	^ aSortedCollection