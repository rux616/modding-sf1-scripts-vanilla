Scriptname DefaultRefOnContainerChangedTo extends DefaultRef Default
{Set stage when THIS object's container changes.
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() akNewContainer: " + akNewContainer + ", akOldContainer: " + akOldContainer, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akNewContainer, LocationToCheck = akOldContainer.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnContainerChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent