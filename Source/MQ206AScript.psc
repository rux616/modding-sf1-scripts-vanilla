Scriptname MQ206AScript extends Quest Conditional

InputEnableLayer Property MQ206AEnableLayer Auto Hidden

ReferenceAlias Property CompanionWhoDies Auto Const Mandatory
ReferenceAlias Property SarahMorgan Auto Const Mandatory
ReferenceAlias Property SamCoe Auto Const Mandatory
ReferenceAlias Property Barrett Auto Const Mandatory
Int Property MemorialTalkDoneStage = 500 Auto Const
Int Property MemorialReadyStage = 20 Auto Const
Int Property MemorialPlayerArrivedStage = 35 Const Auto
Int Property MemorialPlayerSkippedStage = 900 Const Auto
Int Property SonaStage = 1000 Const Auto
GlobalVariable Property MQ206AMemorialDays Mandatory Const Auto
GlobalVariable Property GameDaysPassed Mandatory Const Auto
Float Property MemorialGameDaysPassed Auto
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory
GlobalVariable Property COM_SQ01_SonaLeft Mandatory Const Auto

;how many people are at the Memorial Service (counting the Memorial Photo)?
Int Property MemorialTalksCount Auto Conditional
Int MemorialTalksTotalStandard = 10
Int MemorialTalksTotalSarah = 11
Int MemorialTalksTotalBarrett = 11
Int MemorialTalksTotalSam = 12

Event OnTimerGameTime(int aiTimerID)
    If aiTimerID == 10
	 ;whenever we hit the timer, also check to see if multiple days have passed and we should skip ahead
	 If GameDaysPassed.GetValue() >= MemorialGameDaysPassed
		SetStage(MemorialReadyStage)
      ;Every 24 hours, update the Wait for Memorial Service objective
      ElseIf ModObjectiveGlobal(-1, MQ206AMemorialDays, afTargetValue=0, abCountingUp=False)
          SetStage(MemorialReadyStage)
      Else
            StartTimerGameTime(24, 10)
      EndIf
    ElseIf aiTimerID == 20
        ;after the Memorial Service starts, if 24 hours passes and the player hasn't attended, advance the quest
        If GetStageDone(MemorialPlayerArrivedStage) == 0
            SetStage(MemorialPlayerSkippedStage)
        EndIf
    EndIf
EndEvent

Function CallMemorialTimer()
    ;after the Memorial Service starts, start timer for 24 hours past and the player hasn't attended
    StartTimerGameTime(24, 20)
EndFunction

Function CancelMemorialTimer()
    CancelTimerGameTime(20)
EndFunction

Function SetMemorialWaitGameDay()
	;we need to need to know what GameDay the Memorial should occur in case the player somehow waits more than 24 hours
	MemorialGameDaysPassed = GameDaysPassed.GetValue() + 5
    StartTimerGameTime(24, 10)
EndFunction

Function UpdateGameTimeOnSkip()
    CancelMemorialTimer()
    Float SkipTimeFloat = (MemorialGameDaysPassed - GameDaysPassed.GetValue()) * 24
    Int SkipTimeInt = Math.Floor(SkipTimeFloat)
    Game.PassTime(SkipTimeInt)
    Utility.Wait(0.1)
    SetStage(19)
EndFunction

;Set the number of people at the Service to the correct number based on who shows up
Function SetMemorialTalksTotal()
    Actor DeadCompanionREF = CompanionWhoDies.GetActorRef()

    If DeadCompanionREF == SarahMorgan.GetActorRef()
        MemorialTalksCount = MemorialTalksTotalSarah
        ;if Sona is available, add one
        If COM_Quest_SarahMorgan_Q01.GetStageDone(SonaStage) && (COM_SQ01_SonaLeft.GetValueInt() >= 1)
          MemorialTalksCount+=1
        EndIf
    ElseIf DeadCompanionREF == Barrett.GetActorRef()
        MemorialTalksCount = MemorialTalksTotalBarrett
    ElseIf DeadCompanionREF == SamCoe.GetActorRef()
        MemorialTalksCount = MemorialTalksTotalSam
    Else
        MemorialTalksCount = MemorialTalksTotalStandard
    EndIf
EndFunction

;every time you talk to someone at the memorial, reduce the count down
Function CheckMemorialTalks()
    MemorialTalksCount -= 1
    ;if we've talked to everyone, advance quest
    If MemorialTalksCount <= 0
        SetStage(MemorialTalkDoneStage)
    EndIf
EndFunction