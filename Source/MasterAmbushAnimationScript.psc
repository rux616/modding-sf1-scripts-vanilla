scriptName MasterAmbushAnimationScript extends ObjectReference
{This script causes the ref to animate when activated}


import debug
import utility

string property sInitialAnim = "Reset"  auto
{By default, this property is set to Reset.}

string property sActivateAnim = "Open"  auto
{By default, this property is set to Open.}

float property fDelay = 0.0 auto
{By default, this property is set to 0.0f.}

bool isOpened = false

;*******************************************

Event onReset()
	onLoad()
endEvent

;*******************************************

Event onLoad()
	if(!isOpened)
		playAnimation( sInitialAnim )
	endif
endEvent

;*******************************************

Auto State waiting
	Event onActivate (objectReference triggerRef)
		gotoState ("busy")
		isOpened = true
		Wait( fDelay )
		playAnimation( sActivateAnim )	
	endEvent
endState

;*******************************************

State busy
	Event onActivate (objectReference triggerRef)
		;do nothing
	endEvent
endState

;*******************************************