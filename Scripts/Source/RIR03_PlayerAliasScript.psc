Scriptname RIR03_PlayerAliasScript extends ReferenceAlias

Keyword Property RI_Outfit_BusinessAttireKeyword Auto Const Mandatory
Keyword Property RI_Outfit_FCGuardAttireKeyword Auto Const Mandatory
Keyword Property RI_Outfit_UCGuardAttireKeyword Auto Const Mandatory
Keyword Property RI_Outfit_MiscGuardAttireKeyword Auto Const Mandatory
Keyword Property RI_Outfit_NeonGuardAttireKeyword Auto Const Mandatory

Int Property iStageToSet Auto Const Mandatory
Int Property iPrereqStage Auto Const Mandatory
Int Property iTurnOffStage Auto Const Mandatory

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
Debug.Trace(Self + "Player wore item")
    Quest OwningQuest = GetOwningQuest()

    If OwningQuest.GetStageDone(iPrereqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
    Debug.Trace(Self + " PreReq is done: " + iPrereqStage + " TurnOff is NOT done: " + iTurnOffStage)
        If akBaseObject.HasKeyword(RI_Outfit_BusinessAttireKeyword) || akBaseObject.HasKeyword(RI_Outfit_FCGuardAttireKeyword) || akBaseObject.HasKeyword(RI_Outfit_UCGuardAttireKeyword) || akBaseObject.HasKeyword(RI_Outfit_MiscGuardAttireKeyword) || akBaseObject.HasKeyword(RI_Outfit_NeonGuardAttireKeyword)
        Debug.Trace(Self + "Item equipped had keyword")
            OwningQuest.SetStage(iStageToSet)
        EndIf
    EndIf
EndEvent
