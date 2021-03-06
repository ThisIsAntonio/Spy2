examples
example07

	"This example identifies the methods that produces the most instances of Roassal"
	
	"
	self new example07
	"
	^ (TMSP new
			keepTrackOfInstancesOfPackages: #( 'Roassal2' 'Trachel' );
		profile: [| b |
b := RTGraphBuilder new.

b nodes size: 20.
b global  
	normalizeColor: #numberOfLinesOfCode 
	using: (ColorPalette diverging colors: 11 scheme: 'PRGn') 
	using: #ln.
b layout radial.
b edges connectFrom: #superclass; useInLayout.

b addAll: RTObject withAllSubclasses.

b build.] onPackagesMatchingExpresions: { 'Roassal2' . 'Trachel' }  ) inspect