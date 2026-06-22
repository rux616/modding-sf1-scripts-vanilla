Scriptname RI07_OperatingTableAliasScript extends ReferenceAlias

Int Property iActivatedChairStage Auto Const Mandatory
Int Property iEnteredChairStage Auto Const Mandatory
Int Property iPreReqStage Auto Const Mandatory
Int Property iTurnOffStage Auto Const Mandatory

Event OnEnterFurniture(Actor akActionRef)

    Quest OwningQuest = GetOwningQuest()

    If akActionRef == Game.GetPlayer() && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
        OwningQuest.SetStage(iEnteredChairStage)
    EndIf

EndEvent

Event OnActivate(ObjectReference akActionRef)

    Quest OwningQuest = GetOwningQuest()
    Actor PlayerRef = Game.GetPlayer()
    If akActionRef == PlayerRef && PlayerRef.GetCombatState() == 0 && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
        OwningQuest.SetStage(iActivatedChairStage)
    EndIf

EndEvent