Scriptname DefaultAliasOnRead extends DefaultAliasParent Default
{Sets quest stage when this reference has been read.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Event OnRead()
	DefaultScriptFunctions.Trace(self, "OnRead()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnRead() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent