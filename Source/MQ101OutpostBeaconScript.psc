Scriptname MQ101OutpostBeaconScript extends ObjectReference Const

Message property OutpostBeaconMessage auto const mandatory

Event OnInit()
	debug.trace(self + " OnInit")
	OutpostBeaconMessage.Show()
EndEvent