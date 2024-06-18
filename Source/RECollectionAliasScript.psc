Scriptname RECollectionAliasScript extends RefCollectionAlias
{Should be attached to all ref collection aliases in Random Encounter quests.
 NOTE: changes here should also be made to REAliasScript
}

group Flags
	bool Property StartsDead = false auto const
	{Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution.}

	bool Property RegisterAlias = true auto const
	{Default = TRUE; for now, all aliases should register - this property may end up being removed}

	bool Property TrackDeath = false auto const
	{Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details}

	 bool Property TrackOnDying = false auto const
	{Default = FALSE; set to true to fire when actors startdying instead of at the end of dying
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details}

	int Property RequiredStageToFireTrackDeath = -1 auto const
	{If -1 does nothing, otherwise only sends TrackDeath updates when the quest is set to this stage, 
	this is useful for using in conjunction witht he encounter wave setup that populates a RE RefCol}

	bool property ForceRefsToEnable = True auto const
	{When set to False, if the Reference Collection Alias is set to Initially Disabled then this script will not force them to become enabled.}
endGroup

group DeadCountGroups
	int Property GroupIndex = 0 auto const
	{ Default = 0; used for tracking death, if you have more than one group.
	This index needs to match how you've set up DeadCounts arrays in REScript}

	bool property AddCollectionSizeToGroupSize = false auto const
	{ if TRUE, will automatically add the collection's size to the group count size }
endGroup

group OnHit
	int Property OnHitStage auto const
	{ stage to set if actor is hit }
	Faction Property OnHitFaction auto const
	{ faction of attacking actor which triggers OnHitStage
	 Default = trigger on hit from player}
endGroup

group Randomize
	int property minimumCount = 0 auto const
	{ if you want to randomize the number that actually appear, set a minimumCount less than the collection size
	  when the quest starts, the number that actually appear will be between minimumCount and the total collection size
	  (the others will be disabled and killed) }

	bool property RemoveUnusedRefs = false auto Const
	{ when set to True, any actors that are "unused" will also be removed from the ref collection 
	  this is mainly to allow BE quests to handle disembarking these actors correctly }

endGroup

; 	Log Variables
	String LocalScriptName 	= "RECollectionAliasScript" const

; 	Setup Functions
	Event OnAliasInit()
		; Register any unique trace data as early as possible.
		REScript owningREScript = GetOwningQuest() as REScript
				
		if RegisterAlias && owningREScript
			Trace(Self, "RECollectionAliasScript registering (" + self as RefCollectionAlias + ") with REScript.")
			owningREScript.RegisterCollectionAlias(self as RefCollectionAlias)
		endif
		CustomRegisterForHit()

		; if randomizing collection count
		int maxCount = GetCount()
		if AddCollectionSizeToGroupSize && GroupIndex > -1 && owningREScript
			owningREScript.AdjustDeadCounts(GroupIndex, maxCount)
		endif

		Trace(self, " OnAliasInit - count=" + maxCount)
		int numberToEnable = maxCount
		if minimumCount > 0 && minimumCount < maxCount
			numberToEnable = Utility.RandomInt(minimumCount, maxCount)
			Trace(self, " OnAliasInit - rolling between " + minimumCount + " and " + maxCount + ": enabling " + numberToEnable)
		endif

		ObjectReference[] refsToEnable = new ObjectReference[0]

		int i = maxCount - 1
		while i > -1
			ObjectReference theRef = GetAt(i) as ObjectReference
			if theRef
				if i < numberToEnable
					refsToEnable.Add(theRef)
				else
					theRef.Disable() 		; just in case collection wasn't set initially disabled
					if theRef is Actor
						(theRef as Actor).Kill() 		; kill so quest can track dead counts
					elseif theRef is SpaceshipReference
						(theRef as SpaceshipReference).Kill() 		; kill so quest can track dead counts
					endif
					if RemoveUnusedRefs
						RemoveRef(theRef)		; remove from collection so BE quests don't reenable them when disembarking from a ship
					endif
				endif
			endif
			i += -1
		endWhile

		if ForceRefsToEnable
			if refsToEnable.Length > 0
				int enableIndex = 0
				while enableIndex < refsToEnable.Length
					refsToEnable[enableIndex].Enable()
					Trace(Self, "RefColl ref " + enableIndex + " set to enable")
					enableIndex += 1
				endWhile
			endif
		endif
	EndEvent

	Event OnLoad(ObjectReference akSenderRef)
		if (StartsDead)
			Actor a = akSenderRef as Actor
			if a && a.IsDead() == false
				a.MoveToMyEditorLocation()

				REScript owningREScript = GetOwningQuest() as REScript
				If owningREScript
					owningREScript.RE_Parent.KillWithForce(a)
				EndIf 
			endif
		endif
	EndEvent

; 	Update Functions
	Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
		if (TrackDeath)
			REScript owningREScript = GetOwningQuest() as REScript
			if owningREScript && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == GetOwningQuest().GetStage())
				owningREScript.IncrementDeadCount(GroupIndex)
			EndIf 
		endIf
	EndEvent

	Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
		if (TrackOnDying)
			REScript owningREScript = GetOwningQuest() as REScript
			if owningREScript && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == GetOwningQuest().GetStage())
				owningREScript.IncrementDeadCount(GroupIndex)
			endIf
		endIf
	EndEvent

	Event OnHit(ObjectReference akSenderRef, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		if OnHitStage > 0 && (akAggressor as Actor)
			debug.trace("OnHit: " + akSenderRef + " hit by " + akAggressor)
			Actor attackingActor = akAggressor as Actor
			if (OnHitFaction && attackingActor.IsInFaction(OnHitFaction)) || (OnHitFaction == NONE && attackingActor == Game.GetPlayer())
				Trace(self, " OnHit: " + akSenderRef + " by " + akAggressor + " owning quest=" + GetOwningQuest() + " setting stage " + OnHitStage)
				GetOwningQuest().SetStage(OnHitStage)
			endif
		endif
		CustomRegisterForHit()
	EndEvent

	function CustomRegisterForHit()
		; register if necessary
		if OnHitStage > 0 && GetOwningQuest().GetStageDone(OnHitStage) == false
			if OnHitFaction
				RegisterForHitEvent(self, OnHitFaction)
			else
				RegisterForHitEvent(self, Game.GetPlayer())
			endif
		endif
	endFunction

;--------------------------------------------------------------------------------------------------
; TRACE LOGS 
;       Standard Trace Functions for handling logs and other formatting functions for readability. 
;--------------------------------------------------------------------------------------------------
;	Trace and warning functions
    Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) DebugOnly
		asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
		REScript owningREScript = GetOwningQuest() as REScript
		if owningREScript
			owningREScript.Trace(CallingObject, asTextToPrint, aiSeverity)
			Debug.Trace(CallingObject + " " + asTextToPrint, aiSeverity)
		Else
			Debug.Trace(CallingObject + " " + asTextToPrint, aiSeverity)
		endif
    EndFunction

	Function Warning(ScriptObject CallingObject, string asTextToPrint, bool DebugTrace=False, int aiSeverity=2, bool bShowNormalTrace=false, bool bShowWarning=True, bool bPrefixTraceWithLogNames=True) BetaOnly
		asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
		REScript owningREScript = GetOwningQuest() as REScript
		if owningREScript
			owningREScript.Warning(CallingObject, asTextToPrint)
		Else
			Debug.Trace(CallingObject + " " + asTextToPrint, aiSeverity)
		endif
	EndFunction
