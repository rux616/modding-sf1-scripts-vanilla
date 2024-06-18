Scriptname RI07_PlayerChairsAliasScript extends RefCollectionAlias

Group OnEnterFurniture_GeneralCheck
    Int Property iStageToSet01 Auto Const ; Stage 350
    Int Property iPreReqStage01 Auto Const  ; Stage 300
    Int Property iStartSceneStage Auto Const ; Stage 400
EndGroup
Group OnActivate_CombatCheckStages
    Int Property iStageToSet03 Auto Const ; Stage 370
    Int Property iPreReqStage03 Auto Const  ; Stage 300
EndGroup
Group Scenes
    Scene Property RI07_0400_Dalton_ConferenceRoomBScene Auto Const Mandatory
    Scene Property RI07_0400_Dalton_ConferenceRoomACScene Auto Const Mandatory
EndGroup
Group TrackingGlobals
    GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory
    GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory
    GlobalVariable Property RI05_UlaruDead Auto Const Mandatory
EndGroup

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)

    Quest OwningQuest = GetOwningQuest()

    If akActionRef == Game.GetPlayer()
        If OwningQuest.GetStageDone(iPreReqStage01) ; 300
            OwningQuest.SetStage(iStageToSet01) ; 350
        EndIf

        If OwningQuest.GetStageDone(iStartSceneStage)
            If (RI05_Track_PlayerSidedWithMasako.GetValue() == 1 && RI05_UlaruDead.GetValue() == 0) || RI05_Track_PlayerSidedWithUlaru.GetValue() == 1 
                RI07_0400_Dalton_ConferenceRoomACScene.Start()
            EndIf

            If RI05_Track_PlayerSidedWithMasako.GetValue() == 1 && RI05_UlaruDead.GetValue() == 1
                RI07_0400_Dalton_ConferenceRoomBScene.Start()
            EndIf
        EndIf

    EndIf

EndEvent

Event OnActivate(ObjectReference akSenderRef,ObjectReference akActionRef)

    Actor PlayerRef = Game.GetPlayer() 
    Quest OwningQuest = GetOwningQuest()

    If akActionRef == PlayerRef

         If OwningQuest.GetStageDone(iStageToSet03) ; 370
            (OwningQuest as RI07_QuestScript).FreezeControlsMeeting()
        EndIf

        If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03) ; 300
            OwningQuest.SetStage(iStageToSet03) ; 370
        EndIf

    EndIf

EndEvent