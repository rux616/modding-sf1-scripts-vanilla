Scriptname DefaultRefOnActivate extends DefaultRef Default
{Sets stage if a reference is activated.
<RefToCheck> is the reference activating THIS Object.
<LocationToCheck> is the current location of THIS object.}

Event OnActivate(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnActivate() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnActivate() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent