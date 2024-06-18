Scriptname LC082_BridgeDisableShipsTriggerScript extends ObjectReference
{Script for the LC082 Bridge Trigger.}
;
;Temporarily disables the Vigilance's escort ships while the player is on the Bridge, since static ships look bad.

Group AutofillProperties
	LC082_VigilanceQuestScript property LC082 Auto Const Mandatory
EndGroup


Event OnTriggerEnter(ObjectReference akActionRef)
	LC082.SetEscortShipsEnabled(False)  
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	LC082.SetEscortShipsEnabled(True)  
EndEvent