Scriptname DefaultRefOnEnterBleedout extends DefaultActorParent Default
{Sets stage when THIS actor enters bleedout.}


Event OnEnterBleedout()
	DefaultScriptFunctions.Trace(self, "OnEnterBleedout()", ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = Game.GetPlayer(), LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnEnterBleedout() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
EndEvent