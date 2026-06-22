Scriptname DefaultAliasOnUnload extends DefaultAliasParent Default
{Sets quest stage when this reference unloads.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnUnload()
	DefaultScriptFunctions.Trace(self, "OnUnload()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnUnload() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent