ScriptName DefaultActivateSelf extends DefaultRef Default
{Activates itself when THIS object's OnTriggerEnter event fires.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	bool Property ActivatorIsRefToCheck = false Const Auto 
	{(Default: false) If true, Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object.}
EndGroup

Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	ObjectReference ActivatorRef = self
	if ActivatorIsRefToCheck
		ActivatorRef = ParentScriptFunctionParams.RefToCheck
	endif
	
	DefaultScriptFunctions.trace(self, "DoSpecificThing() ActivatorRef: " + ActivatorRef + " is activating self", ShowTraces)
	self.Activate(ActivatorRef)
EndFunction