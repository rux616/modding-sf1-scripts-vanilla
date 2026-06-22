Scriptname REAliasScript extends ReferenceAlias
{Should be attached to all aliases in Random Encounter and Overlay Encounter Quests.
	NOTE: changes here should also be made to RECollectionAliasScript }

Group Flags
	bool Property StartsDead = false auto Const
		{Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution.}

	bool Property RegisterAlias = true auto const
		{Default = TRUE; for now, all aliases should register - this property may end up being removed}

	bool Property TrackDeath = false auto const
		{Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
		NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }

	int Property GroupIndex = 0 auto const
		{Default = 0; used for tracking death, if you have more than one group.
		This index needs to match how you've set up DeadCounts arrays in REScript}

	int Property OnHitStage auto const
		{Stage to set if actor is hit.}

	Faction Property OnHitFaction auto const
		{Faction of attacking actor which triggers OnHitStage. 
		Default = trigger on hit from player}
EndGroup 

; 	Script Variables
	String LocalScriptName 	= "REAliasScript" const

; 	Setup Functions
	Event OnAliasInit()
		; Register any unique trace data as early as possible.
		REScript owningREScript = GetOwningQuest() as REScript
		
		; tell parent quest script about this script
		if RegisterAlias && owningREScript
			Trace(Self, "REAliasScript registering (" + self as ReferenceAlias + ") with REScript.")
			owningREScript.RegisterAlias(self as ReferenceAlias)
		endif
		CustomRegisterForHit()
	EndEvent

	Event OnLoad()
		if (StartsDead)
			trace(self, " StartsDead = true : killing")
			Actor a = Self.GetActorRef()
			if a && a.IsDead() == false
				a.MoveToMyEditorLocation()
				REScript owningREScript = GetOwningQuest() as REScript
				IF owningREScript
					owningREScript.RE_Parent.KillWithForce(a)
				Else
					a.KillSilent()
				EndIf 
			endif
		endif
	EndEvent

; 	Update Functions
	Event OnUnload()
		UnregisterForAllHitEvents()
	EndEvent

	Event OnDeath(ObjectReference akKiller)
		REScript owningREScript = GetOwningQuest() as REScript
		if TrackDeath && owningREScript
			owningREScript.IncrementDeadCount(GroupIndex)
		endif
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		trace(self, " OnHit " + akTarget + ", " + akAggressor + ", " + akSource)
		if OnHitStage > 0 && (akAggressor as Actor)
			Actor attackingActor = akAggressor as Actor
			if (OnHitFaction && attackingActor.IsInFaction(OnHitFaction)) || (OnHitFaction == NONE && attackingActor == Game.GetPlayer())
				GetOwningQuest().SetStage(OnHitStage)
			endif
		endif
		CustomRegisterForHit()
	EndEvent

	function CustomRegisterForHit()
		trace(self, "CustomRegisterForHit")
		; register if necessary
		if OnHitStage > 0 && GetOwningQuest().GetStageDone(OnHitStage) == false
			if OnHitFaction
				trace(self, " RegisterForHitEvent from " + OnHitFaction)
				RegisterForHitEvent(self, OnHitFaction)
			else
				trace(self, " RegisterForHitEvent from player")
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
