Scriptname MQ204ShipWorkshopScript extends ReferenceAlias

Int Property BuildArmillaryPrereqStage=510 Const Auto
Int Property BuildArmillaryTurnOffStage=620 Const Auto
Int Property BuildArmillaryTutorialStage=520 Const Auto

Event OnWorkshopMode(bool aStart)
    Quest myQuest = GetOwningQuest()
    If (myQuest.GetStageDone(BuildArmillaryPrereqStage)==True) && (myQuest.GetStageDone(BuildArmillaryTurnOffStage)==False) && (myQuest.GetStageDone(BuildArmillaryTutorialStage)==False)
        myQuest.SetStage(BuildArmillaryTutorialStage)
    EndIf
EndEvent