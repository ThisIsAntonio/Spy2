as yet unclassified
spotterItemsFor: aStep
	<spotterOrder: 10>
	^ aStep listProcessor
		title: 'Items';
		candidatesLimit: 100;
		allCandidates: [ S2OrderedCollection newFrom: (self collect: [ :each | each copy ])];
		itemName: [ :each | each renderingProcessor itemNameFor: each value ];
		matchSubstring;
		wantsToDisplayOnEmptyQuery: true