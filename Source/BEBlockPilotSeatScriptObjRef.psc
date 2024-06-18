Scriptname BEBlockPilotSeatScriptObjRef extends ObjectReference
{Script placed on a ship's pilot seat. Blocks players from sitting in the seat and taking over the ship. ObjectReference Variant}

Message property PilotSeatNotAuthorizedMessage Auto Const Mandatory
{Message to display when the player tries to sit in the ship's pilot seat while the block is in place.}


Event OnInit()
	BlockActivation(True, False)
EndEvent

Event OnActivate(ObjectReference akActivator)
	PilotSeatNotAuthorizedMessage.Show()
EndEvent