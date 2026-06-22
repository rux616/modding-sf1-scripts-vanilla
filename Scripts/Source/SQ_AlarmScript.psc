Scriptname SQ_AlarmScript extends Quest Conditional

ReferenceAlias property AlarmNPC auto const mandatory
{ NPC that will try to trigger an alarm }

ReferenceAlias property Alarm auto const mandatory
{ alarm that NPC will try to reach }

RefCollectionAlias property Alarms auto const mandatory
{ collection of all alarms }

RefCollectionAlias property AlarmNPCs auto const mandatory
{ collection of NPCs who could trigger an alarm }

RefCollectionAlias property AlarmCameras auto const mandatory
{ collection of security cameras who could trigger an alarm }

ActorValue property SQ_Alarmed auto const mandatory
{ actor value to set on alarmed NPCs }

ActorValue property Suspicious auto const mandatory
{ actor value to set on alarmed NPCs }

Scene property SQ_AlarmScene auto const mandatory
{ scene to start when an NPC wants to trigger an alarm }

SQ_ParentScript property SQ_Parent auto const mandatory
{ for custom events }

bool alarmTriggered = false conditional

Event OnQuestInit()
    debug.trace(self + " OnQuestInit")
    ; register for alarm NPCs
    RegisterForRemoteEvent(AlarmNPCs, "OnCombatStateChanged")
    RegisterForRemoteEvent(AlarmNPCs, "OnUnload")
    RegisterForRemoteEvent(Alarms, "OnOpen")
    RegisterForRemoteEvent(Alarms, "OnClose")
    RegisterForRemoteEvent(AlarmCameras, "OnCombatStateChanged")
    RegisterForRemoteEvent(AlarmCameras, "OnUnload")
EndEvent

Event OnQuestStarted()
    ; let all alarms know what their quest is
    int i = 0
    while i < Alarms.GetCount()
        SQ_AlarmActivatorScript theAlarm = Alarms.GetAt(i) as SQ_AlarmActivatorScript
        if theAlarm
            theAlarm.myAlarmQuest = self
        endif
        i += 1
    EndWhile
EndEvent

Guard triggerAlarmLock ProtectsFunctionLogic
function TriggerAlarmAttempt(Actor alarmActor)
    LockGuard triggerAlarmLock
        if alarmActor && alarmTriggered == false && SQ_AlarmScene.IsPlaying() == false
            debug.trace(self + " TriggerAlarmAttempt for " + alarmActor)
            AlarmNPC.ForceRefTo(alarmActor)
            Alarm.ClearAndRefillAlias()
            debug.trace(self + "  Alarm=" + Alarm.GetRef())
            SQ_AlarmScene.Start()
        endif
    EndLockGuard
EndFunction

function TriggerCameraAlarm(Actor alarmCamera)
    LockGuard triggerAlarmLock
        if alarmCamera && alarmTriggered == false
            debug.trace(self + " TriggerCameraAlarm for " + alarmCamera)
            SQ_AlarmScene.Stop()
            AlarmNPC.ForceRefTo(alarmCamera)
            Alarm.ClearAndRefillAlias()
            debug.trace(self + "  Alarm=" + Alarm.GetRef())
            SetAlarmed(true)
        endif
    EndLockGuard

EndFunction

Guard AlarmTriggeredLock ProtectsFunctionLogic

function SetAlarmed(bool bAlarmed = true)
    debug.trace(self + " SetAlarmed " + bAlarmed)
    LockGuard AlarmTriggeredLock
        ; no need to do this if we're already in the state
        if bAlarmed != alarmTriggered
            alarmTriggered = bAlarmed
            debug.trace(self + " changing state to alarmTriggered=" + alarmTriggered)
            
            if bAlarmed
                SQ_Parent.SendAlarmTriggeredOnEvent(Alarm.GetRef(), AlarmNPC.GetActorRef(), self)
            Else
                SQ_Parent.SendAlarmTriggeredOffEvent(Alarm.GetRef(), self)
            endif
            int i = 0
            while i < AlarmNPCs.GetCount()
                actor theActor = AlarmNPCs.GetActorAt(i)
                if theActor
                    theActor.SetValue(SQ_Alarmed, bAlarmed as int)
                    if bAlarmed && theActor.GetValue(Suspicious) < 1
                        theActor.SetValue(Suspicious, 1)
                    endif
                    theActor.EvaluatePackage()
                endif
                i += 1
            endWhile
            ; update all Alarms to new state
            i = 0
            while i < Alarms.GetCount()
                SQ_AlarmActivatorScript theAlarm = Alarms.GetAt(i) as SQ_AlarmActivatorScript
                if theAlarm
                    theAlarm.SetOpen(bAlarmed)
                endif
                i += 1
            EndWhile
        Else
            debug.trace(self + " alarmTriggered=" + alarmTriggered + " - no need to do anything")
        endif
    EndLockGuard
endFunction

Event RefCollectionAlias.OnOpen(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akActionRef)
    debug.Trace(self + " OnOpen " + akSenderRef + " by " + akActionRef)
    SetAlarmed(true)
endEvent

Event RefCollectionAlias.OnCombatStateChanged(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)
    debug.trace(self + " OnCombatStateChanged akCollection=" + akCollection + " akSenderRef=" + akSenderRef + " " + aeCombatState)
    ; if actor is in direct combat, start the alarm scene
    if aeCombatState == 1
        if akCollection == AlarmNPCs
            TriggerAlarmAttempt(akSenderRef as Actor)
        elseif akCollection == AlarmCameras
            TriggerCameraAlarm(akSenderRef as Actor)
        endif
    endif
endEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akCollection, ObjectReference akSenderRef)
    debug.trace(self + " OnUnload " + akSenderRef)
    CheckForShutdown()
endEvent

function CheckForShutdown()
    if IsRunning()
        int deadorunloaded = AlarmNPCs.GetCountDeadOr3DUnloaded() + AlarmCameras.GetCountDeadOr3DUnloaded()
        int total = AlarmNPCs.GetCount() + AlarmCameras.GetCount()
        debug.trace(self + " CheckForShutdown dead/unloaded=" + deadorunloaded + " total=" + total)
        ; check if whole collection is unloaded - if so, stop quest
        if deadorunloaded >= total
            debug.trace(self + " All alarm NPCs dead or unloaded - stopping")
            SetAlarmed(false)
            Stop()
        Else
            ; run timer to check again after a while
            StartTimer(10.0)
        endif
    endif
EndFunction

Event OnTimer(int aiTimerID)
    CheckForShutdown()
endEvent