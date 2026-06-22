Scriptname RI07_MarketingTriggerAliasScript extends ReferenceAlias

Armor Property RI07_ResearchUniform Auto Const Mandatory
Int Property iStageToSet Auto Const Mandatory
Int Property iGetStageDone Auto Const Mandatory
Int Property iPreReqStage Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
    Actor PlayerRef = Game.GetPlayer()
    Quest OwningQuest = GetOwningQuest()
    If akActionRef == PlayerRef && PlayerRef.IsEquipped(RI07_ResearchUniform) == 0 && !OwningQuest.GetStageDone(iGetStageDone) && OwningQuest.GetStageDone(iPreReqStage)
        OwningQuest.SetStage(iStageToSet)
    EndIf
EndEvent