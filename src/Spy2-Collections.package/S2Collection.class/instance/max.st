as yet unclassified
max
	^ self inject: self anyOne into: [:max :each | max max: each]