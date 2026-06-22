Scriptname ShuttleBayDoorManagerScript extends ObjectReference
{Script on the Shuttle Bay Door Manager dummy object. Manages the system of doors.}

Group AudioProperties
	WWiseEvent property DRS_IndBayDoorShield01_Open Auto Const Mandatory
	WWiseEvent property DRS_IndBayDoorShield01_Close Auto Const Mandatory
EndGroup


;Custom Events
CustomEvent OpenShuttleBayDoorsEvent
CustomEvent CloseShuttleBayDoorsEvent

Function OpenShuttleBayDoors()
	SendCustomEvent("OpenShuttleBayDoorsEvent", None)
	DRS_IndBayDoorShield01_Open.Play(Self)
EndFunction

Function CloseShuttleBayDoors()
	SendCustomEvent("CloseShuttleBayDoorsEvent", None)
	DRS_IndBayDoorShield01_Close.Play(Self)
EndFunction