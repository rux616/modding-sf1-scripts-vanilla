Scriptname DefaultAliasOnContainerChangedTo extends DefaultAlias Default
{Set stage when THIS object's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to.}

Guard EventGuard ProtectsFunctionLogic
 
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() akNewContainer: " + akNewContainer + ", akOldContainer: " + akOldContainer, ShowTraces)
	
	LockGuard EventGuard
		Location LocationToCheck = NONE
		if akOldContainer
			LocationToCheck = akOldContainer.GetCurrentLocation()
		endif
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akNewContainer, LocationToCheck = LocationToCheck)
		DefaultScriptFunctions.Trace(self, "OnContainerChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	EndLockGuard
EndEvent