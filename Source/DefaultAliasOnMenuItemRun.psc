Scriptname DefaultAliasOnMenuItemRun extends ReferenceAlias Default
{Default script to set stages and/or send story events when terminal menu items run.}

;Struct also used by DefaultCollectionAliasOnMenuItemRun
Struct MenuItemDatum
	int ItemID
	{REQUIRED: The ID of the terminal menu item.}
		
	TerminalMenu TargetTerminalMenu
	{OPTIONAL: The specific terminal you want this to trigger on (used to check for subterminals).}

	int StageToSet = -1
	{OPTIONAL: Stage to set when this menu item is run.}

	int PrereqStage = -1
	{OPTIONAL: Stage that must be set before StageToSet will be set.}

	int TurnOffStage = -1
	{OPTIONAL: If the current stage is equal or greater than TurnOffStage, do not set StageToSet.
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script }

	int TurnOffStageDone = -1
	{OPTIONAL: If this stage has been set, do not set StageToSet.}
EndStruct

Group Required_Properties
	MenuItemDatum[] Property MenuItemData Auto Const Mandatory
	{Array of stages to set when terminal menu items are run.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
	DefaultScriptFunctions.Trace(self, "OnTerminalMenuItemRun() auiMenuItemID: " + auiMenuItemID + ", akTerminalBase: " + akTerminalBase + ", akTerminalRef: " + akTerminalRef, ShowTraces)
	HandleMenuItem(self, MenuItemData, auiMenuItemID, akTerminalBase, akTerminalRef, ShowTraces)
EndEvent

;ALSO CALLED BY: DefaultCollectionAliasOnMenuItemRun
Function HandleMenuItem(Alias callingAlias, MenuItemDatum[] MenuItemData, int auiMenuItemID, TerminalMenu akTerminalMenuBase, ObjectReference akTerminalRef, bool ShouldShowTraces) global
	MenuItemDatum[] matchingMenuItemData = MenuItemData.GetAllMatchingStructs("ItemID", auiMenuItemID)
	
	int i = 0
	While (i < matchingMenuItemData.Length)
		MenuItemDatum currentData = matchingMenuItemData[i]

		if (currentData.TargetTerminalMenu == NONE ) || (currentData.TargetTerminalMenu && currentData.TargetTerminalMenu == akTerminalMenuBase)
			if (currentData.StageToSet >= -1)
				DefaultScriptFunctions.TryToSetStage(	CallingObject = callingAlias, \
														ShowNormalTrace = ShouldShowTraces, \
														\
														QuestToSet = callingAlias.GetOwningQuest(), \
														StageToSet = currentData.StageToSet, \
														PrereqStage = currentData.PrereqStage, \
														TurnOffStage = currentData.TurnOffStage, \
														TurnOffStageDone = currentData.TurnOffStageDone, \
														\
														RefToCheck = NONE, \
														PlayerOnly = False, \
														ReferencesToCheckAgainst = NONE, \
														AliasesToCheckAgainst = NONE, \
														FactionsToCheckAgainst = NONE, \
														\
														LocationToCheck = NONE, \
														LocationToCheckOther = NONE, \
														LocationsToCheckAgainst = NONE, \
														LocationAliasesToCheckAgainst = NONE, \
														LocationMatchIfChild = False, \
														\
														CheckAliveActorOrShip = NONE, \
														FailOnDeadActor = False, \
														\
														ConditionFormToTest = NONE )
			EndIf
		Endif

		i = i + 1
	EndWhile
endFunction