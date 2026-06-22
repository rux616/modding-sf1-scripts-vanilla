Scriptname DefaultAliasOnLoad extends DefaultAliasParent Default
{Sets quest stage when this Alias loads.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnLoad()
	DefaultScriptFunctions.Trace(self, "OnLoad()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnLoad() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent