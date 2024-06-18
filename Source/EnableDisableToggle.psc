Scriptname EnableDisableToggle extends ObjectReference Conditional
{Toggles between enabling and disabling linkedref}

import debug
import utility

ObjectReference linkedref
bool isEnabled = TRUE

EVENT OnLoad()
	linkedref = GetLinkedRef()
endEVENT

EVENT onActivate (objectReference triggerRef)
	if(isEnabled)
		isEnabled = FALSE
		linkedref.disable()
	else
		isEnabled = TRUE
		linkedref.enable()
	endif
endEVENT
