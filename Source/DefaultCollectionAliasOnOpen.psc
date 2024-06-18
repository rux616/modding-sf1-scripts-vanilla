Scriptname DefaultCollectionAliasOnOpen extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members are opened.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference opening a ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.}

Event OnOpen(ObjectReference akSenderRef, ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnOpen() akActionRef: " + akActionRef, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = akSenderRef.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnOpen() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent