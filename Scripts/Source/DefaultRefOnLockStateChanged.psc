Scriptname DefaultRefOnLockStateChanged extends DefaultRefParent Default
{Sets stage if THIS object's lock state changes.}

Group Script_Specific_Properties
	Bool Property CheckForUnlock = true Const Auto
	{If true (default), exceute this script if the lock state changes to Unlocked. If false, if the lock state changes to Locked.}
EndGroup


Event OnLockStateChanged()
	DefaultScriptFunctions.Trace(self, "OnLockStateChanged()", ShowTraces)

	if (CheckForUnlock && IsLocked() == false) || (CheckForUnlock == false && IsLocked())
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
		DefaultScriptFunctions.Trace(self, "OnLockStateChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	endif
EndEvent