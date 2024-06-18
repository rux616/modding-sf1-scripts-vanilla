Scriptname PilotSeatFurnitureScript extends ObjectReference

Message property PilotSeatNotAuthorizedMessage Auto Const Mandatory

bool suppressDefaultActivationBlockedMessage


Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer() && IsActivationBlocked() && !suppressDefaultActivationBlockedMessage
    	PilotSeatNotAuthorizedMessage.Show()
    endif
EndEvent

Function SuppressDefaultActivationBlockedMessage(bool shouldSuppress=True)
    suppressDefaultActivationBlockedMessage = shouldSuppress
EndFunction