Scriptname RI08_PlayerChairsAliasScript extends RefCollectionAlias

Group OnEnterFurniture_GeneralCheck
    Int Property iStageToSet01 Auto Const ; Stage 910
    Int Property iPreReqStage01 Auto Const ; Stage 918
    Int Property iStartSceneStage Auto Const ; Stage 910
EndGroup
Group OnEnterFurniture_ExtraCheckForRI08
    Int Property iStageToSet02 Auto Const ; Stage 909
    Int Property iPreReqStage02 Auto Const  ; Stage 900
    Int Property iTurnOffStage02 Auto Const  ; Stage 918
EndGroup
Group OnActivate_CombatCheckStages
    Int Property iStageToSet03 Auto Const ; Stage 905
    Int Property iPreReqStage03 Auto Const ; Stage 918
EndGroup
Group Scenes
    Scene Property RI08_0910_Meeting_UlaruWinsScene Auto Const Mandatory
    Scene Property RI08_0910_Meeting_MasakoWinsScene Auto Const Mandatory
EndGroup
Group TrackingGlobals
    GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory
    GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory
    GlobalVariable Property RI05_UlaruDead Auto Const Mandatory
EndGroup

; iStageToSet01 = 910 Player sat in chair - Start meeting scene
; iPreReqStage01 = 918 Everyone is seated
; iStageToSet02 = 909 Player sat in chair prior to everyone arriving
; iPreReqStage02 = 900 Attend the Meeting
; iTurnOffStage02 = 918 Everyone is seated
; iStartSceneStage = 910 Player sat in chair - Start meetng scene

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)

    Quest OwningQuest = GetOwningQuest()

    If akActionRef == Game.GetPlayer()
        If OwningQuest.GetStageDone(iPreReqStage01)
            OwningQuest.SetStage(iStageToSet01)
        EndIf
        If OwningQuest.GetStageDone(iPreReqStage02) && !OwningQuest.GetStageDone(iTurnOffStage02)
            OwningQuest.SetStage(iStageToSet02)
        EndIf
        If OwningQuest.GetStageDone(iStartSceneStage)
            If RI05_Track_PlayerSidedWithMasako.GetValue() == 1
                RI08_0910_Meeting_MasakoWinsScene.Start()
            Else 
                RI08_0910_Meeting_UlaruWinsScene.Start()
            EndIf
        EndIf
    EndIf

EndEvent

Event OnActivate(ObjectReference akSenderRef,ObjectReference akActionRef)

    Actor PlayerRef = Game.GetPlayer() 
    Quest OwningQuest = GetOwningQuest()

    If akActionRef == PlayerRef

         If OwningQuest.GetStageDone(iStageToSet03) ; 905
            (OwningQuest as RI08_QuestScript).FreezeControlsMeeting()
        EndIf

        If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03)
            OwningQuest.SetStage(iStageToSet03)
        EndIf

    EndIf
EndEvent