Scriptname TestActivatorTeleportDoor extends ObjectReference Const

ObjectReference Property TeleportTargetRef Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	akActionRef.moveto(TeleportTargetRef)
EndEvent