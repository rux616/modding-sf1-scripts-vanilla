Scriptname DefaultRefOnRead extends DefaultRefParent Default
{Sets quest stage when this reference has been read.}

Event OnRead()
	DefaultScriptFunctions.Trace(self, "OnLoad()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
	DefaultScriptFunctions.Trace(self, "OnLoad() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent