Scriptname Ri08_QuestScript extends Quest

InputEnableLayer MeetingLayer

Function FreezeControlsMeeting()

    Game.GetPlayer().StopCombatAlarm()
    MeetingLayer = InputEnableLayer.Create()
    MeetingLayer.DisablePlayerControls(abMovement = True)

EndFunction

Function UnfreezeControlsMeeting()

    MeetingLayer = None

EndFunction

Int Property iSetStage Auto Const Mandatory

Function SetTimer() 
    StartTimer(10, 1)
EndFunction

Event OnTimer(int aiTimerID)
    SetStage(iSetStage)
EndEvent

; Calculating votes.
; Masako's votes for reference. Her votes aren't tracked in stages but globals are adjusted in stage 200 to account for them.
; - YES to acquire Infinty LTD
; - YES to continue neuroamp research
; - YES to continue being CEO
Group VotingGlobals
    GlobalVariable Property RI08_InfinityNayCount Auto Const Mandatory
    GlobalVariable Property RI08_InfinityYayCount Auto Const Mandatory
    GlobalVariable Property RI08_AcquiredInfinity Auto Const Mandatory
    GlobalVariable Property RI08_NeuroampNayCount Auto Const Mandatory
    GlobalVariable Property RI08_NeuroampYayCount Auto Const Mandatory
    GlobalVariable Property RI08_ContinuedNeuroampResearch Auto Const Mandatory
    GlobalVariable Property RI08_MasakoNayCount Auto Const Mandatory
    GlobalVariable Property RI08_MasakoYayCount Auto Const Mandatory
    GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory
EndGroup

Group UlaruVotes
    Int Property iUlaruYESInfinityLTD Auto Const Mandatory 
    Int Property iUlaruNOInfinityLTD Auto Const Mandatory
    Int Property iUlaruYESNeuroamps Auto Const Mandatory
    Int Property iUlaruNONeuroamps Auto Const Mandatory
    Int Property iUlaruYESMasako Auto Const Mandatory
    Int Property iUlaruNOMasako Auto Const Mandatory
EndGroup

GlobalVariable Property RI05_UlaruDead Auto Const Mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory
Int Property iUlaruFired Auto Const Mandatory
Int Property iMasakoFired Auto Const Mandatory

Function CalculateVotes()
Debug.Trace(Self + "RI08 Function Calcuate Votes called.")

    If RI08_InfinityYayCount.GetValue() >= RI08_InfinityNayCount.GetValue()
        RI08_AcquiredInfinity.SetValue(1)
    Else
        RI08_AcquiredInfinity.SetValue(0)
    EndIf

    If RI08_NeuroampYayCount.GetValue() >= RI08_NeuroampNayCount.GetValue()
        RI08_ContinuedNeuroampResearch.SetValue(1)
    Else
        RI08_ContinuedNeuroampResearch.SetValue(0)
    EndIf

    If RI08_MasakoYayCount.GetValue() >= RI08_MasakoNayCount.GetValue()
        RI08_MasakoRemainedCEO.SetValue(1)
        RI_RadiantQuestGiver.SetValue(1)
    Else
        RI08_MasakoRemainedCEO.SetValue(0)
        RI_RadiantQuestGiver.SetValue(2)
    EndIf

EndFunction

; Function called on Stage 980 when Ularu is fired to remove her vote from the totals.
Function ModifyVotes()
Debug.Trace(Self + "RI08 Function Modify Values called")

    ; Modify globals for voting if Ularu is fired.
    If GetStageDone(iUlaruFired)
        If GetStageDone(iUlaruYESInfinityLTD)
            RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1)
        Else
            RI08_InfinityNayCount.SetValue(RI08_InfinityNayCount.GetValue() - 1)
        EndIf
        If GetStageDone(iUlaruYESNeuroamps)
            RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1)
        Else
            RI08_NeuroampNayCount.SetValue(RI08_NeuroampNayCount.GetValue() - 1)
        EndIf
        If GetStageDone(iUlaruYESMasako)
            RI08_MasakoYayCount.SetValue(RI08_MasakoYayCount.GetValue() - 1)
        Else
            RI08_MasakoNayCount.SetValue(RI08_MasakoNayCount.GetValue() - 1)
        EndIf
    EndIf
    
    ; Modfiy globals for voting if Masako is fired.
    If GetStageDone(iMasakoFired)
        RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1)
        RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1)
    EndIf

    CalculateVotes()

EndFunction