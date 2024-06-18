Scriptname DefaultCollectionAliasOnCombatListAdd extends DefaultCollectionAlias default
{Sets stage when THIS RefCollection's members add something to their combat list.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS RefCollection's members are adding to their combat list
<LocationToCheck> is the current location of each ref in THIS collection.}

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akTarget, LocationToCheck = akSenderRef.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnCombatListAdded() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent
