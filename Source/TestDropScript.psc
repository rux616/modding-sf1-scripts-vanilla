Scriptname TestDropScript extends ObjectReference Const

function TestDropFirstObject()
	ObjectReference theRef = DropFirstObject()
	debug.trace(self + " dropped ref=" + theRef)
endFunction
