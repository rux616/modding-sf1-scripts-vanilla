Scriptname COM_CommentTriggerScript extends ObjectReference
{Companion entering this trigger will send an AffinityEvent.
If there is a linked ref attached to this trigger, the companion will attempt to walk to it before sending the AffinityEvent.
If there is a linked ref attached to this trigger, that will be the Target of the AffinityEvent.}

Group Autofill CollapsedOnRef
	SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto 
	{autofill}
EndGroup

Group Advanced CollapsedOnRef
	keyword Property COM_CommentTriggerStart Mandatory Const Auto 
	{autotfill (if using default); they keyword that starts the quest that packages the Companion to walk to the thing to comment on (if linked ref to this trigger)
if you want to use a specifc quest for something custom, you can replace this property with another keyword to start that quest. It will need the COM_CommentTriggerQuestScript to call back to this trigger.}
EndGroup

Group Properties
	bool Property OncePerCompanion = true Const Auto
	{if true (default), this is triggered only once per companion}

	ConditionForm Property COM_CND_Comment_CommentsAllowed Mandatory Const Auto
	{Condition form used when multiple companions are following to prevent comment stomping}

	AffinityEvent Property AffinityEventToSend Mandatory Const Auto
	{This is the affinity event to send. 

Primarily it will be used for it's data such as Topic To Say data
But also consider using the data for "Allow Repeated Event," and "Cool Down Days."
Use random info stacks and "say once" info flags if you want to have randomized or finite things to say in conjunction with allow repeated and cool days.}
EndGroup

CompanionActorScript TriggeringCompanionRef

int[] DoneIDs ;holds an int corresponding to each companion

Event OnUnload()
	UnregisterForAllEvents()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)

	if OncePerCompanion && DoneIDs == None
		DoneIDs = new int[0]
	endif

	TriggeringCompanionRef = akActionRef as CompanionActorScript

	if TriggeringCompanionRef && COM_CND_Comment_CommentsAllowed.IsTrue(TriggeringCompanionRef)
		;check to make sure we haven't done this before, or don't care if we have
		bool alreadyTriggered = false
		int companionID = -1
		if OncePerCompanion
			companionID = TriggeringCompanionRef.GetCompanionIDValueInt()
			alreadyTriggered = DoneIDs.Find(companionID) > -1 ;found
		endif

		if OncePerCompanion == false || alreadyTriggered == false
			;ignore temporarily if in combat
			if IsCompanionOrPlayerInCombat()
				Trace(self, "OnTriggerEnter() companion or player is in combat, registering for OnCombatStateChange for player and TriggeringCompanionRef: " + TriggeringCompanionRef)
				RegisterForRemoteEvent(Game.GetPlayer(), "OnCombatStateChanged")
				RegisterForRemoteEvent(TriggeringCompanionRef, "OnCombatStateChanged")
			else
				Trace(self, "OnTriggerEnter() calling StartCommentSceneQuest() TriggeringCompanionRef: " + TriggeringCompanionRef)
				StartCommentSceneQuest()
			endif

		else ;companion already triggered this
			Trace(self, "OnTriggerEnter() ignoring because CompanionID already in DoneIDs. companionID: " + companionID + ", DoneIDs: " + DoneIDs)

		endif



	EndIf
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, int aeCombatState)
	Trace(self, "OnCombatStageChanged() akSender: " + akSender + ", aeCombatState: " + aeCombatState)
	if TriggeringCompanionRef && IsCompanionOrPlayerInCombat() == false

		;if companion still in trigger send event, otherwise ignore
		if  IsInTrigger(TriggeringCompanionRef)
			Trace(self, "OnCombatStateChanged() combat ended, companion still in trigger. Calling StartCommentSceneQuest() TriggeringCompanionRef: " + TriggeringCompanionRef)
			StartCommentSceneQuest()
		else
			Trace(self, "OnCombatStateChanged() combat ended, but companion NOT still in trigger. IGNORING. ")		
		endif
	endif
EndEvent

bool Function IsCompanionOrPlayerInCombat()
	bool triggeringCompanionIsInCombat = TriggeringCompanionRef && TriggeringCompanionRef.IsInCombat()
	bool playerIsInCombat = Game.GetPlayer().IsInCombat()
	bool returnVal = triggeringCompanionIsInCombat || playerIsInCombat
	Trace(self, "IsCompanionOrPlayerInCombat() returnVal: " + returnVal + "...  triggeringCompanionIsInCombat: " + triggeringCompanionIsInCombat + ", Player.IsInCombat(): " +  playerIsInCombat)
	return returnVal
EndFunction


Function StartCommentSceneQuest()
	if TriggeringCompanionRef
		Trace(self, "StartCommentSceneQuest TriggeringCompanionRef: " + TriggeringCompanionRef)
		
		if ((SQ_Companions as Quest) as CompanionAffinityEventsScript).IsNearImportantScene() == false

			if OncePerCompanion
				DoneIDs.Add(TriggeringCompanionRef.GetCompanionIDValueInt())
				Trace(self, "StartCommentSceneQuest() DoneIDs: " + DoneIDs)
			endif

			;we start a quest that has a scene in case the companion should walk up to a target before commenting... then that quest sends the affinity event when the scene ends
			;quest that should start: COM_CommentTriggerQuest
			;see also COM_CommentTriggerQuestScript attached to that quest
			Quest[] startedQuests = COM_CommentTriggerStart.SendStoryEventAndWait(akRef1 = self, akRef2 = TriggeringCompanionRef)
			bool successfullyStartedQuest = startedQuests.Length > 0
			Trace(self, "StartCommentSceneQuest() successfullyStartedQuest: " + successfullyStartedQuest + ", startedQuests[0]: " + startedQuests[0])

		else ;someone is in a scene, so skip for now
			Trace(self, "StartCommentSceneQuest() IsNearImportantScene() == true, IGNORING.")
		endif
    endif

	TriggeringCompanionRef = None
EndFunction

;called by COM_CommentTriggerQuestScript
Function SendAffinityEvent(CompanionActorScript CompanionActorRef, ObjectReference TargetRef = None)
	Trace(self, "SendAffinityEvent() AffinityEventToSend: " + AffinityEventToSend + ", CompanionActorRef: " + CompanionActorRef + ", TargetRef: " + TargetRef)	
	AffinityEventToSend.Send(akTarget = TargetRef)	
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CommentTrigger", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction


bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CommentTrigger", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
