Scriptname CityCYRedTape01QuestScript extends Quest

GlobalVariable Property City_CY_RedTape01Resource01Count Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01Resource01Total Mandatory Const Auto
MiscObject Property InorgCommonIron Mandatory Const Auto
Int Property GatherResourcesStage = 100 Const Auto
Int Property IronQTStage = 110 Const Auto
Int Property GatheredResourcesCompleteStage = 200 Const Auto
Int Property TrevorApplicationPlanStage = 250 Const Auto
Int Property ResourceObjective = 100 Const Auto
Int Property TurnInObjective = 200 Const Auto
ReferenceAlias Property Player Mandatory Const Auto
ReferenceAlias Property DepositBin Mandatory Const Auto
RefCollectionAlias Property IronDeposits Mandatory Const Auto



;Starts the RegisterPlayerForResourceTracking() on the player script
Function RegisterPlayerforInventoryFilter(bool bRegister=true)
    debug.trace(self + " RegisterPlayerforInventoryFilter")
    CityCYRedTape01PlayerScript myPlayerScript = Player as CityCYRedTape01PlayerScript
    myPlayerScript.RegisterPlayerForResourceTracking(bRegister)
EndFunction

;Check to see if the player has the required amount of resources, and updates the objective count accordingly, Completing it if fulfilled.
;This will be run when the we start tracking the resources on the player script to see if the player already has anything, and whenever 
;they add the conditioned resource type via CityCYRedTape01PlayerScript.
Function ResourceCheck()
    debug.trace(self + " ResourceCheck")
    City_CY_RedTape01Resource01Count.SetValue(Game.GetPlayer().GetItemCount(InorgCommonIron))
    UpdateCurrentInstanceGlobal(City_CY_RedTape01Resource01Count)
    Float fResourceCount = City_CY_RedTape01Resource01Count.GetValue()
    Float fResourceTotal = City_CY_RedTape01Resource01Total.GetValue()
    If fResourceCount >= fResourceTotal
        If IsObjectiveDisplayed(TurnInObjective) == False
            SetStage(GatheredResourcesCompleteStage)
            SetObjectiveDisplayed(ResourceObjective, False)
            SetObjectiveDisplayed(TurnInObjective, True, True)
            DepositBin.GetRef().BlockActivation(False, False)
        EndIf
    ElseIf fResourceCount >= (fResourceTotal - 5) && fResourceCount < fResourceTotal
        If !GetStageDone(IronQTStage)
            IronDeposits.RefillAlias()
            SetStage(IronQTStage)
        EndIf
        SetObjectiveDisplayed(ResourceObjective, True, True)
        SetObjectiveDisplayed(TurnInObjective, False)
        DepositBin.GetRef().BlockActivation(True, True)
    Else
        ;Redisplay the objective if the player no longer has the required amount.
        SetObjectiveDisplayed(ResourceObjective, True, True)
        SetObjectiveDisplayed(TurnInObjective, False)
        DepositBin.GetRef().BlockActivation(True, True)
    EndIf
EndFunction

Event OnStageSet(int auiStageID, int auiItemID)
    debug.trace(self + " auiStageID=" + auiStageID)
    If auiStageID == GatherResourcesStage
        RegisterPlayerforInventoryFilter(true)
    ElseIf auiStageID == TrevorApplicationPlanStage
        RegisterPlayerforInventoryFilter(false)
    EndIf
EndEvent


;Debug: Gives the player the required number of resources for this quest.
Function DebugGiveResources()
    Game.GetPlayer().AddItem(InorgCommonIron, City_CY_RedTape01Resource01Total.GetValue() as Int)
EndFunction