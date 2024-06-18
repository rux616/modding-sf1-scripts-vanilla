Scriptname ShipLiftActivator extends ObjectReference Conditional
{Handles raising and lowering of ship interior lift}

import debug
import utility

Group AnimationName_Properties
	string property raiseAnim = "Stage2" auto
	{Animation to play when raising}

	string property lowerAnim = "Stage1" auto
	{Animation to play when lowering}

	string property raiseEvent = "TransitionComplete" auto
	{Raise event name - waits for this event before considering itself "raised"}

	string property lowerEvent = "TransitionComplete" auto
	{Lower event name - waits for this event before considering itself "lowered"}

	string property startRaiseAnim = "Stage2" auto
	{OnLoad calls this if the object starts in the raised state}
EndGroup

Group Optional_Properties
	bool property isRaised = FALSE auto conditional
	{Set to TRUE to start raised.}

	bool property doOnce = FALSE auto
	{Set to TRUE to raise/lower on first trigger only.}

	bool property shouldSetDefaultState = TRUE auto const
	{Should this use SetDefaultState? Set to False only for Activators with identical raise/lower events.}

	bool property AllowInterrupt = FALSE auto
	{Allow interrupts while animation? Default: FALSE}

	bool property InvertCollision = FALSE auto
	{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE}
EndGroup


Group Autofill_Properties
	keyword property TwoStateCollisionKeyword auto
	{Keword to link to the collision you want to enable/disable based on this activators raised/lowered state.}
EndGroup


bool property isAnimating = false auto Hidden conditional
{Is the ramp currently animating from one state to another?}

bool property shouldRaiseNext = true auto Hidden conditional
{Used for SetRaiseNoWait. Should we raise when the timer fires?}

int property myState = 1 auto hidden conditional
{true when static or animating
 0 == raise or raising
 1 == lower or lowering}

ObjectReference player

EVENT OnLoad()
	player = game.GetPlayer()
	if (shouldSetDefaultState)
		SetDefaultState()
	EndIf
endEVENT

Event OnReset()
	if (shouldSetDefaultState)
		SetDefaultState()
	EndIf
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isRaised)
		playAnimationandWait(startRaiseAnim, raiseEvent)

		if (InvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 0
	Else
		playAnimationandWait(lowerAnim, lowerEvent)
		
		if (InvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 1
	EndIf
EndFunction

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
		if(triggerRef == player)
			SetRaise(!isRaised)
			if(doOnce)
				gotoState("done")
			endif
		endif
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			if AllowInterrupt == TRUE
				; send the activation
				SetRaise(!isRaised)
			else
				; block activation
				trace (self + " Busy")
			endif
		endEVENT

endSTATE

STATE done
	EVENT onActivate (objectReference triggerRef)
		;Do nothing
	endEVENT
endSTATE

function SetRaiseNoWait(bool adRaise = true)
     shouldRaiseNext = adRaise
     StartTimer(0)
endFunction

event OnTimer(int timerID)
     SetRaise(shouldRaiseNext)
endEvent

function SetRaise(bool adRaise = true)
	;if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile

	isAnimating = true
	gotoState ("busy")
	if adRaise
		;Lift wants to raise, so raise it
		playAnimationandWait(raiseAnim, raiseEvent) ; Animate Up
		isRaised = TRUE
	else
		;ramp wants to lower, so lower it
		playAnimationandWait(lowerAnim, lowerEvent) ; Animate Closed
		isRaised = FALSE
	endif

	gotoState("waiting")
	isAnimating = false
endFunction