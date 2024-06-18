Scriptname SpaceCloudManagerScript extends ObjectReference
{Parent script for Space Cloud Manager Objects.
When placed in a cell with space cloud hazards, a manager handles adding or removing effects from ships under the influence of the cloud.
This allows us to do things like add or remove perks, or periodically cast scripted spells, which the hazard system doesn't normally support.}

Group RequiredProperties
	ReferenceAlias property PlayerShip Auto Const Mandatory
	{SQ_PlayerShip's PlayerShip alias.}

	ActorValue property UpdateTimestampValue Auto Const
	{Actor value used to timestamp when each ship was last updated by this script.}
EndGroup

Group GeneralProperties
	RefCollectionAlias property PotentialTargets Auto Const
	{Optional. RefCollection of ships that may be affected in addition to the player's ship.
	NPC ships not in this collection will not be affected.
	Space clouds are not generic-- you have to know in advance which ships might end up in the cell.}

	ActorValue property HazardValue Auto Const
	{Optional.
	If set, apply our effects only to to ships where this value is <0.
	If not set, apply our effects to all target ships.}

	bool property ShouldOverrideConditionsForNPCShips = False Auto Const
	{Default=False. Should we apply our effects to all NPC ships in the PotentialTargets array, ignoring the Docked and Dead states?}
EndGroup

;Local Consts
int CONST_SpaceCloudHazardTimerID = 1 Const
float CONST_SpaceCloudHazardTimerDelay = 0.25 Const
float CONST_HazardValueMax = 100000.0 Const

int CONST_FarTravelStateDeparture = 0 Const
int CONST_GravJumpStateAnimStarted = 1 Const

;Local Variables
bool spaceTransitionInProgress


Event OnLoad()
	StartTimer(0, CONST_SpaceCloudHazardTimerID)
	RegisterForRemoteEvent(PlayerShip, "OnShipFarTravel")
	RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, int aState)
	if (aState == CONST_FarTravelStateDeparture)
		spaceTransitionInProgress = True
	Else
		spaceTransitionInProgress = False
	EndIf
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, int aState)
	if (aState == CONST_GravJumpStateAnimStarted)
		spaceTransitionInProgress = True
	Else
		spaceTransitionInProgress = False
	EndIf
EndEvent


Event OnTimer(int timerID)
	if (timerID == CONST_SpaceCloudHazardTimerID)

		;Build our list of potential targets.
		SpaceshipReference[] potentialTargetRefs
		if (PotentialTargets != None)
			potentialTargetRefs = PotentialTargets.GetArray() as SpaceshipReference[]
		EndIf
		if (potentialTargetRefs == None)
			potentialTargetRefs = new SpaceshipReference[0]
		EndIf
		potentialTargetRefs.Insert(PlayerShip.GetShipRef(), 0)

		;Debug.Trace("SpaceCloudManagerScript " + Self + "-------------------")
		if (Is3DLoaded())
			;The player is in our space cell. Update all of the ships we're tracking.
			float currentTime = Utility.GetCurrentRealTime()
			int i = 0
			While (i < potentialTargetRefs.Length)
				if (potentialTargetRefs[i] != None)
					TryToApplyCloudEffect(potentialTargetRefs[i], currentTime)
				EndIf
				i = i + 1
			EndWhile
			StartTimer(CONST_SpaceCloudHazardTimerDelay, CONST_SpaceCloudHazardTimerID)
		Else
			;The player is not in our space cell. Clear our effect from all of the ships we're tracking.
			int i = 0
			While (i < potentialTargetRefs.Length)
				if (potentialTargetRefs[i] != None)
					TryToClearCloudEffect(potentialTargetRefs[i])
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndIf
EndEvent


Function TryToApplyCloudEffect(SpaceshipReference target, float currentTime)
	if ((!spaceTransitionInProgress) && (target.IsEnabled()) && \
		((ShouldOverrideConditionsForNPCShips && (target != PlayerShip.GetShipRef())) || \
		((!target.IsDead()) && (!target.IsDocked()))))	
			if ((HazardValue != None) && (target == PlayerShip.GetShipRef()))
				Debug.Trace("TryToApplyCloudEffect: " + target + "'s value of " + HazardValue + "=" + target.GetValue(HazardValue))
			EndIf
			if ((HazardValue == None) || (target.GetValue(HazardValue) < 0))
				ApplyCloudEffect(target, currentTime)
				if (HazardValue != None)
					target.RestoreValue(HazardValue, CONST_HazardValueMax)
				EndIf
				target.SetValue(UpdateTimestampValue, currentTime)
			ElseIf (target.GetValue(UpdateTimestampValue) > 0)
				RemoveCloudEffect(target)
				target.SetValue(UpdateTimestampValue, 0)
			EndIf
	EndIf
EndFunction

Function TryToClearCloudEffect(SpaceshipReference target)
	Debug.Trace("TryToClearCloudEffect: Clearing hazard effect from " + target)
	RemoveCloudEffect(target)
	if (HazardValue != None)
		target.RestoreValue(HazardValue, CONST_HazardValueMax)
	EndIf
	target.SetValue(UpdateTimestampValue, 0)
EndFunction


;To be overridden by child scripts.
Function ApplyCloudEffect(SpaceshipReference target, float currentTime)
EndFunction

Function RemoveCloudEffect(SpaceshipReference target)
EndFunction