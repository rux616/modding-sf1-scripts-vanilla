Scriptname DefaultRefOnTriggerEnter extends DefaultRef Default
{Sets stage when THIS object entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Script_Specific_Properties
	Bool Property DeleteWhenTriggeredSuccessfully = false Auto Const
	{(Default: false) If true, delete THIS object when triggered successfully.}
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
;CHILDREN SCRIPTS RE-IMPLEMENTING THIS SHOULD CALL THE PARENT VERSION
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
		Delete()
	endif
EndFunction