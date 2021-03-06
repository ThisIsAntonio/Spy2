visualization
buildView: v
	| onlyMBElements onlyMAElements comonMElements hOutgoing d realNode line allMethods minimumNumberOfExecutions maximumNumberOfExecutions |
	onlyMBElements := onlyBeforeMethods collect: [ :m | RSEllipse new size: 10; color: self removedColor darker darker translucent; model: m ] as: RSGroup.
	onlyMAElements := onlyAfterMethods collect: [ :m | RSEllipse new size: 10; color: self addedColor darker darker translucent; model: m ] as: RSGroup.
	
	allMethods := onlyBeforeMethods, onlyAfterMethods, (commonMethods collect: #beforeMethod), (commonMethods collect: #afterMethod).
	minimumNumberOfExecutions := (allMethods collect: #numberOfExecutions) min.
	maximumNumberOfExecutions := (allMethods collect: #numberOfExecutions) max.
	
	RSNormalizer size
		to: 30;
		from: 10;
		minAndMaxBlock: { minimumNumberOfExecutions . maximumNumberOfExecutions };
		shapes: onlyMBElements, onlyMAElements;
		normalize: #numberOfExecutions.

	RSNormalizer size
		to: 30;
		from: 10;
		minAndMaxBlock: { minimumNumberOfExecutions . maximumNumberOfExecutions };
		shapes: onlyMBElements, onlyMAElements;
		normalize: #numberOfExecutions.

	comonMElements := commonMethods collect: [ :m | RSBox new color: self stayColor translucent; model: m ] as: RSGroup.

	RSNormalizer width
		to: 30;
		from: 10;
		minAndMaxBlock: { minimumNumberOfExecutions . maximumNumberOfExecutions };
		shapes: comonMElements;
		normalize: [ :m | m beforeMethod numberOfExecutions ].

	RSNormalizer height
		to: 30;
		from: 10;
		minAndMaxBlock: { minimumNumberOfExecutions . maximumNumberOfExecutions };
		shapes: comonMElements;
		normalize: [ :m | m afterMethod numberOfExecutions ].

	
	v addAll: onlyMBElements; addAll: onlyMAElements; addAll: comonMElements.
	v nodes @ RSPopup @ RSDraggable.

	"We link nodes"	
	d := Dictionary new.
	(onlyBeforeMethods, onlyAfterMethods, commonMethods) do: [ :m |
		d at: m asString put: m.
	].
	v nodes do: [ :n |
		n model outgoingCalls do: [ :n2 |
			realNode := d at: n2 asString.
			(n isDirectlyConnectedTo: (v shapeFromModel: realNode)) ifFalse: [
				
				line := RSShapeFactory arrowedLineWithOffset: 0.2.
				line withBorderAttachPoint.
				line from: n.
				line to: (v shapeFromModel: realNode).
				v add: line.
				
				line pushBack.
				realNode class == S2ExCompMethod ifTrue: [ line color: self stayColor ]
					ifFalse: [
						(onlyAfterMethods includes: realNode) 
							ifTrue: [ line color: self addedColor ]
							ifFalse: [ line color: self removedColor ] 
					]
				]
		]
	].

	RSForceBasedLayout new charge: -300; on: v nodes.
	
	hOutgoing := RSHighlightable new withOutgoingEdges.
	hOutgoing highlightColor: Color red translucent.
	v nodes @ hOutgoing.