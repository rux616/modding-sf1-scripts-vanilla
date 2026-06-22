Scriptname SecuritySystemScript extends ObjectReference Const
{Extend this script to handle security system events.}

Group DefaultProperties CollapsedOnBase
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
    Location Property MyLocation Mandatory Const Auto
EndGroup

Event OnLoad()
    RegisterForCustomEvent(SQ_Parent, "SQ_AlarmTriggeredOn")
    RegisterForCustomEvent(SQ_Parent, "SQ_AlarmTriggeredOff")
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOn(SQ_ParentScript source, Var[] akArgs)
    ;akArgs[0] alarmRef.GetCurrentLocation()
    ;akArgs[1] SQ_AlarmQuest
    ;akArgs[2] alarmRef
    ;akArgs[3] alarmActor
    Location alarmLocation = akArgs[0] as Location
    SQ_AlarmScript alarmQuest = akArgs[1] as SQ_AlarmScript
    ; etc. if you need other parameters

    if alarmLocation == MyLocation
       ; >> ADD YOUR ALARM TRIGGERED FUNCTIONALITY HERE <<
    endif
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOff(SQ_ParentScript source, Var[] akArgs)
    ;akArgs[0] alarmRef.GetCurrentLocation()
    ;akArgs[1] SQ_AlarmQuest
    ;akArgs[2] alarmRef
    Location alarmLocation = akArgs[0] as Location
    SQ_AlarmScript alarmQuest = akArgs[1] as SQ_AlarmScript
    ; etc. if you need other parameters

    if alarmLocation == MyLocation
       ; >> ADD YOUR ALARM END FUNCTIONALITY HERE <<
    endif
EndEvent
