Scriptname MQ207CSupportQuestScript extends Quest
{Quest script for MQ207C_Support, the quest that manages the pre- and post-quest dialogue for MQ207C.}

Group AutofillProperties
	ReferenceAlias property Alias_NishinaExt_I_ExteriorDoor Auto Const Mandatory
	Scene property MQ207C_110_EntranceIntercom Auto Const Mandatory
EndGroup


Event OnQuestInit()
	RegisterForRemoteEvent(Alias_NishinaExt_I_ExteriorDoor, "OnActivate")
EndEvent

;The exterior door is initially locked; the player has to speak to Ethan over the intercom to get him to unlock it.
;As a convenience, if the player activates the locked door, forward the activation event to the intercom to start the dialogue.
Event ReferenceAlias.OnActivate(ReferenceAlias source, ObjectReference akActivator)
	if ((source == Alias_NishinaExt_I_ExteriorDoor) && (akActivator == Game.GetPlayer()))
		MQ207C_110_EntranceIntercom.Start()
	EndIf
EndEvent

Function UnregisterForExteriorDoorEvents()
	UnregisterForRemoteEvent(Alias_NishinaExt_I_ExteriorDoor, "OnActivate")
EndFunction
