as yet unclassified
flushCache
	"Tell the interpreter to remove all entries with this symbol as a selector from its method lookup cache, if it has one.  This primitive must be called whenever a method is redefined or removed.
	NOTE:  Only one of the two selective flush methods (Symbol or CompiledMethod) needs to be used."

	<primitive: 119>
