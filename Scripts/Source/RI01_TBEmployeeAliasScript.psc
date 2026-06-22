Scriptname RI01_TBEmployeeAliasScript extends ReferenceAlias

Int Property iStageToSet Auto Const Mandatory
Int Property iPreReqStage Auto Const Mandatory

Event OnDying(ObjectReference akKiller)

Quest OwningQuest = GetOwningQuest()
If OwningQuest.GetStageDone(iPreReqStage)
    OwningQuest.SetStage(iStageToSet)
    Self.Clear()
EndIf

EndEvent