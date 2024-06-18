Scriptname DefaultRefOnUnequipped extends DefaultRef Default
{Sets quest stage when this reference's is unequipped.
<RefToCheck> is the unequipping actor.
<LocationToCheck> is the current location of the unequipping actor.}

Event OnUnequipped(Actor akActor)
	DefaultScriptFunctions.Trace(self, "OnUnequipped() akActor: " + akActor, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActor, LocationToCheck = akActor.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnUnequipped() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent