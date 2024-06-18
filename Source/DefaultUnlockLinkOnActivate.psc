Scriptname DefaultUnlockLinkOnActivate extends DefaultRefOnActivate default
{Unlock (and optionally open when unlocked) the specified linked ref when THIS object is activated.
<RefToCheck> is the reference activating THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to unlock when this activated.}

	bool Property ShouldUseLinkedRefChain = false Const Auto
	{(Default: false) If true, will execute over the entire Linked Ref Chain.}

	Bool Property ShouldOpenWhenUnlocked = true Auto Const
	{If true (default) linkedref will be opened when unlocked. If false, or if already unlocked, linked ref will be not be opened when activated.}
EndGroup

;Reimplementing Parent's empty function
ObjectReference[] Function GetRefsToDoSpecificThingsWith()
	if ShouldUseLinkedRefChain
		DefaultScriptFunctions.Trace(self, "GetRefsToDoSpecificThingsWith() returning linked ref chain.", ShowTraces)
		return GetLinkedRefChain(LinkedRefKeyword)
	else
		return  GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
	endif
EndFunction

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if RefToDoThingWith.IsLocked()
		DefaultScriptFunctions.trace(self, "DoSpecificThing() is unlocking RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
		RefToDoThingWith.Unlock()

		if ShouldOpenWhenUnlocked
			DefaultScriptFunctions.trace(self, "DoSpecificThing() is enabling RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
			RefToDoThingWith.SetOpen()
		endif
	endif
EndFunction

