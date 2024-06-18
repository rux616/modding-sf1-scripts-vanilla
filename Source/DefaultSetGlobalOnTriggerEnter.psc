Scriptname DefaultSetGlobalOnTriggerEnter extends ObjectReference Const Default
{Set a global to a specific value when this trigger is entered by the player.}

GlobalVariable Property GlobalToSet const auto
{The Global we want to set to NumToSetGlobalTo}

Float Property NumToSetGlobalTo const auto
{The number we want to set GlobalToSet to.}

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	GlobalToSet.SetValue(NumToSetGlobalTo)
    	;debug.Trace(GlobalToSet + " set to " + GlobalToSet.GetValue())
    endif
EndEvent