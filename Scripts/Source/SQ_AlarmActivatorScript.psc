Scriptname SQ_AlarmActivatorScript extends ObjectReference conditional
{script for the alarm activator; allows native terminals control}

Keyword Property SQ_AlarmStoryEvent Auto Const Mandatory
{send story event on load}

Message Property SQ_AlarmActivatorDisabledMessage auto const mandatory
{ message when alarm is disabled }

Message Property SQ_AlarmActivatorBlockedMessage auto const mandatory
{ message when alarm is disabled }

Guard AlarmDisabledGuard
bool Property AlarmDisabled = false auto conditional RequiresGuard(AlarmDisabledGuard)
{TRUE if alarm is disabled}

WwiseEvent Property AlarmSoundEvent Const Auto
{Alarm sound that should start playing when the alarm is turned on.}

Keyword Property LinkCustom01 Const Auto
{Link to Optional sound source for the alarm sound}

SQ_AlarmScript property myAlarmQuest auto hidden ; set OnLoad, or by SQ_Alarm on startup

Event OnLoad()
    ; activation is always blocked so script can handle activation
    BlockActivation(abBlocked=true)
    StartAlarmQuest()
EndEvent

; TRUE = turn on alarm
; FALSE = turn off alarm
Function TurnOnAlarm(bool turnOn=true)
    debug.trace(self + " TurnOnAlarm " + turnOn)
    SetOpen(turnOn)
    if myAlarmQuest == NONE || myAlarmQuest.IsRunning() == false
        if(AlarmSoundEvent)
            if(GetLinkedRef(LinkCustom01))
                ;If there is a linked reference, play the sound from there.
                AlarmSoundEvent.Play(GetLinkedRef(LinkCustom01))
            Else
                ;otherwise play the sound from the reference itself.
                AlarmSoundEvent.Play(self)
            endif
        EndIf
        StartAlarmQuest()
    endif
    if myAlarmQuest
        myAlarmQuest.SetAlarmed(turnOn)
    endif
endFunction

; TRUE = alarm is shut off and can't be triggered
Function DisableAlarm(bool disableAlarm=true)
    LockGuard AlarmDisabledGuard
        AlarmDisabled = disableAlarm
        if disableAlarm
            TurnOnAlarm(false)
        endif
    endLockGuard
endFunction

auto state ready
    Event OnActivate(ObjectReference akActionRef)
        debug.trace(self + " OnActivate " + akActionRef)
        bool disabled = GetAlarmDisabled()
        if akActionRef == Game.GetPlayer()
            gotostate("busy")
            if disabled
                ; error message
                SQ_AlarmActivatorDisabledMessage.Show()
            elseif GetOpenState() >= 3
                ; error message
                SQ_AlarmActivatorBlockedMessage.Show()
            else
                ; allow player to turn off but not on
                TurnOnAlarm(false)
            endif
            gotostate("ready")
        elseif disabled == false
            TurnOnAlarm()
        endif
    EndEvent
EndState

state busy
    Event OnActivate(ObjectReference akActionRef)
        debug.trace(self + " OnActivate " + akActionRef)
        bool disabled = GetAlarmDisabled()
        if akActionRef != Game.GetPlayer() && disabled == false
            TurnOnAlarm()
        endif
    EndEvent
EndState

bool Function GetAlarmDisabled()
    LockGuard AlarmDisabledGuard
        return AlarmDisabled
    endLockGuard
endFunction

function StartAlarmQuest()
	Quest[] alarmQuests = SQ_AlarmStoryEvent.SendStoryEventAndWait(akRef1 = self, akLoc=GetCurrentLocation())
    if alarmQuests.Length > 0
        myAlarmQuest =alarmQuests[0] as SQ_AlarmScript
    endif
endFunction