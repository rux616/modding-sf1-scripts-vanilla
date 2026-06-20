Scriptname SFBGS00D:SFFL_SE_KT01Script extends Quest

int InstanceID
WwiseEvent Property OBJ_Alarm_BoardingAlert Auto Const Mandatory

Function PlayAlarm()
	InstanceID = OBJ_Alarm_BoardingAlert.Play(Game.GetPlayer())
EndFunction

Function StopAlarm()
	WwiseEvent.StopInstance(InstanceID)
EndFunction