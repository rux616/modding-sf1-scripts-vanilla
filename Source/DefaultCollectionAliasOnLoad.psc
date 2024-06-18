Scriptname DefaultCollectionAliasOnLoad extends DefaultCollectionAliasParent Default
{Sets stage when THIS RefCollection's members load.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnLoad(ObjectReference akSender)
	DefaultScriptFunctions.Trace(self, "OnLoad()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnLoad() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSender, ParentScriptFunctionParams)
EndEvent