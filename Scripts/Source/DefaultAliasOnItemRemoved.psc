Scriptname DefaultAliasOnItemRemoved extends DefaultAlias Default
{Sets quest stage when items are removed from this Alias.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of THIS alias.}

Group Script_Specific_Properties
	Form Property ItemFilter Const Auto 
	{The item filter defining the items we care about being removed from the container. See "AddInventoryEventFilter" function documentation for details}
EndGroup

Event OnAliasInit()
	AddInventoryEventFilter(ItemFilter)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
	DefaultScriptFunctions.Trace(self, "OnItemRemoved()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = Game.GetPlayer(), LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnItemRemoved() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent