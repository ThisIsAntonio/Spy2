visualization
animatedVisualization
	| view anim |
	view := RTView new.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 1000.
	anim
		blockToExecute: [ view removeAllElements.
			view removeAllEdges.
			self visualizeOn: view.
			view canvas camera focusOnCenterScaled.
			self resetCount ].
	anim inView: view.
	^ view