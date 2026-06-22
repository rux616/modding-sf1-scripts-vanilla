Scriptname BELandingQuestScript extends Quest
{Script for BELandingQuest.}
;
;When a ship with the BESurface or BEDropship keywords begins or starts landed, the Ship Landing story manager event starts BELandingQuest,
;which fires a script event to start a boarding encounter for the ship, then immediately shuts down.

Group Properties
	ReferenceAlias property Ship Auto Const Mandatory
	ActorValue property SpaceshipCrew Auto Const Mandatory
	ActorValue property SpaceshipLandedValue Auto Const Mandatory
	Keyword property BEDropship Auto Const Mandatory
	Keyword property BEEncounterTypeSurface Auto Const Mandatory
	Keyword property BESurfaceCrewSize_NoCrew Auto Const Mandatory
	Keyword property BESurfaceCrewSize_25Percent Auto Const Mandatory
	Keyword property BESurfaceCrewSize_50Percent Auto Const Mandatory
	Keyword property BESurfaceCrewSize_75Percent Auto Const Mandatory
	Keyword property SpaceshipPreventRampOpenOnLanding Auto Const Mandatory
EndGroup

;Local variables.
SpaceshipReference shipRef

;Local Consts
int CONST_EncounterMode_Dropship = 1 Const
int CONST_Timer_RecheckLandingTimerID = 1 Const
int CONST_Timer_RecheckLandingTimerDelay = 180 Const


Event OnQuestStarted()
	shipRef = Ship.GetShipRef()
	RegisterForRemoteEvent(shipRef, "OnShipLanding")
	if (shipRef.IsLanded())
		StartSurfaceEncounter()
	Else
		;Don't open the ship's landing ramp until the boarding encounter has spawned any
		;actors that need to disembark from it.
		shipRef.AddKeyword(SpaceshipPreventRampOpenOnLanding)
	EndIf
EndEvent

Event SpaceshipReference.OnShipLanding(SpaceshipReference akSource, bool abComplete)
	debug.trace(self + " OnShipLanding akSource=" + akSource + " abComplete=" + abComplete)
	StartSurfaceEncounter()
EndEvent

Function StartSurfaceEncounter()
	debug.trace(self + " StartSurfaceEncounter")
	CancelTimer(CONST_Timer_RecheckLandingTimerID)

	;Set up aiValue1, ship crew percent.
	int shipCrewPercent
	if (shipRef.HasKeyword(BESurfaceCrewSize_NoCrew))
		shipCrewPercent = 0
	ElseIf (shipRef.HasKeyword(BESurfaceCrewSize_25Percent))
		shipCrewPercent = 25
	ElseIf (shipRef.HasKeyword(BESurfaceCrewSize_50Percent))
		shipCrewPercent = 50
	ElseIf (shipRef.HasKeyword(BESurfaceCrewSize_75Percent))
		shipCrewPercent = 75
	Else
		shipCrewPercent = 100
	EndIf

	;Set up aiValue2, encounter mode.
	int encounterMode
	if (shipRef.HasKeyword(BEDropship))
		encounterMode = CONST_EncounterMode_Dropship
	EndIf

	;Start the encounter.
	debug.trace(self + " starting surface encounter with story event " + BEEncounterTypeSurface)	
	BEEncounterTypeSurface.SendStoryEvent(akLoc=shipRef.GetCurrentLocation(), akRef2=shipRef, aiValue1=shipCrewPercent, aiValue2=encounterMode)

	;And stop the landing quest.
	Stop()
EndFunction


;---------------------------------------------
;Patch Functions
;----------------------

Function PATCH_RecheckLanding()
	if (IsRunning())
		if (Ship.GetRef() == None)
			;If this quest no longer has a ship (because it was cleaned up by something else?),
			;it will never be able to do anything. Abort and shut down.
			Debug.Trace("PATCH: PATCH_RecheckLanding aborts " + Self)
			Stop()
		ElseIf (Ship.GetShipRef().IsLanded())
			;If this quest's ship has landed, but missed its OnShipLanding event, leaving the
			;quest running, call StartSurfaceEncounter to start the encounter.
			;
			;If StartSurfaceEncounter happened to be running as the save was loaded, this is still
			;safe, since the quests that start in response to the story event all reserve the ship,
			;so multiple quests can't start for the same ship. 
			Debug.Trace("PATCH: PATCH_RecheckLanding tried to start " + Self)
			StartSurfaceEncounter()
		Else
			;For all other ships, give the ship a chance to land normally. If it doesn't land after
			;a reasonable interval, assume it's stuck (disabled, stuck in a landing animation, etc.)
			;and try to start its encounter to break the deadlock and clean up BELanding, at least.
			Debug.Trace("PATCH: PATCH_RecheckLanding started timer for " + Self)
			StartTimer(CONST_Timer_RecheckLandingTimerDelay, CONST_Timer_RecheckLandingTimerID)
		EndIf
	EndIf
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_Timer_RecheckLandingTimerID)
		;The ship has failed to land after a reasonable delay, so assume it's not going to.
		Debug.Trace("PATCH: Landing Timer tried to start " + Self)
		StartSurfaceEncounter()
	EndIf
EndEvent