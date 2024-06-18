Scriptname DefaultAliasOnClose extends DefaultAlias Default
{Sets quest stage when this reference is closed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference opening THIS Object.
<LocationToCheck> is the current location of THIS object.}

Event OnClose(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnClose() akActionRef: " + akActionRef, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnClose() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent