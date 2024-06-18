Scriptname DNLocalAlarmScript extends ObjectReference
{Script for a localized alarm system that wakes linked robots and turrets.}

Group OptionalProperties
	Quest property AlarmQuest Auto Const
	int property AlarmPrereqStage = -1 Auto Const
	int property AlarmTurnOffStage = -1 Auto Const
	int property AlarmStageToSet = -1 Auto Const
	float property TargetTriggerDelayMin = 0.0 Auto Const
	float property TargetTriggerDelayMax = 1.0 Auto Const
	bool property ShouldSkipAlarmSFX = False Auto Const
EndGroup

Group AutofillProperties
	Keyword property DNLocalAlarmSourceLinkKeyword Auto Const Mandatory
	Keyword property DNLocalAlarmTargetLinkKeyword Auto Const Mandatory
	WwiseEvent property AlarmSound Auto Const ;NOT Mandatory
EndGroup


;State properties.
int property AlarmState Auto Hidden Conditional

;Local consts.
int CONST_AlarmState_Armed = 0 Const
int CONST_AlarmState_Disarmed = 1 Const
int CONST_AlarmState_Triggered = 2 Const

int CONST_CombatState_IsInCombat = 1 Const

;Local variables.
int alarmSFXID = -1


;-----------------------------
;States
;-------

Auto State Initial
	Event OnCellLoad()
		GoToState("Armed")
		SetAlarmSourceObjectState(GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword), True)
		SetAlarmSourceObjectState(GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword), True)
	EndEvent
EndState

State Armed
	Event OnBeginState(String oldStateName)
		AlarmState = CONST_AlarmState_Armed
	EndEvent

	Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
		GoToState("Busy")
		Debug.Trace(Self + ": Trying to trigger OnCombatStateChanged for " + akSource + " " + akTarget)
		TryToTriggerAlarm(akSource)
	EndEvent

	Event OnGainLoS(ObjectReference akViewer, ObjectReference akTarget)
		GoToState("Busy")
		Debug.Trace(Self + ": Trying to trigger OnGainLoS for " + akViewer + " " + akTarget)
		TryToTriggerAlarm(akViewer as Actor)
	EndEvent

	Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
		GoToState("Busy")
		Debug.Trace(Self + ": Trying to trigger OnTriggerEnter for " + akSource + " " + akActionRef)
		TryToTriggerAlarm(akSource as Actor)
	EndEvent
EndState

State Busy
	;Do nothing.
EndState

State Disarmed
	Event OnBeginState(String oldStateName)
		AlarmState = CONST_AlarmState_Disarmed
		UnregisterForAllEvents()
	EndEvent
EndState

State Triggered
	Event OnBeginState(String oldStateName)
		AlarmState = CONST_AlarmState_Triggered
		if ((AlarmQuest != None) && (AlarmStageToSet >= 0))
			AlarmQuest.SetStage(AlarmStageToSet)
		EndIf
	EndEvent
EndState


Function Arm()
	if ((AlarmQuest == None) || (!AlarmQuest.GetStageDone(AlarmTurnOffStage)))
		GoToState("Armed")
		SetAlarmSourceObjectState(GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword), True)
		SetAlarmSourceObjectState(GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword), True)
	EndIf
EndFunction

Function TriggerAlarm()
	TryToTriggerAlarm(None)
EndFunction

Function TryToTriggerAlarm(Actor akSource)
	if ((AlarmQuest == None) || (((AlarmPrereqStage < 0) || (AlarmQuest.GetStageDone(AlarmPrereqStage))) && ((AlarmTurnOffStage < 0) || (!AlarmQuest.GetStageDone(AlarmTurnOffStage)))))
		if ((akSource == None) || ((!akSource.IsDead()) && (akSource.GetCombatState() == CONST_CombatState_IsInCombat) && (akSource.HasDetectionLOS(Game.GetPlayer()))))
			;Debug.Trace(Self + " triggers alarm for " + akSource)
			GoToState("Triggered")
			Private_TriggerAlarm(akSource)
		EndIf
	EndIf
	if (GetState() == "Busy")
		;Debug.Trace(Self + " rearms for " + akSource)
		GoToState("Armed")
	EndIf
EndFunction

Function Disarm()
	GoToState("Disarmed")
	SetAlarmSourceObjectState(GetLinkedRefChain(DNLocalAlarmSourceLinkKeyword), False)
	SetAlarmSourceObjectState(GetRefsLinkedToMe(DNLocalAlarmSourceLinkKeyword), False)
EndFunction


;-----------------------------
;Functions
;----------

Function SetAlarmSourceObjectState(ObjectReference[] sources, bool isArmed)
	Actor player = Game.GetPlayer()
	int i = 0
	While (i < sources.Length)
		Actor sourceAsActor = sources[i] as Actor
		if (sourceAsActor != None)
			RegisterForRemoteEvent(sourceAsActor, "OnCombatStateChanged")
			RegisterForDetectionLOSGain(sourceAsActor, player)
			if (isArmed)
				sourceAsActor.SetUnconscious(False)
			Else
				sourceAsActor.SetUnconscious(True)
			EndIf
		Else
			RegisterForRemoteEvent(sources[i], "OnTriggerEnter")
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function StopAlarmSFX()
	if (alarmSFXID >= 0)
		WwiseEvent.StopInstance(alarmSFXID)
		alarmSFXID = -1
	EndIf
EndFunction


Function Private_TriggerAlarm(Actor source)
	if (!ShouldSkipAlarmSFX && (AlarmSound != None))
		if (source == None)
			source == Game.GetPlayer()
		EndIf
		alarmSFXID = AlarmSound.Play(source)
	EndIf
	Private_TriggerAlarmForRefs(GetLinkedRefChain(DNLocalAlarmTargetLinkKeyword))
	Private_TriggerAlarmForRefs(GetRefsLinkedToMe(DNLocalAlarmTargetLinkKeyword))
EndFunction

Function Private_TriggerAlarmForRefs(ObjectReference[] alarmedRefs)
	int i = 0
	While ((i < alarmedRefs.Length) && (GetState() != "Disarmed"))
		Actor currentAsActor = alarmedRefs[i] as Actor
		if (currentAsActor != None)
			RobotPodScript currentAsRobotActor = currentAsActor as RobotPodScript
			if (currentAsRobotActor != None)
				currentAsRobotActor.WakeRobotFromPod()
			Else
				currentAsActor.SetUnconscious(False)
			EndIf
			if (TargetTriggerDelayMax > 0)
				Utility.Wait(Utility.RandomFloat(TargetTriggerDelayMin, TargetTriggerDelayMax))
			EndIf
		Else
			DNLocalAlarmScript currentAsAlarmScript = alarmedRefs[i] as DNLocalAlarmScript
			if (currentAsAlarmScript != None)
				currentAsAlarmScript.TriggerAlarm()
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction




;Empty State Events
Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
EndEvent

Event OnGainLoS(ObjectReference akViewer, ObjectReference akTarget)
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
EndEvent

Event OnTimer(int timerID)
EndEvent