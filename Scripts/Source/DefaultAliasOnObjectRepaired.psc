Scriptname DefaultAliasOnObjectRepaired extends DefaultAlias Default
{Default script that sets a stage when the alias is repaired.
 TODO - TTP 25225 - OnObjectRepaired compiles but isn't listed on the CS Wiki; it's unclear if it works or not.
 TODO - TTP-27113: Default Scripts: make a Reference version of DefaultAliasOnObjectRepaired

Sets stage when THIS Alias is repaired.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the repairing reference.
<LocationToCheck> is the current location of THIS Alias.}

Event OnObjectRepaired(ObjectReference akSource)
	DefaultScriptFunctions.Trace(self, "OnObjectRepaired() akSource: " + akSource, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akSource, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnObjectRepaired() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)

EndEvent

