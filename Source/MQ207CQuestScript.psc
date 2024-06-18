Scriptname MQ207CQuestScript extends Quest Conditional
{Quest script for MQ207C, Entangled.}
;
;This script handles quest event logic not related to shifting. See the other quest script, MQ207CShiftingScript, for that.

Group QuestProperties
	String[] property AttackAnimEventNames Auto Const Mandatory
	{Array of animation events that indicate the player is attacking. In the Storage Corridor event, register for these events and shift in response.}

	Perk[] property QuickstartPerks Auto Const Mandatory
	{Array of perks to give the player for quickstarts, to satisfy dialogue condition checks.}
EndGroup

Group AutofillProperties
	ReferenceAlias property AnnouncementMarker Auto Const Mandatory
	ReferenceAlias property Alias_EthanHughes Auto Const Mandatory
	ReferenceAlias property Alias_MariaHughes Auto Const Mandatory
	ReferenceAlias property Alias_DirectorPatel Auto Const Mandatory
	ReferenceAlias property Alias_RafaelAguerro Auto Const Mandatory
	ReferenceAlias property NishinaExt_LandingPadWaitMarker Auto Const Mandatory
	ReferenceAlias property NishinaExt_ExteriorDoor_I Auto Const Mandatory
	ReferenceAlias property NishinaExt_Intercom Auto Const Mandatory
	ReferenceAlias property Nishina01_StorageCorridorFailsafeMarker_I Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomWave2Activator_I Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomWave3Activator_I Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomWave2Activator_II Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomWave3Activator_II Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomMusicTrigger_I Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactRoomMusicTrigger_II Auto Const Mandatory
	ReferenceAlias property Nishina02_PowerInterlockChainHead_I Auto Const Mandatory
	ReferenceAlias property Nishina02_PowerInterlockChainHead_II Auto Const Mandatory
	ReferenceAlias property Nishina02_EmergencyShutdown_I Auto Const Mandatory
	ReferenceAlias property Nishina02_EmergencyShutdown_II Auto Const Mandatory
	ReferenceAlias property Nishina02_LabControlTerminal_I Auto Const Mandatory
	ReferenceAlias property Nishina02_LabControlTerminal_II Auto Const Mandatory
	ReferenceAlias property Nishina02_PrimaryCalibration_I Auto Const Mandatory
	ReferenceAlias property Nishina02_PrimaryCalibration_II Auto Const Mandatory
	ReferenceAlias property Nishina01_DrOfficeBedFurniture_III Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactActivator_I Auto Const Mandatory
	ReferenceAlias property Nishina02_ArtifactActivator_II Auto Const Mandatory
	ReferenceAlias property MQ207B_Artifact02QuestObject Auto Const Mandatory

	RefCollectionAlias property Nishina02_ExperimentBeamLights_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_ExperimentBeamLights_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_ArtifactBeckonSFX_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_ArtifactBeckonSFX_II Auto Const Mandatory
	RefCollectionAlias property Nishina01_GuidanceTriggers_II Auto Const Mandatory
	RefCollectionAlias property Nishina01_StorageCorridorCreatures_II Auto Const Mandatory
	RefCollectionAlias property Nishina01_CreaturesAll_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_Alarms_All_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_RobotsAndTurrets_All_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_RobotsToDisablePostquest_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_PowerInterlocks_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_PowerInterlocks_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_ExperimentBeams_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_ExperimentBeams_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_ExperimentBeamHazards Auto Const Mandatory
	RefCollectionAlias property Nishina02_CreaturesAll_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_TerminalsAll Auto Const Mandatory
	RefCollectionAlias property Nishina02_SecurityCameras_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_SecurityCameras_II Auto Const Mandatory

	GlobalVariable property MQ207CTotalInterlockCountGlobal Auto Const Mandatory
	GlobalVariable property MQ207CCurrentInterlockCountGlobal Auto Const Mandatory

	ActorValue property MQ207C_PowerInterlockIDValue Auto Const Mandatory
	ActorValue property MQ207C_LabControlTerminalUniverseValue Auto Const Mandatory
	ActorValue property MQ207C_LabControlTerminalDegaussingCountValue Auto Const Mandatory
	ActorValue property MQ207C_LabControlTerminalDegaussingActiveValue Auto Const Mandatory
	ActorValue property MQ207C_LabControlTerminalCalibrationActiveValue Auto Const Mandatory	

	Message property MQ207C_QuickstartLevelForceMessage Auto Const Mandatory
	Message property MQ207C_PowerInterlockNotRespondingMessage Auto Const Mandatory
	Message property MQ207C_EmergencyShutdownNotReadyMessage Auto Const Mandatory
	Message property MQ207C_EmergencyShutdownAlreadyUsedMessage Auto Const Mandatory	
	Message property MQ207C_PrimaryCalibrationNotReadyMessage Auto Const Mandatory
	Message property MQ207C_PrimaryCalibrationAlreadyUsedMessage Auto Const Mandatory
	Message property MQ207C_PowerInterlock_Engage Auto Const Mandatory
	Message property MQ207C_PowerInterlock_Disengage Auto Const Mandatory
	Message property MQ207C_ShutdownWarningMessage Auto Const Mandatory

	ObjectReference property QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const Mandatory
	ObjectReference property QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef Auto Const Mandatory

	StarbornTempleQuestScript property StarbornTempleQuest Auto Const Mandatory
	SQ_FollowersScript Property SQ_Followers Auto Const Mandatory
	WWiseEvent property WwiseEvent_DRSRemoteUnlock Auto Const Mandatory
	Static property XMarkerHeading Auto Const Mandatory
	FormList property FilterList_InventoryCategoryAidFood Auto Const Mandatory
	Faction property MQ207CNishinaEscortFaction Auto Const Mandatory
	Faction property MQ207CNishinaIEnemyFaction Auto Const Mandatory
	Faction property MQ207CNishinaIFaction Auto Const Mandatory
	ActorValue property AmbushTriggered Auto Const Mandatory
	ActorValue property Experience Auto Const Mandatory
	ActorValue property MQ207C_Nishina01GuidanceTriggerValue Auto Const Mandatory
	MusicType property MUSGenesisCombat_MQ207C_Nishina Auto Const Mandatory
	WWiseEvent property QST_MQ207C_Elevator_Activate_Fail_WEF Auto Const Mandatory
	WWiseEvent property OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF Auto Const Mandatory	
EndGroup


;Local Variables - General
Actor player
MQ207CShiftingQuestScript selfAsShiftingQuest
ObjectReference NishinaExt_IntercomRef
ObjectReference NishinaExt_ExteriorDoor_I_Ref
ObjectReference artifactActivator_I
ObjectReference artifactActivator_II

bool hasCompletedOnQuestInit
bool hasCompletedStartupStage
bool hasStartedStorageCorridorReturnShift
bool musicOverrideActive
InputEnableLayer MQ207CInputEnableLayer

;Local Consts - General
int CONST_QuickstartLevel = 24 Const
int CONST_ReachedSecurityOfficeStage = 450 Const
int CONST_SpeakToMariaStage = 500 Const
int CONST_StorageCorridorShiftBackStageToSet = 155 Const
int CONST_StorageRoomGaveFoodStage = 27 Const
int CONST_TakeTheArtifactStage_I = 721 Const
int CONST_TakeTheArtifactStage_II = 722 Const
int CONST_WaitForTheExperimentStage_III = 780 Const
int CONST_TookTheArtifactStage_I = 731 Const
int CONST_TookTheArtifactStage_II = 732 Const
int CONST_GiveTheArtifactStage_III = 790 Const
int CONST_AllEndingsCommonStage = 900 Const
int CONST_MQ207CArtifactID = 12 Const
int CONST_DamageToFreeArtifact = 99 Const
int CONST_LockLevel_RequiresKey = 255 Const
int CONST_MusicOverrideUpdateTimerDelay = 3 Const
int CONST_MusicOverrideUpdateTimerID = 1 Const


;Conditional Properties - Research Lab Event
bool property frequencyStable Auto Hidden Conditional
bool property allPowerInterlocksEngaged_I Auto Hidden Conditional
bool property allPowerInterlocksEngaged_II Auto Hidden Conditional
bool property degaussingStarted_I Auto Hidden Conditional
bool property degaussingStarted_II Auto Hidden Conditional
bool property allPowerInterlocksDegaussed_I Auto Hidden Conditional
bool property allPowerInterlocksDegaussed_II Auto Hidden Conditional
bool property frequencyCalibrationStarted_I Auto Hidden Conditional
bool property frequencyCalibrationStarted_II Auto Hidden Conditional
bool property PrimaryCalibrationEngaged_I Auto Hidden Conditional
bool property PrimaryCalibrationEngaged_II Auto Hidden Conditional

;Local Variables - Research Lab Event
bool initializedResearchLabEvent
int totalInterlocks
int frequencyOutput_I
int frequencyOutput_II
float frequencyIntake_I
float frequencyIntake_II
GenericSwitchScript[] powerInterlocks_I
GenericSwitchScript[] powerInterlocksRemaining_I
GenericSwitchScript[] powerInterlocksToDegauss_I
GenericSwitchScript[] powerInterlocks_II
GenericSwitchScript[] powerInterlocksRemaining_II
GenericSwitchScript[] powerInterlocksToDegauss_II
GenericSwitchScript emergencyShutdown_I
GenericSwitchScript emergencyShutdown_II
GenericSwitchScript PrimaryCalibration_I
GenericSwitchScript PrimaryCalibration_II
ObjectReference labControlTerminal_I
ObjectReference labControlTerminal_II

;Local Consts - Research Lab Event
int CONST_EnteredResearchLabStage = 700 Const
int CONST_EmergencyShutdownTriggeredStage_I = 721 Const
int CONST_EmergencyShutdownTriggeredStage_II = 722 Const
int CONST_ActivatePrimaryCalibrationStage = 770 Const
int CONST_PlayerSitInBedFurnitureStage_III = 933 Const

int CONST_ShutDownTheProbeObjective = 710 Const
int CONST_DisengagePowerInterlocksObjective = 700 Const

int CONST_Frequency_FrequencyOutputInitial_I = 34 Const
int CONST_Frequency_FrequencyOutputInitial_II = 34 Const
int CONST_Frequency_FrequencyOutputTarget_I = 40 Const
int CONST_Frequency_FrequencyOutputTarget_II = 24 Const
float CONST_FrequencyMultiplier = 0.25 Const
int CONST_MinInterlocksToDegauss = 2 Const
int CONST_MaxInterlocksToDegauss = 4 Const

int CONST_HalfInterlocksShutDownCount = 4 Const
int CONST_HalfInterlocksShutDown_I_Stage = 711 Const
int CONST_AllInterlocksShutDown_I_Stage = 712 Const



;-------------------------------------
;Initialization & Startup
;-------------------------

Event OnQuestInit()
	;Set up local variables.
	player = Game.GetPlayer()
	selfAsShiftingQuest = (Self as Quest) as MQ207CShiftingQuestScript
	NishinaExt_IntercomRef = NishinaExt_Intercom.GetRef()
	NishinaExt_ExteriorDoor_I_Ref = NishinaExt_ExteriorDoor_I.GetRef()

	;Reset actors.
	Alias_EthanHughes.TryToReset()
	Alias_MariaHughes.TryToReset()
	Alias_DirectorPatel.TryToReset()
	Alias_RafaelAguerro.TryToReset()
	Nishina01_CreaturesAll_II.ResetAll()
	Nishina02_CreaturesAll_II.ResetAll()
	Nishina02_RobotsAndTurrets_All_I.ResetAll()
	Nishina02_SecurityCameras_I.ResetAll()
	Nishina02_SecurityCameras_II.ResetAll()

	;Register for events from the Artifact activators, and block activation on them.
	artifactActivator_I = Nishina02_ArtifactActivator_I.GetRef()
	artifactActivator_I.BlockActivation(True, True)
	RegisterForRemoteEvent(artifactActivator_I, "OnActivate")
	artifactActivator_II = Nishina02_ArtifactActivator_II.GetRef()
	artifactActivator_II.BlockActivation(True, True)
	RegisterForRemoteEvent(artifactActivator_II, "OnActivate")

	;Set up Security Cameras.
	SetRefColCameraState(Nishina02_SecurityCameras_II, False, True)

	;Set up the Research Lab event.
	;This is normally done OnCellLoad, but we may need to do it now if the quest is being started via quickstart.
	ObjectReference powerInterlockChainHead = Nishina02_PowerInterlockChainHead_I.GetRef()
	if (powerInterlockChainHead.Is3DLoaded())
		InitResearchLabEvent()
	Else
		RegisterForRemoteEvent(powerInterlockChainHead, "OnCellLoad")
	EndIf

	;We've finished this part of our initialization.
	hasCompletedOnQuestInit = True
EndEvent

Function StartupStageDone()
	hasCompletedStartupStage = True
EndFunction


;The quickstarts call this function to block until OnQuestInit and the Startup stage have both finished.
Function WaitForStartup()
	While (!hasCompletedOnQuestInit || !hasCompletedStartupStage)
		Utility.Wait(0.1)
	EndWhile
EndFunction

;Give the player the quickstart perks for dialogue testing.
Function AddQuickstartPerks()
	int i = 0
	While (i < QuickstartPerks.Length)
		player.AddPerk(QuickstartPerks[i])
		i = i + 1
	EndWhile
EndFunction

;Force the player to the quickstart level for combat testing.
Function SetQuickstartLevel()
	int currentLevel = Game.GetPlayerLevel()
	float currentXP = Game.GetXPForLevel(currentLevel)
	float targetXP = Game.GetXPForLevel(CONST_QuickstartLevel)
	player.SetValue(Experience, targetXP - currentXP)
	MQ207C_QuickstartLevelForceMessage.Show()
EndFunction


;-------------------------------------
;Exterior
;---------

;When the player is allowed into the station, unlock the door and block further activation of the intercom.
Function UnlockExteriorDoor()
	NishinaExt_IntercomRef.BlockActivation(True, True)
	WwiseEvent_DRSRemoteUnlock.Play(NishinaExt_ExteriorDoor_I_Ref)
	RegisterForRemoteEvent(NishinaExt_ExteriorDoor_I_Ref, "OnActivate")
	NishinaExt_ExteriorDoor_I_Ref.Unlock()
EndFunction

;When the player activates the exterior door, send all of their followers back to the landing pad to wait.
Function BlockFollowersAtExteriorDoor()
	SQ_Followers.AllFollowersWait(NishinaExt_LandingPadWaitMarker.GetRef())
EndFunction


;-------------------------------------
;Storage Corridor Event
;-----------------------
;
;In this event, after the first creature is killed, we register for any attack event from the player, or any hit event on the surviving creatures, to trigger a shift.
;(The quest script has an additional fallback; killing all of the creatures will also trigger the shift.)

Function RegisterForAttackEvents()
	int i = 0
	While (i < AttackAnimEventNames.Length)
		RegisterForAnimationEvent(player, AttackAnimEventNames[i])
		i = i + 1
	EndWhile
	i = 0
	While (i < Nishina01_StorageCorridorCreatures_II.GetCount())
		RegisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(i), player)
		i = i + 1
	EndWhile
EndFunction

Function UnregisterForAttackEvents()
	int i = 0
	While (i < AttackAnimEventNames.Length)
		UnregisterForAnimationEvent(player, AttackAnimEventNames[i])
		i = i + 1
	EndWhile
	i = 0
	While (i < Nishina01_StorageCorridorCreatures_II.GetCount())
		UnregisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(i))
		i = i + 1
	EndWhile
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String eventName)
	if (AttackAnimEventNames.Find(eventName) >= 0)
		SetStage(CONST_StorageCorridorShiftBackStageToSet)
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	SetStage(CONST_StorageCorridorShiftBackStageToSet)
EndEvent



;-------------------------------------
;Guidance Trigger System
;------------------------

Function UpdateGuidanceTriggerAV()
	if (GetStageDone(CONST_ReachedSecurityOfficeStage) && !GetStageDone(CONST_SpeakToMariaStage))
		ObjectReference[] guidanceTriggerRefs = Nishina01_GuidanceTriggers_II.GetArray()
		int i = 0
		While (i < guidanceTriggerRefs.Length)
			if (guidanceTriggerRefs[i].IsInTrigger(player))
				Debug.Trace("In Guidance Trigger: TRUE")
				player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 1)
				return
			EndIf
			i = i + 1
		EndWhile
		player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 0)
		Debug.Trace("In Guidance Trigger: FALSE")
	EndIf
EndFunction


;-------------------------------------
;Fabrication Lab Event
;--------------------------

;Disable player controls during the Fabrication Lab experiment, and the Nishina III ending.
Function DisableControls(bool shouldDisableCamSwitch=False)
	if (MQ207CInputEnableLayer == None)
		MQ207CInputEnableLayer = InputEnableLayer.Create()
	EndIf
	MQ207CInputEnableLayer.DisablePlayerControls(abMovement=True, abFighting=True, abActivate=True, abCamSwitch=shouldDisableCamSwitch)
EndFunction

;Re-enable them afterwards.
Function EnableControls()
	if (MQ207CInputEnableLayer != None)
		MQ207CInputEnableLayer.Reset()
		MQ207CInputEnableLayer.Delete()
		MQ207CInputEnableLayer = None
	EndIf	
EndFunction


;-------------------------------------
;Research Lab Event
;-----------------------
;
;See the quest walkthrough for an explanation of how this event works.
;
;Essentially, the player can either:
; 1. Disable all of the Power Interlocks in Nishina-I, then pull the Emergency Shutdown switch in Nishina-I, then take the Artifact in Nishina-I.
;    - Or, do those things in Nishina-II, which has its own copy of the same activity.
;    - Or, switch back and forth between universes, in which case I need to update the objectives to reflect the state of the event wherever you are.
; 2. Complete a seperate puzzle in which you have to Enable all of the Power Interlocks, then toggle ('degauss') specific ones, then set some settings on a terminal.

Event ObjectReference.OnCellLoad(ObjectReference akSource)
	if (!initializedResearchLabEvent)
		InitResearchLabEvent()
	EndIf
	if (GetStageDone(CONST_EnteredResearchLabStage) && (GetStage() < CONST_TookTheArtifactStage_I))
		StartMusicOverride()
	EndIf
EndEvent

;Initialize everything in the Research Lab.
Function InitResearchLabEvent()
	if (!initializedResearchLabEvent)
		initializedResearchLabEvent = True

		;Set up the Power Interlocks.
		;The Power Interlock switches are numbered and set up in a force persist linkedref chain to order them.
		GenericSwitchScript powerInterlockChainHead_I = Nishina02_PowerInterlockChainHead_I.GetRef() as GenericSwitchScript
		powerInterlocks_I = powerInterlockChainHead_I.GetLinkedRefChain() as GenericSwitchScript[]
		powerInterlocks_I.Insert(powerInterlockChainHead_I, 0)
		powerInterlocksRemaining_I = CopySwitchArray(powerInterlocks_I)
		Nishina02_PowerInterlocks_I.AddArray(powerInterlocks_I as ObjectReference[])
		GenericSwitchScript powerInterlockChainHead_II = Nishina02_PowerInterlockChainHead_II.GetRef() as GenericSwitchScript
		powerInterlocks_II = powerInterlockChainHead_II.GetLinkedRefChain() as GenericSwitchScript[]
		powerInterlocks_II.Insert(powerInterlockChainHead_II, 0)
		powerInterlocksRemaining_II = CopySwitchArray(powerInterlocks_II)
		Nishina02_PowerInterlocks_II.AddArray(powerInterlocks_II as ObjectReference[])

		if (powerInterlocks_I.Length != powerInterlocks_II.Length)
			Debug.Trace("ERROR: Power Interlock chains are of different lengths!", 2)
		EndIf
		totalInterlocks = powerInterlocks_I.Length
		MQ207CTotalInterlockCountGlobal.SetValue(totalInterlocks)
		UpdateCurrentInstanceGlobal(MQ207CTotalInterlockCountGlobal)

		int i = 0
		While (i < powerInterlocks_I.Length)
			RegisterForRemoteEvent(powerInterlocks_I[i], "OnActivate")
			powerInterlocks_I[i].SetColor("Green")
			powerInterlocks_I[i].SetValue(MQ207C_PowerInterlockIDValue, i+1)
			i = i + 1
		EndWhile
		i = 0
		While (i < powerInterlocks_II.Length)
			RegisterForRemoteEvent(powerInterlocks_II[i], "OnActivate")
			powerInterlocks_II[i].SetColor("Green")
			powerInterlocks_II[i].SetValue(MQ207C_PowerInterlockIDValue, i+1)
			i = i + 1
		EndWhile

		;All Power Interlocks begin engaged.
		allPowerInterlocksEngaged_I = True
		allPowerInterlocksEngaged_II = True

		;Randomly select several interlocks that need to be 'Degaussed' (toggled).
		Private_EngaussPowerInterlocks(1)
		Private_EngaussPowerInterlocks(2)

		;Set up the frequency puzzle on the terminal.
		frequencyOutput_I = CONST_Frequency_FrequencyOutputInitial_I
		frequencyOutput_II = CONST_Frequency_FrequencyOutputInitial_II
		Private_UpdateFrequencyIntakes()

		;Set up the terminals.
		labControlTerminal_I = Nishina02_LabControlTerminal_I.GetRef()
		labControlTerminal_I.SetValue(MQ207C_LabControlTerminalUniverseValue, 1)
		labControlTerminal_II = Nishina02_LabControlTerminal_II.GetRef()
		labControlTerminal_II.SetValue(MQ207C_LabControlTerminalUniverseValue, 2)

		;Update terminal text replacement data.
		Private_UpdateTerminalData(1)
		Private_UpdateTerminalData(2)

		;Set up the Emergency Shutdown switches.
		emergencyShutdown_I = Nishina02_EmergencyShutdown_I.GetRef() as GenericSwitchScript
		emergencyShutdown_I.BlockActivation(True, False)
		RegisterForRemoteEvent(emergencyShutdown_I, "OnActivate")
		emergencyShutdown_II = Nishina02_EmergencyShutdown_II.GetRef() as GenericSwitchScript
		emergencyShutdown_II.BlockActivation(True, False)
		RegisterForRemoteEvent(emergencyShutdown_II, "OnActivate")

		;Set up the Primary Calibration switches.
		PrimaryCalibration_I = Nishina02_PrimaryCalibration_I.GetRef() as GenericSwitchScript
		RegisterForRemoteEvent(PrimaryCalibration_I, "OnActivate")
		PrimaryCalibration_II = Nishina02_PrimaryCalibration_II.GetRef() as GenericSwitchScript
		RegisterForRemoteEvent(PrimaryCalibration_II, "OnActivate")

		;Set up the Artifact Experiment beams.
		UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "OnFlicker")
		UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "OnFlickerFast")
	EndIf
EndFunction


;Called by the ObjectReference.OnActivate event (below), handle activation for any element in the Research Lab puzzle.
Function ProcessResearchLabActivation(GenericSwitchScript akSource, ObjectReference akActivator)
	if (akSource == emergencyShutdown_I)
		if (GetStageDone(CONST_EmergencyShutdownTriggeredStage_I))
			MQ207C_EmergencyShutdownAlreadyUsedMessage.Show()
		ElseIf (powerInterlocksRemaining_I.Length > 0)
			MQ207C_EmergencyShutdownNotReadyMessage.Show()
		Else
			if (MQ207C_ShutdownWarningMessage.Show() == 0)
				emergencyShutdown_I.PlayAnimation("Play01")
				ShutdownExperiment(False)
				SetStage(CONST_EmergencyShutdownTriggeredStage_I)
			EndIf
		EndIf
	ElseIf (akSource == emergencyShutdown_II)
		if (GetStageDone(CONST_EmergencyShutdownTriggeredStage_II))
			MQ207C_EmergencyShutdownAlreadyUsedMessage.Show()
		ElseIf (powerInterlocksRemaining_II.Length > 0)
			MQ207C_EmergencyShutdownNotReadyMessage.Show()
		Else
			if (MQ207C_ShutdownWarningMessage.Show() == 0)
				emergencyShutdown_II.PlayAnimation("Play01")
				ShutdownExperiment(False)
				SetStage(CONST_EmergencyShutdownTriggeredStage_II)
			EndIf
		EndIf

	ElseIf (akSource == PrimaryCalibration_I)
		if (PrimaryCalibrationEngaged_I)
			MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show()
		ElseIf (!frequencyStable)
			MQ207C_PrimaryCalibrationNotReadyMessage.Show()
		Else
			PrimaryCalibration_I.SetColor("White")
			PrimaryCalibration_I.SetState("On")
			PrimaryCalibrationEngaged_I = True
			if (PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II)
				DisableControls()
				UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
				UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
				QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
				QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait()
				QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
				QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait()
				SetStage(CONST_WaitForTheExperimentStage_III)
			EndIf
		EndIf
	ElseIf (akSource == PrimaryCalibration_II)
		if (PrimaryCalibrationEngaged_II)
			MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show()
		ElseIf (!frequencyStable)
			MQ207C_PrimaryCalibrationNotReadyMessage.Show()
		Else
			PrimaryCalibrationEngaged_II = True
			PrimaryCalibration_II.SetColor("White")
			PrimaryCalibration_II.SetState("On")
			if (PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II)
				DisableControls()
				UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
				UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
				QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
				QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait()
				QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
				QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait()
				SetStage(CONST_WaitForTheExperimentStage_III)
			EndIf
		EndIf

	ElseIf (powerInterlocks_I.Find(akSource) >= 0)
		if (GetStageDone(CONST_EmergencyShutdownTriggeredStage_I))
			MQ207C_PowerInterlockNotRespondingMessage.Show()
		ElseIf (frequencyStable)
			MQ207C_PowerInterlockNotRespondingMessage.Show()
		Else
			int remainingIndex = powerInterlocksRemaining_I.Find(akSource)
			if (remainingIndex >= 0)
				akSource.SetColor("Red")
				akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage)
				powerInterlocksRemaining_I.Remove(remainingIndex)
				Nishina02_PowerInterlocks_I.RemoveRef(akSource)
				Private_TryToDegaussPowerInterlock(akSource)
				Private_UpdateInterlockAndShutdownObjectives(1)
				if (powerInterlocksRemaining_I.Length == CONST_HalfInterlocksShutDownCount)
					SetStage(CONST_HalfInterlocksShutDown_I_Stage)
				ElseIf (powerInterlocksRemaining_I.Length == 0)
					SetStage(CONST_AllInterlocksShutDown_I_Stage)
				EndIf
			Else
				akSource.SetColor("Green")
				akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage)
				powerInterlocksRemaining_I.Add(akSource)
				Nishina02_PowerInterlocks_I.AddRef(akSource)
				Private_UpdateInterlockAndShutdownObjectives(1)
			EndIf
			Private_UpdatePowerInterlocksState(1)
		EndIf
	ElseIf (powerInterlocks_II.Find(akSource) >= 0)
		if (GetStageDone(CONST_EmergencyShutdownTriggeredStage_II))
			MQ207C_PowerInterlockNotRespondingMessage.Show()
		ElseIf (frequencyStable)
			MQ207C_PowerInterlockNotRespondingMessage.Show()
		Else
			int remainingIndex = powerInterlocksRemaining_II.Find(akSource)
			if (remainingIndex >= 0)
				akSource.SetColor("Red")
				akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage)
				powerInterlocksRemaining_II.Remove(remainingIndex)
				Nishina02_PowerInterlocks_II.RemoveRef(akSource)
				Private_TryToDegaussPowerInterlock(akSource)
				Private_UpdateInterlockAndShutdownObjectives(2)
			Else
				akSource.SetColor("Green")
				akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage)
				powerInterlocksRemaining_II.Add(akSource)
				Nishina02_PowerInterlocks_II.AddRef(akSource)
				Private_UpdateInterlockAndShutdownObjectives(2)
			EndIf
			Private_UpdatePowerInterlocksState(2)
		EndIf
	EndIf
EndFunction


;Called by MQ207CShiftingQuestScript when the player shifts.
;Update objectives and terminal data for the state of the lab in the player's new universe.
Function Private_UpdateLabResearchLabStateOnShift(int universeID)
	if (GetStageDone(CONST_EnteredResearchLabStage))
		Private_UpdateInterlockAndShutdownObjectives(universeID)
		Private_UpdateTerminalData(universeID)
	EndIf
EndFunction

Function Private_UpdateInterlockAndShutdownObjectives(int universeID)
	if (IsObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective) || IsObjectiveDisplayed(CONST_ShutDownTheProbeObjective))
		int currentInterlockCount
		GenericSwitchScript currentEmergencyShutdownSwitch
		if (universeID == 1)
			currentInterlockCount = totalInterlocks - powerInterlocksRemaining_I.Length
			currentEmergencyShutdownSwitch = emergencyShutdown_I
		Else
			currentInterlockCount = totalInterlocks - powerInterlocksRemaining_II.Length
			currentEmergencyShutdownSwitch = emergencyShutdown_II
		EndIf
		MQ207CCurrentInterlockCountGlobal.SetValue(currentInterlockCount)
		UpdateCurrentInstanceGlobal(MQ207CCurrentInterlockCountGlobal)

		if (((universeID == 1) && (powerInterlocksRemaining_I.Length == 0)) || ((universeID == 2) && (powerInterlocksRemaining_II.Length == 0)))
			SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective)
			SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective)
			currentEmergencyShutdownSwitch.SetState("PulseFast")
		Else
			SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective, False)
			SetObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective, True, True)
			SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective, False)
			currentEmergencyShutdownSwitch.SetState("Off")
		EndIf
	EndIf
EndFunction

Function Private_UpdateTerminalData(int universeID)
	GenericSwitchScript[] currentInterlocksToDegauss
	ObjectReference terminalToUpdate
	if (universeID == 1)
		terminalToUpdate = labControlTerminal_I
		labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_I.Length)
		currentInterlocksToDegauss = powerInterlocksToDegauss_I
		terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_I)
		terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_I)
	Else
		terminalToUpdate = labControlTerminal_II
		labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_II.Length)
		currentInterlocksToDegauss = powerInterlocksToDegauss_II
		terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_II)
		terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_II)
	EndIf

	if (currentInterlocksToDegauss.Length > 3)
		terminalToUpdate.AddTextReplacementValue("Degauss4", currentInterlocksToDegauss[3].GetValue(MQ207C_PowerInterlockIDValue))
	Else
		terminalToUpdate.AddTextReplacementValue("Degauss4", 0)
	EndIf
	if (currentInterlocksToDegauss.Length > 2)
		terminalToUpdate.AddTextReplacementValue("Degauss3", currentInterlocksToDegauss[2].GetValue(MQ207C_PowerInterlockIDValue))
	Else
		terminalToUpdate.AddTextReplacementValue("Degauss3", 0)
	EndIf
	if (currentInterlocksToDegauss.Length > 1)
		terminalToUpdate.AddTextReplacementValue("Degauss2", currentInterlocksToDegauss[1].GetValue(MQ207C_PowerInterlockIDValue))
	Else
		terminalToUpdate.AddTextReplacementValue("Degauss2", 0)
	EndIf
	if (currentInterlocksToDegauss.Length > 0)
		terminalToUpdate.AddTextReplacementValue("Degauss1", currentInterlocksToDegauss[0].GetValue(MQ207C_PowerInterlockIDValue))
	Else
		terminalToUpdate.AddTextReplacementValue("Degauss1", 0)
	EndIf
EndFunction

Function UpdateAllPowerInterlocks(String newColor="", String newState="")
	int i = 0
	While (i < powerInterlocks_I.Length)
		powerInterlocks_I[i].SetColor(newColor)
		powerInterlocks_I[i].SetColor(newState)
		i = i + 1
	EndWhile
	i = 0
	While (i < powerInterlocks_II.Length)
		powerInterlocks_II[i].SetColor(newColor)
		powerInterlocks_II[i].SetColor(newState)
		i = i + 1
	EndWhile
EndFunction

Function UpdateAllExperimentBeams(RefCollectionAlias beamCollection, String newState)
	DefaultMultiStateActivator[] beamCollectionRefs = beamCollection.GetArray() as DefaultMultiStateActivator[]
	int i = 0
	While (i < beamCollectionRefs.Length)
		beamCollectionRefs[i].SetAnimationState(newState)
		i = i + 1
	EndWhile
EndFunction

Function UpdateAllExperimentLights(RefCollectionAlias lightCollection, String newState)
	ObjectReference[] lightCollectionRefs = lightCollection.GetArray()
	int i = 0
	While (i < lightCollectionRefs.Length)
		if (newState == "Off")
			lightCollectionRefs[i].DisableNoWait()
		Else
			lightCollectionRefs[i].EnableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function ShutdownExperiment(bool shouldDisableArtifact=True)
	if (shouldDisableArtifact)
		artifactActivator_I.DisableNoWait()
		artifactActivator_II.DisableNoWait()
	EndIf
	UpdateAllPowerInterlocks(newState="Off")
	emergencyShutdown_I.SetState("Off")
	emergencyShutdown_II.SetState("Off")
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Off")
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Off")
	UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, "Off")
	UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, "Off")
	Nishina02_ExperimentBeamHazards.DisableAll()
	QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait()
	QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
	QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait()
	QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait()
	QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait()
	QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait()
	QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait()
	QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait()
EndFunction



;DEGAUSSING PROCESS---------
;On startup, or when frequency calibration fails, a random selection of Power Interlocks need to be 'degaussed' (toggled).

;Select the Power Interlocks that need to be degaussed.
Function Private_EngaussPowerInterlocks(int universe)
	if (universe == 1)
		powerInterlocksToDegauss_I = CommonArrayFunctions.SortRefsByValue(SelectRandomSwitch(powerInterlocks_I, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as GenericSwitchScript[]
	Else
		powerInterlocksToDegauss_II = CommonArrayFunctions.SortRefsByValue(SelectRandomSwitch(powerInterlocks_II, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as GenericSwitchScript[]
	EndIf
EndFunction

;Set by the terminal to enable degaussing.
Function TryToStartDegaussing(int universe)
	if ((universe == 1) && allPowerInterlocksEngaged_I)
		degaussingStarted_I = True
		labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1)
	ElseIf ((universe == 2) && allPowerInterlocksEngaged_II)
		degaussingStarted_II = True
		labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1)
	EndIf
EndFunction

;If degaussing is enabled, and the player toggles a Power Interlock that needed it, remove it from the list.
Function Private_TryToDegaussPowerInterlock(GenericSwitchScript powerInterlock)
	int index1 = powerInterlocksToDegauss_I.Find(powerInterlock)
	if ((index1 >= 0) && degaussingStarted_I)
		powerInterlocksToDegauss_I.Remove(index1)
		Private_UpdateTerminalData(1)
	Else
		int index2 = powerInterlocksToDegauss_II.Find(powerInterlock)
		if ((index2 >= 0) && degaussingStarted_II)
			powerInterlocksToDegauss_II.Remove(index2)
			Private_UpdateTerminalData(2)
		EndIf
	EndIf
EndFunction

;When a Power Interlock is toggled, update the state of the entire system.
Function Private_UpdatePowerInterlocksState(int universe)
	if (universe == 1)
		allPowerInterlocksEngaged_I = powerInterlocksRemaining_I.Length == powerInterlocks_I.Length
		allPowerInterlocksDegaussed_I = powerInterlocksToDegauss_I.Length == 0
		if (frequencyCalibrationStarted_I)
			Private_FailFrequencyCalibration(1)
		EndIf
	Else
		allPowerInterlocksEngaged_II = powerInterlocksRemaining_II.Length == powerInterlocks_II.Length
		allPowerInterlocksDegaussed_II = powerInterlocksToDegauss_II.Length == 0
		if (frequencyCalibrationStarted_II)
			Private_FailFrequencyCalibration(2)
		EndIf
	EndIf
EndFunction


;FREQUENCY CALIBRATION PROCESS---------
;After degaussing, the player has to select a frequency setting on the Lab Control Terminal.
;Changing the output value in one universe changes the input value in both, so you need to find the pattern.

;Attempt to start the Frequency Calibration step.
Function TryToStartFrequencyCalibration(int universe)
	if (universe == 1)
		if (allPowerInterlocksEngaged_I && allPowerInterlocksDegaussed_I)
			frequencyCalibrationStarted_I = True
			labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1)
		Else
			Private_FailFrequencyCalibration(1)
		EndIf
	Else
		if (allPowerInterlocksEngaged_II && allPowerInterlocksDegaussed_II)
			frequencyCalibrationStarted_II = True
			labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1)
		Else
			Private_FailFrequencyCalibration(2)
		EndIf
	EndIf
EndFunction

;Set the output in one universe to a particular value.
Function SetFrequencyOutput(int universe, int output)
	if (universe == 1)
		frequencyOutput_I = output
	Else
		frequencyOutput_II = output
	EndIf
	Private_UpdateFrequencyIntakes()
	Private_UpdateTerminalData(universe)
EndFunction

;Calculate the intake frequency based on the output frequencies from both universes.
Function Private_UpdateFrequencyIntakes()
	frequencyIntake_I = frequencyOutput_I - (frequencyOutput_II * CONST_FrequencyMultiplier)
	frequencyIntake_II = frequencyOutput_II + (frequencyOutput_I * CONST_FrequencyMultiplier)
	if ((frequencyOutput_I == CONST_Frequency_FrequencyOutputTarget_I) && (frequencyOutput_II == CONST_Frequency_FrequencyOutputTarget_II))
		frequencyStable = True
		UpdateAllPowerInterlocks(newColor="White")
		PrimaryCalibration_I.SetState("Pulse")
		PrimaryCalibration_II.SetState("Pulse")
		UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
		UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
		QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait()
		QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait()
		QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait()
		QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait()
		SetStage(CONST_ActivatePrimaryCalibrationStage)
	Else
		frequencyStable = False
	EndIf
EndFunction

;Toggling any Power Interlock during Frequency Calibration resets the entire puzzle. Don't do that.
Function Private_FailFrequencyCalibration(int universe)
	if (universe == 1)
		degaussingStarted_I = False
		frequencyCalibrationStarted_I = False
		labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0)
		labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0)
		Private_EngaussPowerInterlocks(1)
		Private_UpdateTerminalData(1)
	ElseIf (universe == 2)
		degaussingStarted_II = False
		frequencyCalibrationStarted_II = False
		labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0)
		labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0)
		Private_EngaussPowerInterlocks(2)
		Private_UpdateTerminalData(2)
	EndIf
EndFunction


;-------------------------------------
;Special Ending Sequence
;------------------------

Function PlaySpecialEndingShifting()
	Utility.Wait(2)
	selfAsShiftingQuest.Shift()
	Utility.Wait(1)
	selfAsShiftingQuest.Shift()
	Utility.Wait(0.5)
	selfAsShiftingQuest.Shift()
	Utility.Wait(0.3)
	selfAsShiftingQuest.Shift()
	Utility.Wait(0.1)
	selfAsShiftingQuest.Shift()
	Utility.Wait(0.1)
	selfAsShiftingQuest.Shift()
	if (!player.IsDead())
		SetStage(CONST_GiveTheArtifactStage_III)
	EndIf
EndFunction


;-------------------------------------
;Artifact Handling
;-----------------------

Function UnblockArtifactActivator_I()
	Nishina02_ArtifactBeckonSFX_I.EnableAll()
	artifactActivator_I.BlockActivation(False, False)
EndFunction

Function UnblockArtifactActivator_II()
	Nishina02_ArtifactBeckonSFX_II.EnableAll()
	artifactActivator_II.BlockActivation(False, False)
EndFunction

Function ProcessArtifactActivatorActivation(ObjectReference akSource, ObjectReference akActivator)
	if ((akSource == artifactActivator_I) && (GetStageDone(CONST_TakeTheArtifactStage_I)))
		Nishina02_ArtifactBeckonSFX_I.DisableAll()
		SetStage(CONST_TookTheArtifactStage_I)
		GiveArtifact()
	ElseIf ((akSource == artifactActivator_II) && (GetStageDone(CONST_TakeTheArtifactStage_II)))
		Nishina02_ArtifactBeckonSFX_II.DisableAll()
		SetStage(CONST_TookTheArtifactStage_II)
		GiveArtifact()
	EndIf
EndFunction

Function GiveArtifact()
	;Disable the Artifact Activators.
	artifactActivator_I.DisableNoWait()
	artifactActivator_II.DisableNoWait()

	;Spawn the artifact, force it into MQ207B's alias for it, and give it to the player.
	ObjectReference artifactRef = StarbornTempleQuest.PlaceArtifact(CONST_MQ207CArtifactID, AnnouncementMarker.GetRef())
	MQ207B_Artifact02QuestObject.ForceRefTo(artifactRef)
	player.AddItem(artifactRef)

	;Let StarbornTempleQuest know the player has acquired it.
	StarbornTempleQuest.SetPlayerAcquiredArtifact(CONST_MQ207CArtifactID)
EndFunction


;-------------------------------------
;Activation Event Handling
;-----------------------

Auto State WaitingForEvent
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		GoToState("ProcessingEvent")
		if (akSource == NishinaExt_ExteriorDoor_I_Ref)
			BlockFollowersAtExteriorDoor()
		ElseIf ((akSource == artifactActivator_I) || (akSource == artifactActivator_II))
			ProcessArtifactActivatorActivation(akSource, akActivator)
		Else
			ProcessResearchLabActivation(akSource as GenericSwitchScript, akActivator)
		EndIf
		GoToState("WaitingForEvent")
	EndEvent
EndState

State ProcessingEvent
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	;Do nothing.
EndEvent


;-------------------------------------
;Nishina01 'Security Door' System
;---------------------------------
;
;Note that Nishina01 uses standard doors, not true security doors, so Ethan can open them directly.

;Sets the state of all of the doors in a ref collection.
Function SetRefColSecurityDoorStateNoWait(RefCollectionAlias securityDoorRefCol, bool shouldSeal, bool shouldOpenDoor=True)
	Var[] akArgs = new Var[3]
	akArgs[0] = securityDoorRefCol
	akArgs[1] = shouldSeal
	akArgs[2] = shouldOpenDoor
	CallFunctionNoWait("SetRefColSecurityDoorState", akArgs)
EndFunction

Function SetRefColSecurityDoorState(RefCollectionAlias securityDoorRefCol, bool shouldSeal, bool shouldOpenDoor=True)
	ObjectReference[] doors = securityDoorRefCol.GetArray()
	int i = 0
	While (i < doors.Length)
		if (shouldSeal)
			SealSecurityDoor(doors[i])		
		Else
			UnsealSecurityDoor(doors[i], shouldOpenDoor)
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Close and lock a security door.
Function SealSecurityDoorNoWait(ObjectReference securityDoor)
	Var[] akArgs = new Var[1]
	akArgs[0] = securityDoor
	CallFunctionNoWait("SealSecurityDoor", akArgs)
EndFunction

Function SealSecurityDoor(ObjectReference securityDoor)
	;Debug.Trace("MQ207C Sealing " + securityDoor)
	if (securityDoor != None)
		int openState = securityDoor.GetOpenState()
		While ((openState == 2) || (openState == 4))
			Utility.Wait(0.1)
			openState = securityDoor.GetOpenState()
		EndWhile
		securityDoor.SetOpen(False)
		if (securityDoor.GetLockLevel() > 0)
			securityDoor.Lock()
		EndIf
	EndIf
EndFunction

;Unlock and optionally open a security door.
Function UnsealSecurityDoorNoWait(ObjectReference securityDoor, bool shouldOpenDoor=True)
	Var[] akArgs = new Var[2]
	akArgs[0] = securityDoor
	akArgs[1] = shouldOpenDoor
	CallFunctionNoWait("UnsealSecurityDoor", akArgs)
EndFunction

Function UnsealSecurityDoor(ObjectReference securityDoor, bool shouldOpenDoor=True)
	;Debug.Trace("MQ207C Unsealing " + securityDoor)
	if (securityDoor != None)
		int openState = securityDoor.GetOpenState()
		While ((openState == 2) || (openState == 4))
			Utility.Wait(0.1)
			openState = securityDoor.GetOpenState()
		EndWhile
		if (securityDoor.Is3DLoaded())
			WwiseEvent_DRSRemoteUnlock.Play(securityDoor)
		EndIf
		securityDoor.Unlock()
		if (shouldOpenDoor)
			securityDoor.SetOpen(True)
		EndIf
	EndIf
EndFunction

;Set the faction owner for a security door so an escorting NPC can unlock it.
Function AllowSecurityDoorUnlock(ObjectReference securityDoor, bool shouldAllow=True)
	if (shouldAllow)
		securityDoor.SetFactionOwner(MQ207CNishinaEscortFaction)
	Else
		securityDoor.SetFactionOwner(None)
	EndIf
EndFunction

;Play the Lockdown Ended SFX.
Function PlayLockdownEndedSFXNoWait()
	CallFunctionNoWait("PlayLockdownEndedSFX", None)
EndFunction

Function PlayLockdownEndedSFX()
	Utility.Wait(0.1)
	OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF.Play(player)
EndFunction


;-------------------------------------
;Nishina Security Camera System
;-------------------------------

Function SetRefColCameraState(RefCollectionAlias cameraCol, bool shouldBeEssentialAndIFH, bool shouldBeDead)
	Actor[] cameras = cameraCol.GetArray() as Actor[]
	int i = 0
	While (i < cameras.Length)
		if (cameras[i] != None)
			if (shouldBeDead)
				cameras[i].Kill()
			ElseIf (shouldBeEssentialAndIFH)
				cameras[i].IgnoreFriendlyHits(True)
				cameras[i].SetEssential(True)
				cameras[i].RemoveFromFaction(MQ207CNishinaIEnemyFaction)
				cameras[i].AddToFaction(MQ207CNishinaIFaction)
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction


;-------------------------------------
;Artifact Room Music Override
;-----------------------------

Function StartMusicOverride()
	StartTimer(0, CONST_MusicOverrideUpdateTimerID)
EndFunction

Function StopMusicOverride()
	CancelTimer(CONST_MusicOverrideUpdateTimerID)
	MUSGenesisCombat_MQ207C_Nishina.Remove()
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_MusicOverrideUpdateTimerID)
		if (GetStage() < CONST_AllEndingsCommonStage)
			bool isInArtifactRoom = Nishina02_ArtifactRoomMusicTrigger_I.GetRef().IsInTrigger(Game.GetPlayer()) || Nishina02_ArtifactRoomMusicTrigger_II.GetRef().IsInTrigger(Game.GetPlayer())
			if (isInArtifactRoom && !musicOverrideActive)
				musicOverrideActive = True
				MUSGenesisCombat_MQ207C_Nishina.Add()
			ElseIf (!isInArtifactRoom && musicOverrideActive)
				musicOverrideActive = False
				MUSGenesisCombat_MQ207C_Nishina.Remove()
			EndIf
			if (Nishina02_ArtifactRoomMusicTrigger_I.GetRef().Is3DLoaded())
				StartTimer(CONST_MusicOverrideUpdateTimerDelay, CONST_MusicOverrideUpdateTimerID)
			EndIf
		Else
			MUSGenesisCombat_MQ207C_Nishina.Remove()
		EndIf
	EndIf
EndEvent



;-------------------------------------
;Enemy Handling
;-----------------------

;Trigger one of the ambush wave encounters in the High Energy Research Lab.
Function TriggerResearchLabAmbushWave(int universeID, int waveID)
	if (universeID == 1)
		if (waveID == 2)
			(Nishina02_ArtifactRoomWave2Activator_I.GetRef() as DNLocalAlarmScript).TriggerAlarm()
		ElseIf (waveID == 3)
			(Nishina02_ArtifactRoomWave3Activator_I.GetRef() as DNLocalAlarmScript).TriggerAlarm()
		EndIf
	ElseIf (universeID == 2)
		if (waveID == 2)
			Nishina02_ArtifactRoomWave2Activator_II.GetRef().SetValue(AmbushTriggered, 1)
		ElseIf (waveID == 3)
			Nishina02_ArtifactRoomWave3Activator_II.GetRef().SetValue(AmbushTriggered, 1)
		EndIf
	EndIf
EndFunction

;Clean up all of the creatures in Nishina01-II
Function CleanupNishina01Creatures()
	Actor[] creatures = Nishina01_CreaturesAll_II.GetArray() as Actor[]
	int i = 0
	While (i < creatures.Length)
		if ((creatures[i] != None) && (!creatures[i].IsDead()))
			creatures[i].DisableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Lock all of the terminals in Nishina02-I, so the player can't reactivate robots or turrets post-quest.
Function SetNishina02TerminalsLockedNoWait()
	CallFunctionNoWait("SetNishina02TerminalsLocked", None)
EndFunction

Function SetNishina02TerminalsLocked()
	ObjectReference[] terminals = Nishina02_TerminalsAll.GetArray()
	int i = 0
	While (i < terminals.Length)
		terminals[i].Lock()
		terminals[i].SetLockLevel(CONST_LockLevel_RequiresKey)
		i = i + 1
	EndWhile
EndFunction


;Disable the SFX for all of the alarms in Nishina02-I.
Function SilenceNishina02AlarmsNoWait()
	CallFunctionNoWait("SilenceNishina02Alarms", None)
EndFunction

Function SilenceNishina02Alarms()
	DNLocalAlarmScript[] alarms = Nishina02_Alarms_All_I.GetArray() as DNLocalAlarmScript[]
	int i = 0
	While (i < alarms.Length)
		if (alarms[i] != None)
			alarms[i].StopAlarmSFX()
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Set all of the robots and turrets in Nishina02-I unconscious.
Function SetNishina02RobotsAndTurretsUnconsciousNoWait()
	CallFunctionNoWait("SetNishina02RobotsAndTurretsUnconscious", None)
EndFunction

Function SetNishina02RobotsAndTurretsUnconscious()
	Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[]
	int i = 0
	While (i < robotsAndTurrets.Length)
		if ((robotsAndTurrets[i] != None) && (!robotsAndTurrets[i].IsDead()))
			robotsAndTurrets[i].SetUnconscious(True)
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Clean up all of the robots and turrets in Nishina02-I.
Function CleanupNishina02RobotsAndTurretsNoWait()
	CallFunctionNoWait("CleanupNishina02RobotsAndTurrets", None)
EndFunction

Function CleanupNishina02RobotsAndTurrets()
	Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[]
	int i = 0
	While (i < robotsAndTurrets.Length)
		Actor current = robotsAndTurrets[i] as Actor
		if ((current != None) && (!current.IsDead()))
			if (Nishina02_RobotsToDisablePostquest_I.Find(current) >= 0)
				current.DisableNoWait()
			Else
				current.SetUnconscious(True)
				current.MoveToMyEditorLocation()
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction


;-------------------------------------
;Fixup
;---------

Function ResetArtifactPositions()
	if ((artifactActivator_I != None) && (artifactActivator_II != None) && \
	    !GetStageDone(CONST_TookTheArtifactStage_I) && !GetStageDone(CONST_TookTheArtifactStage_II) && !GetStageDone(CONST_GiveTheArtifactStage_III))
		artifactActivator_I.MoveToMyEditorLocation()
		artifactActivator_II.MoveToMyEditorLocation()
	EndIf
EndFunction


;-------------------------------------
;Shutdown
;---------

;Clear all of our local variables on shutdown.
Function ClearVariables()
	NishinaExt_IntercomRef = None
	NishinaExt_ExteriorDoor_I_Ref = None
	artifactActivator_I = None
	artifactActivator_II = None

	powerInterlocks_I = None
	powerInterlocksRemaining_I = None
	powerInterlocksToDegauss_I = None
	powerInterlocks_II = None
	powerInterlocksRemaining_II = None
	powerInterlocksToDegauss_II = None
	emergencyShutdown_I = None
	emergencyShutdown_II = None
	PrimaryCalibration_I = None
	PrimaryCalibration_II = None
	labControlTerminal_I = None
	labControlTerminal_II = None

	selfAsShiftingQuest.ClearVariables()
EndFunction


;-------------------------------------
;Utility Functions
;------------------

;Given an array, return a copy of it.
GenericSwitchScript[] Function CopySwitchArray(GenericSwitchScript[] input)
    GenericSwitchScript[] output = new GenericSwitchScript[input.Length]
    int i = 0
    While (i < input.Length)
        output[i] = input[i]
        i = i + 1
    EndWhile
    return output
EndFunction

;Given an array, return a copy of it with its contents randomized.
GenericSwitchScript[] Function CopyAndRandomizeSwitchArray(GenericSwitchScript[] input)
    GenericSwitchScript[] output = CopySwitchArray(input)
    float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0, 1)
    int i = output.Length - 1
    While (i >= 0)
        int currentRandomIndex = (random[i] * i) as int
        GenericSwitchScript temp = output[i]
        output[i] = output[currentRandomIndex]
        output[currentRandomIndex] = temp
        i = i - 1
    EndWhile
    return output
EndFunction

;Select random elements from an array.
GenericSwitchScript[] Function SelectRandomSwitch(GenericSwitchScript[] input, int numToSelect)
    GenericSwitchScript[] randomizedInput = CopyAndRandomizeSwitchArray(input)
    GenericSwitchScript[] output = new GenericSwitchScript[numToSelect]
    int i = 0
    While (i < numToSelect)
        output[i] = randomizedInput[i]
        i = i + 1
    EndWhile
    return output
EndFunction



;Open all of the doors in LC116Nishina01 for testing.
Function DebugOpenDoors()
	SetStage(30)
	SetStage(40)
	SetStage(580)
EndFunction

Function DEBUG_ForceFrequencyCalibration()
	frequencyCalibrationStarted_I = True
	labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1)
	frequencyCalibrationStarted_II = True
	labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1)
EndFunction

Function DEBUG_UpdateAllExperimentBeams(String newState)
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, newState)
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, newState)
EndFunction

Function DEBUG_UpdateAllExperimentLights(String newState)
	UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, newState)
	UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, newState)
EndFunction

Function DEBUG_Shutdown01()
	emergencyShutdown_I.PlayAnimation("Play01")
	ShutdownExperiment(False)
	SetStage(CONST_EmergencyShutdownTriggeredStage_I)
EndFunction

Function DEBUG_Shutdown02()
	emergencyShutdown_II.PlayAnimation("Play01")
	ShutdownExperiment(False)
	SetStage(CONST_EmergencyShutdownTriggeredStage_II)
EndFunction

Function DEBUG_Stabilize()
	frequencyStable = True
	UpdateAllPowerInterlocks(newColor="White")
	PrimaryCalibration_I.SetState("Pulse")
	PrimaryCalibration_II.SetState("Pulse")
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
	QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait()
	QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait()
	SetStage(CONST_ActivatePrimaryCalibrationStage)
EndFunction

Function DEBUG_Running()
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
	UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
	QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait()
	QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait()
	QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait()
	SetStage(CONST_WaitForTheExperimentStage_III)
EndFunction