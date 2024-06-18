Scriptname DefaultAliasOnTriggerLeave extends DefaultAlias Default
{Sets stage when THIS Alias's trigger is left.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference triggering THIS Alias.
<LocationToCheck> is the current location of THIS Alias.}

Group Script_Specific_Properties
	Bool Property DeleteWhenTriggeredSuccessfully = true Auto Const
	{If true (default), delete THIS Alias;s reference when triggered successfully}
EndGroup


Event OnAliasInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerLeave() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnTriggerLeave() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if DeleteWhenTriggeredSuccessfully
		TryToDelete()
	endif
EndFunction