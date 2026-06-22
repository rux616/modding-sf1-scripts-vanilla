Scriptname DefaultCollectionAliasOnItemRemoved extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members have items removed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of each ref in THIS collection.}

Group Script_Specific_Properties
	Form Property ItemFilter Const Auto 
	{The item filter defining the items we care about being removed from the container. See "AddInventoryEventFilter" function documentation for details}
EndGroup

Event OnAliasInit()
	AddInventoryEventFilter(ItemFilter)
EndEvent

Event OnItemRemoved(ObjectReference akSenderRef, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
	DefaultScriptFunctions.Trace(self, "OnItemRemoved() akSenderRef: " + akSenderRef, ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = Game.GetPlayer(), LocationToCheck = akSenderRef.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnItemRemoved() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent
