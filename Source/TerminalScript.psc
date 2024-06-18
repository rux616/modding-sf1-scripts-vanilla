Scriptname TerminalScript extends ObjectReference
{script for all terminals that need to animate}

float property AnimateDistanceOpen = 3.0 auto const
{ used for the "animate open" distance check if no trigger is linked }

float property AnimateDistanceClose = 6.0 auto const
{ used for the "animate close" distance check if no trigger is linked }

String property myOpenAnimation = "play01" auto Const
String property myCloseAnimation = "play02" auto Const

ActorValue property PowerCanBePowered auto const
{ to check for terminals that require power (e.g. outpost) }

ObjectReference myTrigger

int checkStateTimerID = 1 const
float checkStateTimeEnter = 0.1 const
float checkStateTimeExit = 2.0 const

bool requiresPower = false

auto state unloaded
	Event OnLoad()
		debug.trace(self + " OnLoad " + GetOpenState())
		gotoState("loaded")
		; do I have a trigger?
		myTrigger = GetLinkedRef()
		if myTrigger
	;    	debug.trace(self + " trigger found")
			; watch for trigger events
			RegisterForRemoteEvent(myTrigger, "OnTriggerEnter")
			RegisterForRemoteEvent(myTrigger, "OnTriggerLeave")
		else
	;   	debug.trace(self + " no trigger found - use distance check")
			; use distance checks instead
			RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), AnimateDistanceOpen)
		endif

		if PowerCanBePowered && GetValue(PowerCanBePowered) > 0
			requiresPower = true
			BlockActivation()
		endif
		CheckOpenState()
		debug.trace(self + " OnLoad DONE")		
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
		debug.trace(self + " OnDistanceLessThan - unloaded - do nothing")
	EndEvent

	Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
		debug.trace(self + " OnDistanceGreaterThan - unloaded - do nothing")
	EndEvent
EndState

state loaded
	Event OnUnload()
		gotoState("unloaded")

		CancelTimer(checkStateTimerID)
		if myTrigger
			; watch for trigger events
			UnregisterForRemoteEvent(myTrigger, "OnTriggerEnter")
			UnregisterForRemoteEvent(myTrigger, "OnTriggerLeave")
		else
			; use distance checks instead
			UnregisterForDistanceEvents(self, Game.GetPlayer())
		endif
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
		debug.trace(self + " OnDistanceLessThan - opening")
		StartTimer(checkStateTimeEnter, checkStateTimerID)
		; register for player to get far away
		debug.trace(self + " Registering for distance greater than " + AnimateDistanceClose)
		; pass event id to new event registration?
		RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), AnimateDistanceClose)
	EndEvent

	Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
		debug.trace(self + " OnDistanceGreaterThan - closing")
		StartTimer(checkStateTimeExit, checkStateTimerID)
		; register for player to get close
		; pass event id to new event registration?
		RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), AnimateDistanceOpen)
	EndEvent

	Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
		; player enters trigger
		StartTimer(checkStateTimeEnter, checkStateTimerID)
	EndEvent

	Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
		; player exits trigger
		StartTimer(checkStateTimeExit, checkStateTimerID)
	EndEvent

	Event OnExitFurniture(ObjectReference akActionRef)
		debug.trace(self + " OnExitFurniture " + akActionRef)
		if akActionRef != Game.GetPlayer()
			if myTrigger
				CheckOpenState()
			else
				; register for player to get far away
				RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), AnimateDistanceClose)
			endif
		endif
	EndEvent	
EndState

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
	; do nothing
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
	; do nothing
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	if requiresPower
		; player enters trigger
		StartTimer(checkStateTimeEnter, checkStateTimerID)
	endif
EndEvent

Event OnPowerOff()
	if requiresPower
		; player enters trigger
		StartTimer(checkStateTimeEnter, checkStateTimerID)
	endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == checkStateTimerID
    	CheckOpenState()
    endif
EndEvent

function CheckOpenState()
	debug.trace(self + " CheckOpenState")
	bool checkSucceeded = true
	if Is3dLoaded()
		if requiresPower && IsPowered() == false
			; if not powered, close
			if IsFurnitureInUse() == false && GetOpenState() < 3 ; open

				checkSucceeded = PlayAnimationAndWait(myCloseAnimation, "done")
				debug.trace(self + " done closing")
			endif
		else
			if IsFurnitureInUse() && GetOpenState() > 2 ; closed
				; always open if furniture is in use
				checkSucceeded = PlayAnimationAndWait(myOpenAnimation, "done")
			elseif myTrigger
				; if player is in trigger, open, otherwise close
				if myTrigger.IsInTrigger(Game.GetPlayer()) && GetOpenState() > 2 ; closed
					checkSucceeded = PlayAnimationAndWait(myOpenAnimation, "done")
					debug.trace(self + " done opening")
				else
					; close if no NPC is using furniture
					if IsFurnitureInUse() == false && GetOpenState() < 3 ; open
						checkSucceeded = PlayAnimationAndWait(myCloseAnimation, "done")
						debug.trace(self + " done closing")
					endif
				endif
			else
				; no trigger, so check distance
				ObjectReference player = Game.GetPlayer()
				if GetDistance(player) < AnimateDistanceClose && GetOpenState() > 2 ; closed
					checkSucceeded = PlayAnimationAndWait(myOpenAnimation, "done")
					debug.trace(self + " done opening")
				elseif GetDistance(player) >= AnimateDistanceClose
					; close if no NPC is using furniture
					if IsFurnitureInUse() == false && GetOpenState() < 3 ; open
						checkSucceeded = PlayAnimationAndWait(myCloseAnimation, "done")
						debug.trace(self + " done closing")
					endif
				endif
			endif
		EndIf

		if checkSucceeded == false && Is3dLoaded()
			; most likely was animating when PlayAnimation was called - try again
			debug.trace(self + " animation failed - try again")
			StartTimer(checkStateTimeEnter, checkStateTimerID)
		endif
	endif
	debug.trace(self + " CheckOpenState DONE")
endFunction

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate " + akActionRef)
	; this is what we'll use for the player since player doesn't send OnEnterFurniture
    if akActionRef != Game.GetPlayer()
		CheckOpenState()
	Else
		if requiresPower
			if IsPowered() && IsActivationBlocked()
				Activate(akActionRef)
				IncrementAchievement()
			endif
		Else
			IncrementAchievement()
		EndIf
    endif
EndEvent

Function IncrementAchievement()
	debug.trace(self + " IncrementAchievement")
	SQ_ParentScript SQ_Parent = Game.GetFormFromFile(0x007092C, "Starfield.esm") as SQ_ParentScript
	if SQ_Parent
		SQ_Parent.IncrementComputersAchievement(self)
	Else
		debug.trace(self + " Unable to get SQ_Parent to increment Computers Achievement count", 2)
	endif
EndFunction