as yet unclassified
trimLeft
	"Trim separators from the left side of the receiving string."
	
	^ self trimLeft: [ :char | char isSeparator ] 