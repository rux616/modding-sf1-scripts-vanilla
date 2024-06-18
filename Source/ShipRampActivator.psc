Scriptname ShipRampActivator extends ObjectReference Conditional
{Handles opening and closing of ship ramp}

;there is a trigger baked into the ramp art
;Goals for script:
;	Player Ship: 	- handle ramp raising/lowering when player enters/leaves trigger
;					- handle ownership (player takes over a ship)
;					- still need to handle player entering trigger while flying through space
;	AI Ship:		- will handle locking the ship using the load door near ramp, instead
;					  of worrying about AI entering/leaving trigger
;					- handle raising/lowering ramp by using SetOpen function

import debug
import utility

Group Required_Properties
	string property openAnim = "RampOpen" auto
	{Animation to play when opening}

	string property closeAnim = "RampClose" auto
	{Animation to play when closing}

	string property openEvent = "Done" auto
	{Open event name - waits for this event before considering itself "open"}

	string property closeEvent = "Done" auto
	{Close event name - waits for this event before considering itself "closed"}

	bool property playerShip = FALSE auto
	{default:FALSE - set to true if the ramp belongs to the player ship}
EndGroup

Group Optional_Properties
	bool property isOpen = FALSE auto conditional
	{Set to TRUE to start open.}

	bool property doOnce = FALSE auto
	{Set to TRUE to open/close on first trigger only.}

	bool property shouldSetDefaultState = FALSE auto const
	{Should this use SetDefaultState? Set to False only for Activators with identical open/close events.}

	string property startOpenAnim = "Play01" auto
	{OnLoad calls this if the object starts in the open state}

	bool property InvertCollision = FALSE auto
	{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE}
EndGroup


Group Autofill_Properties
	keyword property TwoStateCollisionKeyword auto
	{Keword to link to the collision you want to enable/disable based on this activators opened/closed state.}
EndGroup

int property myState = 1 auto hidden conditional
{true when static or animating
 0 == open or opening
 1 == closed or closing}

;********************************************************

ObjectReference player
bool inTrigger = FALSE

ObjectReference myTrigger

;********************************************************

;//WJS - COMMENTING OUT THIS SCRIPT - ship now handles all this natively

Event OnLoad()
	debug.trace(self + "OnLoad")
	Initialize()
endEvent

function Initialize()
	player = game.GetPlayer()
	myTrigger = GetLinkedRef()
	if myTrigger
		RegisterForRemoteEvent(myTrigger, "OnTriggerEnter")
		RegisterForRemoteEvent(myTrigger, "OnTriggerLeave")
	endif
	if (shouldSetDefaultState)
		;SetDefaultState()
	endIf
endFunction

;********************************************************

Event OnReset()
	debug.trace(self + "OnReset")
	if (shouldSetDefaultState)
		;SetDefaultState()
	endIf
endEvent

;********************************************************

auto State waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + "waiting: OnTriggerEnter " + akActionRef)
	    if(akActionRef == player && playerShip == TRUE)
	    	inTrigger = TRUE
	    	SetOpenState()
	    	if(doOnce)
	    		gotoState("done")
	    	endIf
	    endIf
	endEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	debug.trace(self + "waiting: OnTriggerLeave " + akActionRef)
	    if(akActionRef == player && playerShip == TRUE)
	    	inTrigger = FALSE
	    	SetOpenState()
	    	if(doOnce)
	    		gotoState("done")
	    	endIf
	   	endIf
	endEvent

endState

;********************************************************

State busy
	;This is the state when I'm busy animating
	;but still need to listen to see if the player is entering/leaving trigger
	Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + "busy: OnTriggerEnter " + akActionRef)
    	if(akActionRef == player && playerShip == TRUE)
	    	inTrigger = TRUE
	    	SetOpenState()
	    endIf
	endEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	debug.trace(self + "busy: OnTriggerLeave " + akActionRef)
	    if(akActionRef == player && playerShip == TRUE)
	    	inTrigger = FALSE
	    	SetOpenState()
	   	endIf
	endEvent

endState

;********************************************************

State done
	Event onActivate (objectReference triggerRef)
		;Do nothing
	endEvent
endState

;********************************************************

;/
;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	debug.trace(self + "OnLoad")
	if (isOpen)
		playAnimationandWait(startOpenAnim, openEvent)

		if (InvertCollision == FALSE)
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			EnableLinkChain(TwoStateCollisionKeyword)
		endIf

		myState = 0
	else
		playAnimationandWait(closeAnim, closeEvent)

		if (InvertCollision == FALSE)
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			DisableLinkChain(TwoStateCollisionKeyword)
		endIf

		myState = 1
	endIf
endFunction

;********************************************************

Function SetOpenState()
	;if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile

	gotoState ("busy")
	; toggle state
	bool abOpen = (GetOpenState() > 2)
	debug.trace(self + "SetOpenState " + abOpen)

	if abOpen
		if(inTrigger == TRUE || playerShip == FALSE)
			;ramp wants to open and player is in trigger, so open it
			;or another script called this function and it wants to open the ramp
			SetOpen(true)
		else
			;ramp wants to open, but player is not in trigger, so close it
			SetOpen(false)
		endIf
	else
		if(inTrigger == FALSE || playerShip == FALSE)
			;ramp wants to close and player is not in trigger, so close it
			;or another script called this function and it wants to close the ramp
			SetOpen(false)
		else
			;ramp wants to close, but player is in trigger, so open it
			SetOpen(true)
		endIf
	endIf

	gotoState("waiting")
endFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + "ObjectReference.OnTriggerEnter " + akActionRef)
	OnTriggerEnter(akActionRef)
endEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + "ObjectReference.OnTriggerLeave " + akActionRef)
	OnTriggerLeave(akActionRef)
endEvent

;********************************************************
/;