Scriptname COM_SMQ01_AliasScript extends ReferenceAlias

Group StagesAndIndices
    int Property GenetagSearchStage = 120 Const Auto
    {Once this stage is set, start tracking the player's collection of Genetags}

    int Property GenetagObjectiveStartStage = 160 Const Auto
    {Once this stage is set, start displaying the Objective with the count of Genetags}  

    int Property GenetagObjIndex =  160 Const Auto
    {Objective index we need to update each time the player collects Genetags}

    int Property SpawnBoss =  165 Const Auto
    {Stage to set once the player's got enough Genetags to spawn the final boss}

    int Property CompletionStage = 170 Const Auto
    {Stage to set once the player's got enough Genetags to finish this portion of the quest}
EndGroup


Group Globals
    GlobalVariable Property COM_SMQ01_GenetagsCollected Mandatory Const Auto
    {Global var used to track how many Genetags the player has collected}

    GlobalVariable Property COM_SMQ01_GenetagsTotal Mandatory Const Auto
    {Global var used to know how many Genetags we want the player to collect}

    GlobalVariable Property COM_SMQ01_GenetagsSpawnTotal Mandatory Const Auto
    {Global var used to know how many Genetags we want the player to collect before spawning the boss}
EndGroup

Group Objects
    MiscObject Property COM_SMQ01_Genetag Mandatory Const Auto
    {Genetag misc object}
EndGroup

Event OnAliasInit()
    debug.trace("Player alias init'ed.")
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
   if auiStageID == GenetagSearchStage
       debug.trace("Proper stage set. Register player for inventory events.")
       UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
       RegisterPlayerForGentagPickup()
   endif
EndEvent

Function RegisterPlayerForGentagPickup()
    ;Do a check for pre-existing genetags here in the future
    AddInventoryEventFilter(COM_SMQ01_Genetag)
    debug.trace("Player registered for inventory events.")
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    debug.trace("Player grabbed genetag.")
    Quest myQuest = GetOwningQuest()
    if myQuest.GetStageDone(GenetagObjectiveStartStage)
	    myQuest.ModObjectiveGlobal(aiItemCount, COM_SMQ01_GenetagsCollected, GenetagObjIndex)
        SpawnBossOrEnd()
    Else
        COM_SMQ01_GenetagsCollected.Mod(1)
    EndIf
    debug.trace("COM_SMQ01_GenetagsCollected: " + COM_SMQ01_GenetagsCollected)
EndEvent

Function SpawnBossOrEnd()
    Quest myQuest = GetOwningQuest()
    int collected = COM_SMQ01_GenetagsCollected.GetValueInt()
	if collected == COM_SMQ01_GenetagsSpawnTotal.GetValue()
         myQuest.SetStage(SpawnBoss)
	elseif collected >= COM_SMQ01_GenetagsTotal.GetValue()
		 myQuest.SetStage(CompletionStage)
	endif
EndFunction