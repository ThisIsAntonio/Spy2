as yet unclassified
renameClass: aClass from: oldName to: newName
	"Rename the class, aClass, to have the title newName."

	| oldref category |
	category := self organization categoryOfElement: oldName.
	self organization classify: newName under: category.
	self organization removeElement: oldName.
	oldref := self associationAt: oldName.
	self removeKey: oldName.
	oldref key: newName.
	self add: oldref.  "Old association preserves old refs"
	Smalltalk renamedClass: aClass from: oldName to: newName.
	self flushClassNameCache.
	SystemAnnouncer uniqueInstance classRenamed: aClass from: oldName to: newName inCategory: category