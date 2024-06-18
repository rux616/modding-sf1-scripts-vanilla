Scriptname UC04_CabinetTriggerEnterScript extends DefaultAliasOnTriggerEnter

Group Script_Specific_Properties
    Message Property NotAllowedDuringCombat Mandatory Const Auto
    {Message to throw if the player attempts to enter this trigger during combat}
EndGroup


Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    if !Game.GetPlayer().IsInCombat()
        DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)

        DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
        DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
        CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
    else
        NotAllowedDuringCombat.Show()
    endif
EndEvent

;Reimplementing Parent's empty function
;CHILDREN SCRIPTS RE-IMPLEMENTING THIS SHOULD CALL THE PARENT VERSION
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
		TryToDelete()
	endif
EndFunction