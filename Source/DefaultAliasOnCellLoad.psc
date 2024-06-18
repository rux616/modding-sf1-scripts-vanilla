Scriptname DefaultAliasOnCellLoad extends DefaultAliasParent Default
{Sets stage if a THIS Alias's cell loads.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnCellLoad()
	DefaultScriptFunctions.Trace(self, "OnCellLoad()", ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnCellLoad() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent