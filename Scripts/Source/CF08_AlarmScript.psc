Scriptname CF08_AlarmScript extends Quest

WwiseEvent Property Wwise_Event_OBJ_Alarm_Ship_Battle_Prep Auto Const Mandatory

ObjectReference Property CF08_SysDef_WwiseAlarmRef Auto Const Mandatory

int alarmInstanceID

Function PlayAlarm(bool abPlay)
    if abPlay == true
        alarmInstanceID = Wwise_Event_OBJ_Alarm_Ship_Battle_Prep.Play(CF08_SysDef_WwiseAlarmRef)
    else
        WwiseEvent.StopInstance(alarmInstanceID)
    endif
endFunction

