Scriptname MannequinScript extends Actor Const

bool property allowPlayerActivation = true auto const
{ if false, player activation is blocked }

FormList Property DisplayFilter_Mannequins auto Const Mandatory
{ autofill - used to filter what can be placed in the mannequin }

event OnLoad()
	debug.trace(self + " OnLoad")
	SetHeadTracking(false)
	SetRestrained(true)
	SetUnconscious(true)
	BlockActivation(true, false)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate isActivationBlocked=" + isActivationBlocked())
    if akActionRef == Game.GetPlayer() && allowPlayerActivation
        debug.trace(self + "  player activation - try to open inventory")
    	OpenInventory(true, DisplayFilter_Mannequins, true)
    endif
EndEvent
