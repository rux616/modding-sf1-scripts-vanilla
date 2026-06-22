Scriptname DefaultRefOnTriggerLeave extends DefaultRef Default
{Sets stage when THIS object's trigger is left.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Script_Specific_Properties
	Bool Property DeleteWhenTriggeredSuccessfully = true Auto Const
	{If true (default), delete THIS object when triggered successfully}
EndGroup


Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerLeave() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnTriggerLeave() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if DeleteWhenTriggeredSuccessfully
		Delete()
	endif
EndFunction