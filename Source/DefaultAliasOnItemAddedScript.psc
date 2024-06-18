Scriptname DefaultAliasOnItemAddedScript extends DefaultAlias Default
{Sets quest stage when items are added to this Alias.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of THIS alias.}

Group Script_Specific_Properties
	Form Property ItemFilter Mandatory Const Auto 
	{The item filter defining the items we care about being removed from the container. See "AddInventoryEventFilter" function documentation for details}
EndGroup

Event OnAliasInit()
	AddInventoryEventFilter(ItemFilter)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	DefaultScriptFunctions.Trace(self, "OnItemAdded()", ShowTraces)
	
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = Game.GetPlayer(), LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnItemAdded() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent