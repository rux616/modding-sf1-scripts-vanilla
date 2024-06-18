Scriptname RI07_IDCardReadersScript extends RefCollectionAlias

Int Property iStageToSet Auto Const Mandatory
Int Property iPreReqStage Auto Const Mandatory
Int Property iTurnOffStage Auto Const Mandatory

Event OnLoad(ObjectReference akSenderRef)
    RegisterForCustomEvent(akSenderRef as IDCardReader, "IDReaderActivatedFailure")
EndEvent

Event IDCardReader.IDReaderActivatedFailure(IDCardReader akSender, Var[] kargs)
    
    Quest CurrentQuest = GetOwningQuest()

    If CurrentQuest.GetStageDone(iPreReqStage) && !CurrentQuest.GetStageDone(iTurnOffStage)
        CurrentQuest.SetStage(iStageToSet)
    EndIf

EndEvent