Scriptname EMSystemTurfScript extends ObjectReference Hidden Conditional

;Go to http://institute.bethsoft.com/index.php?title=Encounter_Management_System for the overview of this system
;Prototype is currently set up in TestEMS Cell in TestEMSystemWorld

Group Required_Properties CollapsedOnRef
	EMSystemQuestScript Property EMSystemQuest Auto Const Mandatory
	{The quest that handles all of the encounters.}
	Keyword Property EMSystemLinkToTurf Auto Const Mandatory
	{The keyword that each actors will be linked to this turf with.}
	Keyword Property EMSystemLinkToSleep Auto Const Mandatory
	{The keyword we link the sleeping actors to furniture with.  So we know which ones should be sleeping.}
	Keyword Property ActorTypeTurret Auto Const Mandatory
	{They keyword a turrent actor has, since we treat sleeping turrets differently.}
	Keyword Property LinkAmbushFurniture Auto Const Mandatory
EndGroup

	; Whether this encounter is currently active or not.
Bool Property EncounterActive = FALSE Auto Conditional

	; Total number of living actors in this encounter.
Int TotalActors

	; Number of actors in this encounter that currently have their AI enabled.
Int ActiveActors

	; Timer instance for updating actors
Int UpdateActorsTimer = 10

	; Timer instance for shutting down encounter if triggered but noone has detected the player.
Int IdleEncounterTimer = 20

	; Set to TRUE when we are currently running through actors in either WakeUp or SendToSleep...
	;...effectively locking the other one out of touching the turf actors while the other is running through them.
Bool RegisterLock

	; Set to TRUE inside the RegisterLock section, when running SendToSleep.  Further SendToSleep calls can be ignored.
Bool SendingToSleep = FALSE

	; Restart the UpdateActorsTimer with an appropriate random delay.
Function StartUpdateActorsTimer()
	StartTimer(utility.RandomFloat(5.0, 6.0), UpdateActorsTimer)
EndFunction

	; Restart the IdleEncounterTimer with an appropriate random delay.
Function StartIdleEncounterTimer()
	StartTimer(utility.RandomFloat(8.0, 10.0), IdleEncounterTimer)
EndFunction

	; Increment the total number of encounter turfs at game start.
Event OnInit()
    EMSystemQuest.IncrementTotal()
EndEvent



	; Start this encounter in the inactive state on load
Event OnCellLoad()

    EMSystemQuest.IncrementLoaded()
    Actor[] TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
    Debug.Trace(self + " OnCellLoad()| Actors in Turf: " + TurfActors)
    if GetTriggerObjectCount() == 0 && TurfActors.Length > 0
    	if AllActorsOutOfCombat()
    		SendToSleep(TRUE, TurfActors)
		 	StartIdleEncounterTimer()
    	else
    		WakeUp(TurfActors)
    	endif
    endif
    StartUpdateActorsTimer()

EndEvent



	;When the UpdateActorsTimer finishes update the actors, then start the timer again.
Event OnTimer(int aiTimerID)

    if aiTimerID == UpdateActorsTimer
		;Debug.Trace(self + " OnTimer()| UpdateActorsTimer Hit! Make sure everyone is going to sleep if the encounter isn't active.")
		Actor[] TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
    	EMSystemQuest.UpdateInactive()
		UpdateActorCount(TurfActors)
			; Primarily for grabbing guys that may load in after this turf loads, to make sure they get registered correctly.
		if !EncounterActive
	    	if GetTriggerObjectCount() == 0 
				SendToSleep(SentTurfActors = TurfActors)
			else
				WakeUp(SentTurfActors = TurfActors) 
			endif
		endif
		if Is3DLoaded()
			StartUpdateActorsTimer()
		endif
	elseif aiTimerID == IdleEncounterTimer
		; If the Idle Timer has finished then no action has happened since the player crossed the Turf Trigger...	
		;Debug.Trace(self + " OnTimer()| IdleEncounterTimer Hit!")
		Bool continueTimer = FALSE;
			; ..if the player is not in the turf trigger...
    	if GetTriggerObjectCount() == 0 
			Actor[] TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
			;Debug.Trace(self + " OnTimer()| IdleEncounterTimer| The player is NOT in the TurfTrigger")
    			; ...and none of the turf actors are in combat...
    		if AllActorsOutOfCombat(TurfActors)
				;Debug.Trace(self + " OnTimer()| IdleEncounterTimer| None of the actors are currently in combat.")
		    	if TurfActors.Length > 0
		    			; ...then send them all back to sleep.
					;Debug.Trace(self + " OnTimer()| IdleEncounterTimer| Tell the actors to go back to SLEEP")
		    		SendToSleep(TurfActors)
		    	endif
				continueTimer = TRUE;
		    endif
		else
			; If the player is still in the turf trigger, then restart the idle timer.
			Debug.Trace(self + " OnTimer()| IdleEncounterTimer| Player is still IN the TurfTrigger, reset the timer.")
			continueTimer = TRUE
		endif

	 	if continueTimer && Is3DLoaded()
			StartIdleEncounterTimer()
		endif
    endif

EndEvent


	; Puts all the necessary actors to sleep.  And sets the encounter to INACTIVE.
Function SendToSleep(bool bForced = FALSE, Actor[] SentTurfActors = NONE)
		; Don't do a think if the player is still in the trigger.

	while (RegisterLock)
		;Further SendToSleep calls can be skipped while we're SendingToSleep.
		if SendingToSleep
			return
		endif
		utility.Wait(1)
	endwhile

	RegisterLock = 1
	SendingToSleep = TRUE

	if GetTriggerObjectCount() == 0
		if EncounterActive == TRUE
	    	EMSystemQuest.DecrementActive()
	    endif

	    Actor[] TurfActors

		EncounterActive = FALSE
		;Debug.Trace(self + " SendToSleep()| Forcing actors in this event to sleep.")
		if SentTurfActors
			TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
		else
			TurfActors = SentTurfActors
		endif

		int maxSize = TurfActors.Length
		int count = 0

		StopCombatOnAll(TurfActors)

		while (count < maxSize)

			Actor turfActor = TurfActors[count]

				; We only care about living actors that have enabled AI or are not in furniture (unless forced).
			if turfActor.GetLinkedRef(EMSystemLinkToSleep) && (bForced || turfActor.IsAIEnabled() || ( turfActor.GetSitState() != 3 && turfActor.GetSleepState() != 3) )
					; If this actors is supposed to be put to sleep, then send him to bed

				Debug.Trace(self + " SendToSleep()| Found actor " + turfActor + " that should be put to sleep.")

				turfActor.EvaluatePackage()	
				if bForced && !TurfActor.HasKeyword(ActorTypeTurret)
					if TurfActor.GetLinkedRef(LinkAmbushFurniture)
						; Snap them to their 'sleeping' markers if we are forcing them there.
						Debug.Trace(self + " SendToSleep()| Puting AMBUSH actor " + turfActor + " to 'sleep'.")
						turfactor.EnableAI(TRUE)
						utility.Wait(0.1)
						turfactor.SnapIntoInteraction(turfactor.GetLinkedRef(EMSystemLinkToSleep))
						utility.Wait(0.1)
						turfactor.EnableAI(FALSE)

					else
						; Snap them to their 'sleeping' markers if we are forcing them there.
						if TurfActor.GetDistance(turfactor.GetLinkedRef(EMSystemLinkToSleep)) < 128
							Debug.Trace(self + " SendToSleep()| Puting NON Ambush actor " + turfActor + " to 'sleep'.")
							turfactor.EnableAI(TRUE)
							utility.Wait(0.1)
							turfactor.SnapIntoInteraction(turfactor.GetLinkedRef(EMSystemLinkToSleep))
							;turfActor.MoveToPackageLocation()
							utility.Wait(0.1)
							turfactor.EnableAI(FALSE)
						endif
					endif
				endif

				if TurfActor.HasKeyword(ActorTypeTurret)
					Debug.Trace(self + " SendToSleep()| Found TURRET " + turfActor + " that should be put to sleep.")
					turfactor.EnableAI(TRUE)
					utility.Wait(0.1)
					turfactor.EnableAI(FALSE)
				endif

			endif
			 	; No matter who they are, register them for an OnHit(), OnDeath(), and OnCombatStateChanged() events.
			RegisterForHitEvent(turfActor)
			RegisterForRemoteEvent(turfActor, "OnSit")
			RegisterForRemoteEvent(turfActor, "OnDying")
			RegisterForRemoteEvent(turfActor, "OnDeath")
			RegisterForRemoteEvent(turfActor, "OnCombatStateChanged")
			count += 1

		endwhile
	endif

	SendingToSleep = FALSE
	RegisterLock = 0
	
EndFunction



	; All actors have been told to wake up.  If they aren't dead, then do it!  Also sets the encounter to ACTIVE
Function WakeUp(Actor[] SentTurfActors = NONE)

	while (RegisterLock)
		;No need to WakeUp again if the encounter is already active.
		if EncounterActive
			return
		endif
		utility.Wait(1)
	endwhile

	RegisterLock = 1

	Debug.Trace(self + " WakeUp()")
	if EncounterActive == FALSE
		Debug.Trace(self + " WakeUp()| Encounter is NOT active, set it to active.")
    	EMSystemQuest.IncrementActive()
    	EncounterActive = TRUE
		Actor[] TurfActors

		if SentTurfActors
			TurfActors = SentTurfActors
		else
			TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
		endif

		int maxSize = TurfActors.Length
		int count = 0
		while (count < maxSize)
				; Unregister for all events you don't need now that you've woke up.
			Actor turfActor = TurfActors[count]
			UnregisterForAllHitEvents(turfActor)
			UnRegisterForRemoteEvent(turfActor, "OnCombatStateChanged")
			UnRegisterForRemoteEvent(turfActor, "OnSit")
			Debug.Trace(self + " WakeUp()| Found actor " + turfActor + " that should be woken up.")
			turfActor.EnableAI(TRUE)
			turfActor.EvaluatePackage()
			RegisterForRemoteEvent(turfActor, "OnCombatStateChanged")
			count += 1
		endwhile
    endif

    RegisterLock = 0

EndFunction



	; Stop combat on everyone so they can go back to idleing.
Function StopCombatOnAll(Actor[] SentTurfActors = NONE)
	
	Actor[] TurfActors

	if SentTurfActors
		TurfActors = SentTurfActors
	else
		TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
	endif

	int maxSize = TurfActors.Length
	int count = 0
	while (count < maxSize)
		Actor turfActor = TurfActors[count]
		;if !turfActor.IsDead()
			;Debug.Trace(self + " StopCombatOnAll()| Found actor " + turfActor + " that should StopCombat() on.")
			turfActor.StopCombat()
			turfActor.StopCombatAlarm()
		;endif
		count += 1
	endwhile
EndFunction



    ; Update the count the total actors, and the number of actors that currently have AI.
Function UpdateActorCount(Actor[] SentTurfActors = NONE)
	;Debug.Trace(self + " UpdateActorCount()| STARTED")
	int PreviousTotalActors = TotalActors
	int PreviousActiveActors = ActiveActors
	TotalActors = 0
	ActiveActors = 0
	Actor[] TurfActors

	if SentTurfActors
		TurfActors = SentTurfActors
	else
		TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
	endif

	int maxSize = TurfActors.Length
	;Debug.Trace(self + " UpdateActorCount()| There are a total of " + maxSize + " Actors in this Turf.")
	int count = 0
	while (count < maxSize)
		Actor turfActor = TurfActors[count]
		;Debug.Trace(self + " UpdateActorCount()| Found living actor " + turfActor + " that should be counted.")
		TotalActors += 1
		if turfActor.IsAIEnabled()
			;Debug.Trace(self + " UpdateActorCount()| ...He also has AI, so we should count that as well.")
			ActiveActors += 1
		endif
		count += 1
	endwhile
	EMSystemQuest.UpdateActorsActive(PreviousActiveActors, ActiveActors)
	EMSystemQuest.UpdateActorsTotal(PreviousTotalActors, TotalActors)
EndFunction


	; Disable AI, but only if the turf is still inactive by the time we call this.
Bool Function TryToDisableAI(Actor ActorToDisable)
	Bool result = FALSE
	Debug.Trace(self + "TryToDisableAI()|" + ActorToDisable )
	if EncounterActive == FALSE
		Debug.Trace(self + "TryToDisableAI()| Encounter is Inactive. Disabling " + ActorToDisable )
		ActorToDisable.EnableAI( FALSE )
		result = TRUE 
	else
		Debug.Trace(self + "TryToDisableAI()| Encounter is Active. " + ActorToDisable + " will remain active")
	endif
	
	return result
EndFunction


	; Only registered for on the actors that will sleep, so that we can turn their AI off when they fully sit down.
Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
    if akFurniture == akSender.GetLinkedRef(EMSystemLinkToSleep)
		Debug.Trace(self + "OnSit()|" + akSender + " has reached their furniture.  Turn their AI off.")
		; Unfortunately the OnSit event is sent a frame *before* the actor's behavior graph 
		; finishes snapping/animating into furniture, so wait briefly for it to finish.
		utility.Wait(0.1)
		TryToDisableAI( akSender )
    endif
EndEvent



	; Registered for by all the actors.  If anyone is hit by anything then wake everyone up.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)    
	Debug.Trace(self + "OnHit()|" + akTarget + " was hit!  Waking everyone up.")
	CancelTimer(IdleEncounterTimer)
	WakeUp()
EndEvent



	; Registered for by all actors.
	; If this actor is in combat, or searching, wake up everyone.
	; ...If this actors is not in combat, then check to see if everyone is out of combat, if theya re then send everyone to sleep.
Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget , int aeCombatState)
	Actor[] TurfActors
	if aeCombatState > 0
		Debug.Trace(self + "OnCombatStateChanged()|" + akSender + " is in combat!  Waking everyone up.")
		CancelTimer(IdleEncounterTimer)
		TurfActors = GetActorsLinkedToMe(EMSystemLinkToTurf,NONE)
    	WakeUp(TurfActors)
    elseif aeCombatState == 0
    	TurfActors = GetActorsLinkedToMe(EMSystemLinkToTurf,NONE)
		if AllActorsOutOfCombat(TurfActors)
			SendToSleep(TurfActors)
			if Is3DLoaded()
				StartIdleEncounterTimer()
			endif
		else
			CancelTimer(IdleEncounterTimer)
		endif
    endif
EndEvent



	; Everyone registers for this.  When someone dies check to see if everyone is dead(turf array is empty).
	; ...If they are then mark the encounter INACTIVE.
Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
	Debug.Trace(self + "OnDeath()| Check to see if all actors are dead.")
	if self.CountActorsLinkedToMe(EMSystemLinkToTurf,None) == 0
		if EncounterActive == TRUE
			Debug.Trace(self + "OnDeath()| They are ALL DEAD.")
	    	EMSystemQuest.DecrementActive()
	    	EMSystemQuest.DecrementTotal()
	    endif
		Debug.Trace(self + "OnDeath()| At least one is STILL ALIVE")
		EncounterActive = FALSE
	endif
EndEvent


	; Everyone registers for this.  When someone is dying, make sure they wake up so that they animate.
	; (Mainly needed in case they get killed in one shot.)
Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
	;Must wake the actor, so that they animate!
	Debug.Trace(self + "OnDying()| Enable AI.")
	akSender.EnableAI(TRUE)
EndEvent



	; When the player enters the trigger wake everyone up, if there is anyone left in the turf.
Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace(self + " OnTriggerEnter()| There are currently " + GetTriggerObjectCount() + " refs in this trigger.")
	if akActionRef == Game.GetPlayer()
 		Debug.Trace(self + "OnTriggerEnter()| Player has ENTERED the trigger...")
 		Actor[] TurfActors = GetActorsLinkedToMe(EMSystemLinkToTurf,NONE)
 		if TurfActors.Length == 0
 			Debug.Trace(self + "OnTriggerEnter()| Everyone is dead, don't try to wake them up.")
    	else
 			Debug.Trace(self + "OnTriggerEnter()| Someone in this turf is alive, wake everyone up.")
    		WakeUp(TurfActors)  	
    	endif 
    endif
EndEvent



	; Is everyone out of combat?
Bool Function AllActorsOutOfCombat(Actor[] SentTurfActors = NONE)
 	;Debug.Trace(self + "AllActorsOutOfCombat()| Checking to see if all actors are out of combat.")
	Actor[] TurfActors
	if SentTurfActors
		TurfActors = SentTurfActors
	else
		TurfActors = self.GetActorsLinkedToMe( EMSystemLinkToTurf, None )
	endif
	int maxSize = TurfActors.Length
	int count = 0
	while (count < maxSize)
		Actor turfActor = TurfActors[count]
		if turfActor.GetCombatState() != 0
			; We found one that is in combat, so bail out early and send false
 			Debug.Trace(self + "AllActorsOutOfCombat()| Actors are STILL IN COMBAT.")
			return FALSE
		endif
		count += 1
	endwhile

 	;Debug.Trace(self + "AllActorsOutOfCombat()| Actors are NOT IN COMBAT.")
	return TRUE
EndFunction



	; Zero out the encounters numbers and unregister everyone for everything.
Event OnUnload()
	Debug.Trace(self + "OnUnload()")
		; Reset all the numbers back to what they were before this turf was loaded.
	EncounterActive = FALSE
    EMSystemQuest.DecrementLoaded()
	EMSystemQuest.SubtractFromActorsTotal(TotalActors)
	EMSystemQuest.SubtractFromActorsActive(ActiveActors)
	EMSystemQuest.UpdateInactive()
	UpdateActorCount()
	TotalActors = 0
	ActiveActors = 0

    	; Unregister for events now that we've unloaded.
    UnRegisterForAllEvents()

	CancelTimer(UpdateActorsTimer)
	CancelTimer(IdleEncounterTimer)
EndEvent