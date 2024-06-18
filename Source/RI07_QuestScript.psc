Scriptname RI07_QuestScript extends Quest

InputEnableLayer NeurosurgeryLayer

Function FreezeControls()

    Game.GetPlayer().StopCombatAlarm()
    NeurosurgeryLayer = InputEnableLayer.Create()
    NeurosurgeryLayer.DisablePlayerControls(abLooking = True)
    ;Game.ForceFirstPerson()

EndFunction

Function UnfreezeControls()

    NeurosurgeryLayer = None

EndFunction

InputEnableLayer MeetingLayer

Function FreezeControlsMeeting()

    Game.GetPlayer().StopCombatAlarm()
    MeetingLayer = InputEnableLayer.Create()
    MeetingLayer.DisablePlayerControls(abMovement = True)

EndFunction

Function UnfreezeControlsMeeting()

    MeetingLayer = None

EndFunction

Int Property iStageToSet Auto Const
Int Property iTurnOffStage Auto Const

Function StartDeMarcusTimer()
    StartTimer(60, 1)
EndFunction

Event OnTimer(int aiTimerID)
    If aiTimerID == 1 && !GetStageDone(iTurnOffStage)
        SetStage(iStageToSet)
    EndIf
EndEvent