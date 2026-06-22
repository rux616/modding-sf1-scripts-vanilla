Scriptname CityCYRedTape01DepositBinScript extends ReferenceAlias

Keyword Property LinkCustom01 Mandatory Const Auto
MiscObject Property InorgCommonIron Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01Resource01Total Mandatory Const Auto

;If the player is on the correct stage of the quest, and has enough of the resource to turn in, remove it and set the next stage
Event OnActivate(ObjectReference akActionRef)
    Actor myPlayer = Game.GetPlayer()
    If akActionRef == myPlayer
        Quest myQuest = GetOwningQuest()
        CityCYRedTape01QuestScript myQuestScript = myQuest as CityCYRedTape01QuestScript
        If  myQuest.GetStageDone(myQuestScript.GatheredResourcesCompleteStage) && !myQuest.GetStageDone(myQuestScript.TrevorApplicationPlanStage)
            Int iResource01Total = City_CY_RedTape01Resource01Total.GetValue() as Int
            If myPlayer.GetItemCount(InorgCommonIron) >= iResource01Total
                myQuest.SetStage(myQuestScript.TrevorApplicationPlanStage)
                myPlayer.RemoveItem(InorgCommonIron, iResource01Total)
                ;Enables the rubble in the mine cart
                ObjectReference myRef = GetRef().GetLinkedRef(LinkCustom01)
                myRef.Enable()
                GetRef().BlockActivation(True, True)
            EndIf
        EndIf
    EndIf
EndEvent