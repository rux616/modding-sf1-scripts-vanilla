Scriptname DefaultRefOnOpen extends DefaultRef Default
{Sets quest stage when this reference is opened.
<RefToCheck> is the reference opening THIS Object.
<LocationToCheck> is the current location of THIS object.}

Event OnOpen(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnOpen() akActionRef: " + akActionRef, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnOpen() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent