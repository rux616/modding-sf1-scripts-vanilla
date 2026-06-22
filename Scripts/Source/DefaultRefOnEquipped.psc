Scriptname DefaultRefOnEquipped extends DefaultRef Default
{Sets quest stage when this reference's is equipped.
<RefToCheck> is the equipping actor.
<LocationToCheck> is the current location of the equipping actor.}

Event OnEquipped(Actor akActor)
	DefaultScriptFunctions.Trace(self, "OnEquipped() akActor: " + akActor, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActor, LocationToCheck = akActor.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnEquipped() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent