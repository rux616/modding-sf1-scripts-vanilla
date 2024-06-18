Scriptname DefaultRefEnableLinkedRefOnActivate extends DefaultRefOnActivate Default
{Enable or disable the specified linked ref when THIS object is activated.
<RefToCheck> is the reference activating THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

	Bool Property ShouldEnable = true Auto Const
	{If true (default) linkedref will be enabled. If false, linked ref will be disabled.}

	bool Property ShouldUseLinkedRefChain = false Const Auto
	{(Default: false) If true, will execute over the entire Linked Ref Chain.}
EndGroup


;Reimplementing Parent's empty function
ObjectReference[] Function GetRefsToDoSpecificThingsWith()
	if ShouldUseLinkedRefChain
		DefaultScriptFunctions.Trace(self, "GetRefsToDoSpecificThingsWith() returning linked ref chain.", ShowTraces)
		return GetLinkedRefChain(LinkedRefKeyword)
	else
		return GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
	endif
EndFunction

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if ShouldEnable
		DefaultScriptFunctions.trace(self, "DoSpecificThing() is enabling RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
		RefToDoThingWith.Enable()
	Else
		DefaultScriptFunctions.trace(self, "DoSpecificThing() is disabling RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
		RefToDoThingWith.Disable()
	EndIf	
EndFunction
