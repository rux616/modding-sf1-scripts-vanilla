Scriptname DefaultAliasOnContainerChangedFrom extends DefaultAlias Default
{Set stage when THIS Alias's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was removed from.
<LocationToCheck> is the current location of the container THIS object was removed from.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	DefaultScriptFunctions.Trace(self, "OnContainerChanged()  akNewContainer: " +  akNewContainer + ", akOldContainer: " + akOldContainer, ShowTraces)
	Location LocationToCheck = NONE
	if akOldContainer
		LocationToCheck = akOldContainer.GetCurrentLocation()
	endif
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akOldContainer, LocationToCheck = LocationToCheck)
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent