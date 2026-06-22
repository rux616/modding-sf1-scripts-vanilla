Scriptname DefaultAliasOnEnterBleedout extends DefaultAliasParent Default
{{Sets stage when THIS Alias enters bleedout.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnEnterBleedout()
	DefaultScriptFunctions.Trace(self, "OnEnterBleedout()", ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = Game.GetPlayer(), LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnEnterBleedout() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
EndEvent