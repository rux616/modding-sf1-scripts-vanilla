Scriptname TempRandomEnableScript extends ObjectReference Const
{until we have this hooked up in code on LChars}

int property MinToEnable = 0 auto Const
{ always enable at least this many }

Event OnInit()
	ObjectReference[] myChildren = GetRefsLinkedToMe(NONE)
	int roll = Math.Max(MinToEnable, Utility.RandomInt(0, myChildren.Length)) as int
	int i = 0
	debug.trace(self + " OnInit: enabling " + roll + " actors")
	while i < roll
		ObjectReference theChild = myChildren[i]
		debug.trace(self + " enabling " + theChild)
		theChild.Enable()
		i += 1
	endWhile
EndEvent