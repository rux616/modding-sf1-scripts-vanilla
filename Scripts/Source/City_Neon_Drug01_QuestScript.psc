Scriptname City_Neon_Drug01_QuestScript extends Quest

ReferenceAlias Property Drug01_NesharAlias Auto Const
ReferenceAlias Property Drug01_NeonJailDoor Auto Const

Event OnQuestInit()
	RegisterForRemoteEvent(Drug01_NeonJailDoor, "OnActivate")
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias source, ObjectReference akActivator)
	if ((source == Drug01_NeonJailDoor) && (akActivator == Game.GetPlayer()))
		Drug01_NesharAlias.GetActorRef().Activate(Game.GetPlayer())
	EndIf
EndEvent

Function UnregisterForExteriorDoorEvents()
	UnregisterForRemoteEvent(Drug01_NeonJailDoor, "OnActivate")
EndFunction