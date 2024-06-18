Scriptname DefaultCollectionAliasOnContainerTo extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members' container(s) change.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of the container the object was moved to.}

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() akNewContainer: " + akNewContainer + ", akOldContainer: " + akOldContainer, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akNewContainer, LocationToCheck = akOldContainer.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent