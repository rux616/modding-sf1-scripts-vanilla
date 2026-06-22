Scriptname LC107CredTankShelfRefScript extends LC107CredTankSystemRefScript
{Script for the CredTank Racks in the Vault.

CredTank Racks are instanced packins consisting of:
- This script, on the pivot dummy.
- The shelves themselves, linked to an enable marker.
- A set of 'Responsive' CredTanks, which this script animates based on player proximity, linked to an enable marker.
- A set of 'Always-On' CredTanks, linked to an enable marker.
- A set of 'Always-Off' CredTanks, linked to an enable marker.

The Responsive CredTanks look Off at Position=0, and On at Position=1, but we have to use this elaborate and complicated
system of enable swaps for perf reasons-- the renderer doesn't support having this many animatable objects enabled at
the same time, in the same cell. (Even if they aren't actually animating at any given moment, the mere fact that they
*could* animate is enough to kill the perf.) There's been a lot of back-and-forth over this.}


Group AutofillProperties
	GlobalVariable property LC107CredTankShelvesCurrentGlobal Auto Const Mandatory
	GlobalVariable property LC107CredTankShelvesTotalGlobal Auto Const Mandatory
	Keyword property LC107_LinkCredTankShelfTrigger Auto Const Mandatory
	Keyword property LC107_LinkCredTankEnableMarker Auto Const Mandatory
EndGroup

;Local Variables
Actor player
int playerLastSeenUpdatesAgo
float credTankProximityRange 						;Calculated: CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange
ObjectReference shelfTrigger
ObjectReference shelfEnableMarker
ObjectReference responsiveTanksEnableMarker
ObjectReference offTanksEnableMarker
ObjectReference onTanksEnableMarker
ObjectReference[] credTanks
bool playerEnteredVaultStageDone
bool verbose

;Local Consts
float CONST_CredTankShelfTimerDelay = 1.0 Const
int CONST_CredTankProximityPrecision = 4 Const 		;For perf, instead of testing the player's distance from each individual tank, we check every [Precision] CredTanks, and calc a weighted average for the CredTanks in between.
float CONST_CredTankProximityMaxRange = 20.0 Const	;If the player is within this radius, the CredTank should be at least partially lit.
float CONST_CredTankProximityMinRange = 2.0 Const	;If the player is within this radius, the CredTank should be fully lit.
int CONST_PlayerEnteredVaultStage = 301 Const

String property CONST_AnimVariable_Position = "Position" Auto Hidden Const
String property CONST_AnimVariable_Speed = "Speed" Auto Hidden Const



;---------------------------

Function PerformOperation(int myNewOperation)
	SetState(myNewOperation)
	LC107CredTankShelvesCurrentGlobal.Mod(1)
EndFunction

Function SetState(int myNewOperation)
	myOperation = myNewOperation
	if (myOperation == CONST_Operation_Initialize)
		player = Game.GetPlayer()
		shelfTrigger = GetLinkedRef(LC107_LinkCredTankShelfTrigger)
		shelfEnableMarker = GetLinkedRef(LC107_LinkCredTankEnableMarker)
		responsiveTanksEnableMarker = shelfEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
		onTanksEnableMarker = responsiveTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
		offTanksEnableMarker = onTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
		credTanks = GetLinkedRefChain(ChildObjectKeyword)
		credTankProximityRange = CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange
		RegisterForRemoteEvent(shelfTrigger, "OnTriggerEnter")
		;We want to end up in the Waiting state.
		shelfEnableMarker.EnableNoWait()
		SetState(CONST_Operation_Waiting)
	ElseIf (myOperation == CONST_Operation_Waiting)
		;We're waiting for the player to approach a shelf before switching to the Responsive state.
		;Can transition to Responsive or On (when the player begins using the Vault Controls).
		offTanksEnableMarker.EnableNoWait()
		Utility.Wait(0.01)
		responsiveTanksEnableMarker.DisableNoWait()
		GoToState("Waiting")
		shelfTrigger.Enable()
	ElseIf (myOperation == CONST_Operation_Responsive)
		;The player is near the shelf. We're updating our animation state based on proximity.
		;Can transition to Waiting or On (when the player begins using the Vault Controls).
		responsiveTanksEnableMarker.EnableNoWait()
		Utility.Wait(0.01)
		offTanksEnableMarker.DisableNoWait()
		GoToState("Active")
		playerLastSeenUpdatesAgo = 0
		StartTimer(0)
	ElseIf (myOperation == CONST_Operation_Boot)
		;The player is using the Vault Controls. Set all tanks to On.
		onTanksEnableMarker.Enable()
		responsiveTanksEnableMarker.Disable()
		offTanksEnableMarker.Disable()
		;Shut down all further interactions with the trigger. The Tanks are script-managed from here on out.
		shelfTrigger.Disable()
		GoToState("Inactive")
	ElseIf (myOperation == CONST_Operation_Drain)
		;The player is using the Vault Controls. Set all tanks to Off.
		offTanksEnableMarker.Enable()
		onTanksEnableMarker.Disable()
	ElseIf (myOperation == CONST_Operation_Shutdown)
		;The player is using the Vault Controls. Disable the tanks and their shelves.
		shelfTrigger.DisableNoWait()
		shelfEnableMarker.DisableNoWait()
		responsiveTanksEnableMarker.DisableNoWait()
		onTanksEnableMarker.DisableNoWait()
		offTanksEnableMarker.DisableNoWait()
		GoToState("Inactive")
		;And shut down.
		player = None
		shelfTrigger = None
		shelfEnableMarker = None
		responsiveTanksEnableMarker = None
		offTanksEnableMarker = None
		onTanksEnableMarker = None
		credTanks = None
	EndIf
EndFunction


;---------------------------
;Script States
;--------------

Auto State Inactive
EndState

State Waiting
	Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
		GoToState("Busy")
		SetState(CONST_Operation_Responsive)
	EndEvent
EndState

State Busy
EndState

State Active
	Event OnTimer(int timerID)
		UpdateOnTimer()
	EndEvent
EndState


Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
EndEvent



;---------------------------
;Proximity Updates
;------------------
;
;For Resposive CredTanks only, while the player is in the trigger, update our animation
;state based on the player's proximity.

Function UpdateOnTimer()
	;float startTime = Utility.GetCurrentRealTime()
	bool playerIsInTrigger = shelfTrigger.IsInTrigger(player)
	if (!playerEnteredVaultStageDone)
		playerEnteredVaultStageDone = LC107.GetStageDone(CONST_PlayerEnteredVaultStage)
	EndIf
	if (!playerEnteredVaultStageDone)
		;Just restart the timer.
		StartTimer(CONST_CredTankShelfTimerDelay)
	ElseIf (!playerIsInTrigger && (playerLastSeenUpdatesAgo > 1))
		;If the player is not in the trigger, and wasn't in the trigger for our last update either,
		;switch this shelf back to the Waiting state. We disable the trigger here, and re-enable it
		;in SetState, to catch the edge case where the player may have re-entered it while we were
		;processing the state change.
		GoToState("Busy")
		shelfTrigger.Disable()
		Utility.Wait(0.1)
		SetState(CONST_Operation_Waiting)
	Else
		if (!playerIsInTrigger)
			;If the player is not in the trigger, we want to turn off all of the CredTanks in preparation
			;for shutting them down on the next update if the player still isn't in the trigger.
			;We don't need to calculate anything, just set their position to 0.
			playerLastSeenUpdatesAgo = playerLastSeenUpdatesAgo + 1
			int i = 0
			While ((i < credTanks.Length) && (myOperation == CONST_Operation_Responsive))
				credTanks[i].SetAnimationVariableFloat(CONST_AnimVariable_Position, 0)
				;if (verbose)
					;Debug.Trace("For tank " + i + "= " + tankPosition[i] + " - NOT IN TRIGGER")
				;EndIf
				i = i + 1
			EndWhile
		Else
			;Otherwise, it's a whole process.
			;-Calculate the player's distance from each tank. Since this many GetDistance calls takes too long,
			; we only do a couple, and then use a weighted average to estimate the player's distance from the
			; other tanks. You can't tell the difference.
			playerLastSeenUpdatesAgo = 0
			float[] tankDistances = new float[credTanks.Length]
			float tankMinDistance = 0
			int i = 0
			While (i < credTanks.Length)
				tankDistances[i] = player.GetDistance(credTanks[i])
				i = i + CONST_CredTankProximityPrecision
			EndWhile
			if (tankDistances[credTanks.Length-1] == 0)
				tankDistances[credTanks.Length-1] = player.GetDistance(credTanks[credTanks.Length-1])
			EndIf
			i = 0
			While (i < credTanks.Length)
				if (tankDistances[i] == 0)
					int priorIndex = i - (i % CONST_CredTankProximityPrecision)
					int priorIndexBelowCurrent = i - priorIndex
					int nextIndex = Math.Min(tankDistances.Length-1, priorIndex + CONST_CredTankProximityPrecision) as int
					int nextIndexAboveCurrent = nextIndex - i
					float indexRange = priorIndexBelowCurrent + nextIndexAboveCurrent
					float priorMultiple = 1 - (priorIndexBelowCurrent / indexRange)
					float nextMultiple = 1 - (nextIndexAboveCurrent / indexRange)
					tankDistances[i] = (tankDistances[priorIndex] * priorMultiple) + (tankDistances[nextIndex] * nextMultiple)
					;if (verbose)
						;Debug.Trace("For tank " + i + ": PriorIndex=" + priorIndex + ", down " + priorIndexBelowCurrent + ": NextIndex=" + nextIndex + ", up" + nextIndexAboveCurrent + ": range=" + indexRange + ": distance=" + tankDistances[i]) 
					;EndIf
				EndIf
				i = i + 1
			EndWhile
			;-Once we have the player's distance from each tank, calculate the Position value we want to animate the tank to.
			i = 0
			While ((i < credTanks.Length) && (myOperation == CONST_Operation_Responsive))
				float tankPosition = 1 - Math.Min(Math.Max(Math.Max(tankDistances[i] - CONST_CredTankProximityMinRange, 0) / (credTankProximityRange), 0), 1)
				credTanks[i].SetAnimationVariableFloat(CONST_AnimVariable_Position, tankPosition)
				i = i + 1
				;if (verbose)
					;Debug.Trace("For tank " + i + "= " + tankPosition)
				;EndIf
			EndWhile
		EndIf
		StartTimer(CONST_CredTankShelfTimerDelay)
	EndIf
	;Debug.Trace("Update for " + credTanks.Length + " took " + (Utility.GetCurrentRealTime()-startTime))
EndFunction


;---------------------------
;Debug Support
;--------------

Function DEBUG_SetVerbose(bool shouldBeVerbose)
	verbose = shouldBeVerbose
EndFunction