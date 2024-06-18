Scriptname LC043QuestScript extends Quest Conditional
{Quest script for LC043, SY-920.}

Group AutofillProperties
	LocationAlias property Alias_LC043SY01Location Auto Const Mandatory
	LocationAlias property Alias_LC043SY02Location Auto Const Mandatory
	LocationAlias property Alias_LC043SY03Location Auto Const Mandatory
	Location property LC043SYLocation Auto Const Mandatory
	Location property LC043SYSpaceCellLocation Auto Const Mandatory
	Location property LC043SY01Location Auto Const Mandatory
	Location property LC043SY02Location Auto Const Mandatory
	Location property LC043SY03Location Auto Const Mandatory
	Location property SLuytensStar_PLuytensRock_Orbit Auto Const Mandatory

	RefCollectionAlias property SY_Ships_Prequest_All Auto Const Mandatory
	RefCollectionAlias property SY_Ships_Quest_All Auto Const Mandatory
	RefCollectionAlias property SY_Ships_Postquest_All Auto Const Mandatory
	RefCollectionAlias property SY_Ships_Guards Auto Const Mandatory
	ReferenceAlias property SY_Ships_GuardLeader Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory

	RefCollectionAlias property SY01_ActorsAll Auto Const Mandatory
	RefCollectionAlias property SY02_ActorsAll Auto Const Mandatory
	RefCollectionAlias property SY03_ActorsAll Auto Const Mandatory
	Faction property LC043SY01Faction Auto Const Mandatory
	Faction property LC043SY02Faction Auto Const Mandatory
	Faction property LC043SY03Faction Auto Const Mandatory

	RefCollectionAlias property SY01_CargoBayLoungeGuards Auto Const Mandatory
	RefCollectionAlias property SY01_CargoBayTrespassTriggers Auto Const Mandatory
	ReferenceAlias property SY03_AlarmGuardRemovalTrigger Auto Const Mandatory
	RefCollectionAlias property SY03_AlarmGuards Auto Const Mandatory

	ActorValue property Suspicious Auto Const Mandatory
	ActorValue property LC043_GuardConfrontActiveConfrontValue Auto Const Mandatory
	Message property LC043_TrespassMessage Auto Const Mandatory
	Scene property LC043_10_GuardConfront Auto Const Mandatory
	WWiseEvent property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const Mandatory
EndGroup

;Local Variables
bool property playerWasInTrespassTrigger Auto Hidden Conditional

;Local Consts
int CONST_GuardShipConfrontationSceneDelay = 0 Const

int CONST_Stage_Space_NonquestGuardsHostile = 50 Const
int CONST_Stage_Space_QuestSetupStage = 99 Const
int CONST_Stage_Space_QuestEscapeStartedStage = 460 Const
int CONST_Stage_Space_PostquestSetupStage = 1000 Const
int CONST_Stage_SY01_EntryStage = 100 Const
int CONST_Stage_SY02_EntryStage = 200 Const
int CONST_Stage_SY03_EntryStage = 300 Const
int CONST_Stage_SY01_AccessGrantedStage = 120 Const
int CONST_Stage_SY01_SecurityAlarmTriggeredStage = 150 Const
int CONST_Stage_SY03_HuanBetrayedStage = 320 Const

int CONST_UpdateSY01StateTimerID = 1 Const
float CONST_UpdateSY01StateTimerDelay = 0.5 Const

;Guards
Guard SY01State ProtectsFunctionLogic


;-------------------------------------
;Initialization
;---------------

Event OnQuestInit()
	;Register for events.
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
	RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers, "OnTriggerEnter")
	RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers, "OnTriggerLeave")
	RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger, "OnTriggerEnter")

	;Call HandleLocationChange if appropriate.
	if (PlayerShip.GetRef().GetCurrentLocation() == LC043SYSpaceCellLocation)
		Var[] akArgs = new Var[2]
		akArgs[0] = None
		akArgs[1] = LC043SYSpaceCellLocation
		CallFunctionNoWait("HandleLocationChange", akArgs)
	EndIf
EndEvent


;-------------------------------------
;Alias Setup & Cleanup
;----------------------
;
;LC043 starts the first time you enter SY-920's space cell and remains running thereafter.
;To avoid making every actor in the interior persistent from that point forward, I delay filling
;the interior aliases until CF05 starts, and clear them when it ends.

Function CleanupPrequestAliases()
	SY_Ships_Prequest_All.RemoveAll()
	LC043SYSpaceCellLocation.Reset()
	SY_Ships_Quest_All.ResetAll()
EndFunction

Function CleanupQuestAliases()
	SY_Ships_Quest_All.RemoveAll()
	Alias_LC043SY01Location.ForceLocationTo(None)
	Alias_LC043SY02Location.ForceLocationTo(None)
	Alias_LC043SY03Location.ForceLocationTo(None)
	Alias_LC043SY01Location.RefillDependentAliases()
	Alias_LC043SY02Location.RefillDependentAliases()
	Alias_LC043SY03Location.RefillDependentAliases()
	LC043SYSpaceCellLocation.Reset()
	SY_Ships_Postquest_All.ResetAll()
EndFunction

Function FillInteriorAliases()
	Alias_LC043SY01Location.ForceLocationTo(LC043SY01Location)
	Alias_LC043SY01Location.RefillDependentAliases()
	SetCollectionCrimeFaction(SY01_ActorsAll, LC043SY01Faction)
	LC043SY01Location.Reset()
	SY01_ActorsAll.ResetAll()

	Alias_LC043SY02Location.ForceLocationTo(LC043SY02Location)
	Alias_LC043SY02Location.RefillDependentAliases()
	SetCollectionCrimeFaction(SY02_ActorsAll, LC043SY02Faction)
	LC043SY02Location.Reset()
	SY02_ActorsAll.ResetAll()

	Alias_LC043SY03Location.ForceLocationTo(LC043SY03Location)
	Alias_LC043SY03Location.RefillDependentAliases()
	SetCollectionCrimeFaction(SY03_ActorsAll, LC043SY03Faction)
	LC043SY03Location.Reset()
	SY03_ActorsAll.ResetAll()

	RegisterForTriggerEvents()
EndFunction

Function SetCollectionCrimeFaction(RefCollectionAlias actorCol, Faction crimeFaction)
	int i = 0
	int count = actorCol.GetCount()
	While (i < count)
		(actorCol.GetAt(i) as Actor).SetCrimeFaction(crimeFaction)
		i = i + 1
	EndWhile
EndFunction

Function RegisterForTriggerEvents()
	ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray()
	int i = 0
	While (i < trespassTriggerRefs.Length)
		RegisterForRemoteEvent(trespassTriggerRefs[i], "OnTriggerEnter")
		RegisterForRemoteEvent(trespassTriggerRefs[i], "OnTriggerLeave")
		i = i + 1
	EndWhile
	RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger.GetRef(), "OnTriggerEnter")
EndFunction


;-------------------------------------
;Event Handling
;---------------

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
	HandleLocationChange(akOldLoc, akNewLoc)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
	HandleLocationChange(akOldLoc, akNewLoc)
EndEvent

Function HandleLocationChange(Location akOldLoc, Location akNewLoc)
	if ((akNewLoc == LC043SYSpaceCellLocation) && (!GetStageDone(CONST_Stage_SY03_EntryStage) || GetStageDone(CONST_Stage_Space_PostquestSetupStage)))
		;On arrival in the space cell, start the Guard Confrontation scene if appropriate.
		int currentStage = GetStage()
		if (!GetStageDone(CONST_Stage_Space_NonquestGuardsHostile) && ((currentStage < CONST_Stage_Space_QuestSetupStage) || (currentStage >= CONST_Stage_Space_PostquestSetupStage)))
			SetupGuardConfrontation()
		EndIf
	ElseIf ((akNewLoc == LC043SY01Location) && (!GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage)))
		SetStage(CONST_Stage_SY01_EntryStage)
	ElseIf ((akNewLoc == LC043SY02Location) && (!GetStageDone(CONST_Stage_SY02_EntryStage)))
		SetStage(CONST_Stage_SY02_EntryStage)
	ElseIf ((akNewLoc == LC043SY03Location) && (!GetStageDone(CONST_Stage_SY03_EntryStage)))
		SetStage(CONST_Stage_SY03_EntryStage)
	ElseIf ((akOldLoc == LC043SYSpaceCellLocation) && (!akNewLoc.IsChild(LC043SYSpaceCellLocation)) && \
		(GetStageDone(CONST_Stage_Space_QuestEscapeStartedStage)) && (!GetStageDone(CONST_Stage_Space_PostquestSetupStage)))
		SetStage(CONST_Stage_Space_PostquestSetupStage)
	EndIf
EndFunction



Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActionRef)
	if (SY01_CargoBayTrespassTriggers.Find(source) >= 0)
		UpdateTrespassTriggerStatus()
    ElseIf ((source == SY03_AlarmGuardRemovalTrigger.GetRef()) && (SY03_AlarmGuards.Find(akActionRef) >= 0) && (GetStageDone(CONST_Stage_SY03_HuanBetrayedStage)))
    	akActionRef.DisableNoWait(True)
    EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference source, ObjectReference akActionRef)
	if (SY01_CargoBayTrespassTriggers.Find(source) >= 0)
		UpdateTrespassTriggerStatus()
    EndIf
EndEvent

Auto State Waiting
	Function UpdateTrespassTriggerStatus()
		GotoState("Busy")
		if (GetStageDone(CONST_Stage_SY01_AccessGrantedStage) || GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage))
			UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers, "OnTriggerEnter")
			UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers, "OnTriggerLeave")
		Else
			bool playerIsInTrespassTrigger = False
			Actor player = Game.GetPlayer()
			ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray()
			int i = 0
			While (!playerIsInTrespassTrigger && (i < trespassTriggerRefs.Length))
				playerIsInTrespassTrigger = trespassTriggerRefs[i].IsInTrigger(player)
				i = i + 1
			EndWhile
			if (playerIsInTrespassTrigger && !playerWasInTrespassTrigger)
				LC043_TrespassMessage.Show()
			EndIf
			playerWasInTrespassTrigger = playerIsInTrespassTrigger
			SY01_CargoBayLoungeGuards.EvaluateAll()
		EndIf
		GotoState("Waiting")
	EndFunction
EndState

State Busy
EndState

Function UpdateTrespassTriggerStatus()
EndFunction


;-------------------------------------
;Space Guard Leader
;-------------------

Function SetupGuardConfrontation(bool shouldStartStandardConfrontationScene=True)
	SY_Ships_GuardLeader.RefillAlias()
	SY_Ships_Guards.RefillAlias()
	SpaceshipReference[] guardShipRefs = SY_Ships_Guards.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < guardShipRefs.Length)
		guardShipRefs[i].SetValue(LC043_GuardConfrontActiveConfrontValue, 1)
		guardShipRefs[i].EvaluatePackage()
		i = i + 1
	EndWhile
	if (shouldStartStandardConfrontationScene)
		Utility.Wait(CONST_GuardShipConfrontationSceneDelay)
		LC043_10_GuardConfront.Start()
	EndIf
EndFunction


;-------------------------------------
;Security Alarms
;----------------

Function TriggerSecurityAlarm(RefCollectionAlias enemyCol, Faction enemyFaction)
	;Play the security alarm SFX.
	Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer())
	;Use CrimeGold to make enemyFaction hostile to the player,
	;even if the player is wearing a uniform.
	enemyFaction.SetCrimeGoldViolent(1000)
	;Activate the robots and turrets. EVP them and all other actors in the cell.
	Actor[] enemies = enemyCol.GetArray() as Actor[]
	int i = 0
	While (i < enemies.Length)
		RobotPodScript robotActor = enemies[i] as RobotPodScript
		if (robotActor != None)
			robotActor.WakeRobotFromPod()
		ElseIf (enemies[i].IsUnconscious())
			enemies[i].SetUnconscious(False)
		EndIf
		enemies[i].SetValue(Suspicious, 1)
		enemies[i].EvaluatePackage()
		i = i + 1
	EndWhile
EndFunction


;-------------------------------------
;Prototype Ship Escape
;----------------------

Function BlockSpaceTravelForEscape(bool shouldBlock)
	SLuytensStar_PLuytensRock_Orbit.EnableSpaceTravel(Self, !shouldBlock)
EndFunction