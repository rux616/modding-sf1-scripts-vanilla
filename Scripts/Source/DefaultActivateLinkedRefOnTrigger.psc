Scriptname DefaultActivateLinkedRefOnTrigger extends DefaultRef default
{Activates the specified linked ref when THIS object is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

	bool Property ShouldUseLinkedRefChain = false Const Auto
	{(Default: false) If true, will execute over the entire Linked Ref Chain.}

	bool Property ActivatorIsRefToCheck = true Const Auto 
	{If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object.}

	bool Property ActivateOnTriggerEnter = true const Auto
	{ if true, will send activation OnTriggerEnter }

	bool Property ActivateOnTriggerLeave = false const Auto
	{ if true, will send activation OnTriggerLeave }
EndGroup

Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)
	if ActivateOnTriggerEnter
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
		DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)
	if ActivateOnTriggerLeave
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
		DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	endif
EndEvent

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
	ObjectReference ActivatorRef = self
	if ActivatorIsRefToCheck
		ActivatorRef = ParentScriptFunctionParams.RefToCheck
	endif
	
	DefaultScriptFunctions.trace(self, "DoSpecificThing() ActivatorRef: " + ActivatorRef + " is activating RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
	RefToDoThingWith.Activate(ActivatorRef)
EndFunction
