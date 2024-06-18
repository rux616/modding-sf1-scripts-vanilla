Scriptname LC008SlaytonAlarm extends SecuritySystemScript Const

Keyword Property LinkCustom02 Const Auto
{Link chain to all the Security Gates}

Keyword Property LinkCustom03 Const Auto
{Link to alarm klaxon sound}

Float Property AlarmSoundDuration = 10.0 Const Auto
{Desired duration of the alarm sound}

Event SQ_ParentScript.SQ_AlarmTriggeredOn(SQ_ParentScript source, Var[] akArgs)
    Location alarmLocation = akArgs[0] as Location
    if alarmLocation == MyLocation
        ;Close Gates
        ;ObjectReference[] gates = GetLinkedRefChain(LinkCustom02)
        ;int index = 0
        ;While (index < gates.Length)
        ;    gates[index].setopen(false)
        ;    index += 1
        ;EndWhile
        ;Make alarm noises
        Debug.Trace("Alarm Sound Started")
        ;GetLinkedRef(LinkCustom03).Enable()
        StartTimer(AlarmSoundDuration)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    ;GetLinkedRef(LinkCustom03).Disable()
    debug.Trace("Alarm Sound Stopped")
EndEvent

