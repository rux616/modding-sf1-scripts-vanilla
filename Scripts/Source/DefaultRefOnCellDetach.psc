Scriptname DefaultRefOnCellDetach extends DefaultRefParent Default
{Sets quest stage when this reference's cell detaches.}

Event OnCellDetach()
	DefaultScriptFunctions.Trace(self, "OnCellDetach()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnCellDetach() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent