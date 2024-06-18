Scriptname LC165ShiftingQuestScript extends Quest
{One of the quest scripts for LC165, Buried Temple. Handles the memory space shifting for the quest.}
;
;In this quest, an Artifact is causing the player to shift back and forth between the main dungeon and alternate-reality 'memory spaces'.

Struct ShiftDatum
	String Name
	{Required. A name for this shift destination.}
	ObjectReference PlayerMoveTarget
	{Required. Marker to move the player to.}
	ObjectReference CompanionMoveTarget
	{Optional. Marker to move the Companion to. If none, Companion will be moved to the fallback point.}
	ObjectReference AllyMoveTarget
	{Optional. Marker to move the Ally to. If none, Ally will be moved to the fallback point.}
	ObjectReference AdversaryMoveTargets
	{Optional. The first marker in a chain of markers to move the StarbornAdversary_Duplicates to. If none, StarbornAdversary_Duplicates will not be moved.}
	ReferenceAlias EnableParent
	{Optional. Enable parent of the geometry for this area.}
	RefCollectionAlias RefsToDisableOnShiftTo
	{Optional. RefCollection of refs to disable when we shift to this location.}
	RefCollectionAlias RefsToEnableOnShiftTo
	{Optional. RefCollection of refs to enable and move to package locations when we shift to this location.}
	RefCollectionAlias RefsToDisableOnShiftAway
	{Optional. RefCollection of refs to disable when we shift away from this location.}
	RefCollectionAlias RefsToEnableOnShiftAway
	{Optional. RefCollection of refs to enable and move to package locations when we shift away from this location.}
	String FunctionToCallDuringShift
	{Optional. Function to call on the quest script during the shift.}
	bool IsShiftToPrimaryUniverse = False
	{Optional. If True, this is a shift back to the player's primary universe. Affects SFX.}
	int StageToSetBeforeShift = -1
	{Optional. Stage to set on this quest at the beginning of the shift process.}
	int StageToSetAfterShift = -1
	{Optional. Stage to set on this quest at the end of the shift process.}
	bool SetAfterStageAfterVFX = False
	{Optional. If True, set the After stage only after lifting the VFX. Otherwise, set just before doing so.}
	bool IsCrossCellMove = False
	{Optional. If True, use MoveTo instead of PopPlayerTo, and omit all VFX.}
	bool ShouldEnableHandScanner = True
	{Optional. If True, enable the hand scanner following the shift. If False, disable it.}
	float UpdateAdversaryDelay = 0.0
	{Optional. Amount of time to delay, after the shift has finished, before moving the Adversary.}
	bool ShouldStopCombatOnShift = False
	{Optional. Should we stop combat on the player on shift?}
	bool hasUpdatedAdversary = False
	{Runtime. Set when the adversary has been updated.}
EndStruct

Group ShiftingSystemProperties
	ShiftDatum[] property ShiftData Auto Mandatory ;NOT Const
	{List of Memory Spaces shifting targets.}
EndGroup

Group AutofillProperties
	SQ_FollowersScript property SQ_Followers Auto Const Mandatory
	ReferenceAlias property Ally Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_Duplicates Auto Const Mandatory
	RefCollectionAlias property Followers Auto Const Mandatory
	ReferenceAlias property ShiftingActivator Auto Const Mandatory
	ObjectReference property LC165_Shift_CompanionFallbackMarkerRef Auto Const Mandatory
	ObjectReference property LC165_Shift_AllyFallbackMarkerRef Auto Const Mandatory
	ObjectReference property LC165AllyHoldingPenMarkerRef Auto Const Mandatory
	ImageSpaceModifier property MQ206DShiftFadeHoldImod Auto Const Mandatory
	ImageSpaceModifier property MQ206DShiftFadeInImod Auto Const Mandatory
	WWiseEvent property WwiseEvent_QSTMQ207C_ShiftToA Auto Const Mandatory
	WWiseEvent property WwiseEvent_QSTMQ207C_ShiftToB Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	Keyword property LC165_StarbornAdversaryInaccessibleKeyword Auto Const Mandatory
EndGroup

;Local Variables
LC165QuestScript selfAsQuestScript		;This script, recast to LC165QuestScript.
Actor player 							;Player
ObjectReference shiftingActivatorRef 	;The Shifting Marker ref.
ShiftDatum property currentShift Auto Hidden 	;The last shift we performed.
InputEnableLayer inputLayer 			;InputEnableLayer to disable movement during shifts.
bool updateAdversaryInProgress			;Are we waiting for an UpdateAdversary call to finish?

;Local Consts
int CONST_WaitForAdversaryUpdateFailsafe = 1000 Const
float CONST_AdversaryTeleportInDelay = 0.25 Const

;Objective management for the first two distortions.
int CONST_DistortionID_EnterVectera = 0 Const
int CONST_DistortionID_LeaveVectera = 1 Const
int CONST_DistortionID_EnterScow = 2 Const
int CONST_DistortionID_LeaveScow = 3 Const
int CONST_Objective_EnterVecteraDistortion = 100 Const
int CONST_Objective_CompleteVecteraDistortion = 110 Const
int CONST_Objective_EnterScowDistortion = 140 Const
int CONST_Objective_FindWayOutOfScowDistortion = 145 Const
int CONST_Objective_CompleteScowDistortion = 150 Const
int CONST_Stage_FoundWayOutOfScowDistortion = 780 Const

;Guards
Guard ShiftingGuard ProtectsFunctionLogic


;-------------------------------------
;Initialization & Event Registration
;------------------------------------

Event OnQuestInit()
	;Set up local variables and properties.
	selfAsQuestScript = (Self as Quest) as LC165QuestScript
	player = Game.GetPlayer()
	inputLayer = InputEnableLayer.Create()
	shiftingActivatorRef = ShiftingActivator.GetRef()

	;Reset actors.
	int i = 0
	While (i < ShiftData.Length)
		ShiftData[i].RefsToEnableOnShiftTo.ResetAll()
		i = i + 1
	EndWhile
EndEvent


;-------------------------------------
;Shifting
;---------

Function ShiftTo(String name, String functionToCallDuringShift="", ObjectReference distortion=None, int DistortionID=-1, Actor[] stopCombatWith=None)
	int index = ShiftData.FindStruct("Name", name)
	if (index < 0)
		Debug.Trace("ERROR: LC165ShiftingQuestScript ShiftTo: " + name + " is not a valid shift target. Aborting shift.", 2)
	ElseIf (ShiftData[index] == currentShift)
		Debug.Trace("WARN: LC165ShiftingQuestScript ShiftTo: " + name + " was told to shift to the current shift location. Ignoring.", 1)
	Else
		LockGuard ShiftingGuard
		
			;Get our new shift's data.
			ShiftDatum oldShift = currentShift
			currentShift = ShiftData[index]

			;Play the initial VFX & SFX (if this isn't a cross-cell move).
			if (!currentShift.IsCrossCellMove)
				;Play SFX.
				if (currentShift.IsShiftToPrimaryUniverse == 1)
					WwiseEvent_QSTMQ207C_ShiftToB.Play(player)
				Else
					WwiseEvent_QSTMQ207C_ShiftToA.Play(player)
				EndIf
				;Play VFX.
				if (distortion == None)
					shiftingActivatorRef.MoveTo(player)
				Else
					shiftingActivatorRef.MoveTo(distortion)
				EndIf
				shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
			EndIf

			;Disable controls during the shift.
			inputLayer.DisablePlayerControls(True, False, True, True, True, True, True, True, True, True, True)

			;If this is a shift during the Adversary fight...
			if (currentShift.AdversaryMoveTargets != None)
				;Add the Inaccessible keyword to the player to hide the QTs
				;until the Adversary shifts into the same space.
				;
				;Note that the Adversary moves in response to a seperate ShiftAdversary call, after health
				;backstopping and any delay we want for the new arena.
				updateAdversaryInProgress = True
				player.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword)

				;Temporarily shunt the player to the holding cell, so they can't be hurt while the blackscreen is up.
				Game.PopPlayerTo(LC165AllyHoldingPenMarkerRef)
			EndIf

			;Clean up refs from the previous shift.
			if ((oldShift != None) && (oldShift.RefsToEnableOnShiftAway != None))
				oldShift.RefsToEnableOnShiftAway.EnableAll()
			EndIf
			if ((oldShift != None) && (oldShift.RefsToDisableOnShiftAway != None))
				oldShift.RefsToDisableOnShiftAway.DisableAll()
			EndIf

			;Set the Before stages.
			if (currentShift.StageToSetBeforeShift >= 0)
				SetStage(currentShift.StageToSetBeforeShift)
			EndIf

			;Enable refs.
			if (currentShift.EnableParent != None)
				;float startTime = Utility.GetCurrentRealTime()
				currentShift.EnableParent.TryToEnable()
				;Debug.Trace("LC165ShiftingQuestScript ShiftTo: Enable Swap took " + (Utility.GetCurrentRealTime() - startTime))
			EndIf
			if (currentShift.RefsToEnableOnShiftTo != None)
				;float startTime = Utility.GetCurrentRealTime()
				ObjectReference[] refsToEnable = currentShift.RefsToEnableOnShiftTo.GetArray()
				int i = 0
				While (i < refsToEnable.Length)
					refsToEnable[i].Enable()
					i = i + 1
				EndWhile
				;Debug.Trace("LC165ShiftingQuestScript ShiftTo: Forced Ref Enable took " + (Utility.GetCurrentRealTime() - startTime))
			EndIf
			if (currentShift.RefsToDisableOnShiftTo != None)
				currentShift.RefsToDisableOnShiftTo.DisableAll()
			EndIf

			;Move the player.
			if (!currentShift.IsCrossCellMove)
				Game.PopPlayerTo(currentShift.PlayerMoveTarget)
			Else
				player.MoveTo(currentShift.PlayerMoveTarget)
			EndIf

			;Call functionToCallDuringShift, if any.
			if (functionToCallDuringShift != "")
				selfAsQuestScript.CallFunction(functionToCallDuringShift, None)
			EndIf
			if (currentShift.FunctionToCallDuringShift != "")
				selfAsQuestScript.CallFunction(currentShift.FunctionToCallDuringShift, None)
			EndIf

			;Move Followers.
			if (currentShift.CompanionMoveTarget != None)
				;Move followers to the specified marker and have them resume following the player.
				SQ_Followers.TeleportFollowers(currentShift.CompanionMoveTarget, None, IncludeFollowingFollowers=True, IncludeWaitingFollowers=True, StartFollowingAfterTeleport=True, StartWaitingAfterTeleport=False, SkipWaitingFollowersObjective=True)
			Else
				;Move followers to the holding cell and have them wait there until the player exits whatever space they've shifted to.
				SQ_Followers.TeleportFollowers(LC165_Shift_CompanionFallbackMarkerRef, None, IncludeFollowingFollowers=True, IncludeWaitingFollowers=True, StartFollowingAfterTeleport=False, StartWaitingAfterTeleport=True, SkipWaitingFollowersObjective=True)
			EndIf

			;Move Ally, if any.
			Actor allyRef = Ally.GetActorRef()
			if (allyRef != None)
				Actor[] allyRefArray = new Actor[1]
				allyRefArray[0] = allyRef
				if (currentShift.AllyMoveTarget != None)
					;Move Ally to the specified marker and have them resume following the player.
					SQ_Followers.TeleportFollowers(currentShift.AllyMoveTarget, allyRefArray, IncludeFollowingFollowers=True, IncludeWaitingFollowers=True, StartFollowingAfterTeleport=True, StartWaitingAfterTeleport=False, SkipWaitingFollowersObjective=True)
				Else
					;Move Ally to the holding cell and have them wait there until the player exits whatever space they've shifted to.
					SQ_Followers.TeleportFollowers(LC165_Shift_AllyFallbackMarkerRef, allyRefArray, IncludeFollowingFollowers=True, IncludeWaitingFollowers=True, StartFollowingAfterTeleport=False, StartWaitingAfterTeleport=True, SkipWaitingFollowersObjective=True)
				EndIf
			EndIf

			;Stop combat, if desired.
			if (currentShift.ShouldStopCombatOnShift)
				player.StopCombat()
				if (stopCombatWith != None)
					int i = 0
					While (i < stopCombatWith.Length)
						Actor current = stopCombatWith[i]
						if (current != None)
							current.StopCombat()
							Debug.Trace("Stopped combat on " + current)
						EndIf
						i = i + 1
					EndWhile
				EndIf
			EndIf

			;Set the After stage before lifting the VFX, if desired.
			if (!currentShift.SetAfterStageAfterVFX && (currentShift.StageToSetAfterShift >= 0))
				SetStage(currentShift.StageToSetAfterShift)
			EndIf

			;For the first two distortions, update objectives.
			if (distortionID >= 0)
				UpdateObjectivesWhenEnteringDistortion(distortionID)
			EndIf
			
			;Enable all controls.
			inputLayer.Reset()

			;Then enable or disable the handscanner.
			inputLayer.EnableHandScanner(currentShift.ShouldEnableHandScanner)

			;End VFX.
			if (!currentShift.IsCrossCellMove)
				shiftingActivatorRef.PlayAnimation("Stop01")
			EndIf

			;Set the After stage after lifting the VFX, if desired.
			if (currentShift.SetAfterStageAfterVFX && (currentShift.StageToSetAfterShift >= 0))
				SetStage(currentShift.StageToSetAfterShift)
			EndIf
		EndLockGuard
	EndIf
EndFunction

Function ShiftAdversary(String adversaryShiftName)
	LockGuard ShiftingGuard
		if (currentShift == None)
			Debug.Trace("ERROR: ShiftAdversary: No active shift to move the Adversary to. Aborting.", 2)
		ElseIf (currentShift.Name != adversaryShiftName)
			Debug.Trace("ERROR: ShiftAdversary was called to shift to " + adversaryShiftName + " but we were in " + currentShift.Name, 2)
		ElseIf (currentShift.AdversaryMoveTargets == None)
			Debug.Trace("WARN: ShiftAdversary was called to shift to " + adversaryShiftName + " but it has no move targets for the Adversary. Ignoring.", 1)
		ElseIf (currentShift.hasUpdatedAdversary)
			Debug.Trace("WARN: ShiftAdversary was called to move the Adversaries to " + adversaryShiftName + " but they're already active. Ignoring.", 1)
		Else
			if (currentShift.UpdateAdversaryDelay == 0)
				UpdateAdversary(currentShift.Name, currentShift.UpdateAdversaryDelay)
			Else ;(currentShift.UpdateAdversaryDelay > 0)
				Var[] akArgs = new Var[2]
				akArgs[0] = currentShift.Name
				akArgs[1] = currentShift.UpdateAdversaryDelay
				CallFunctionNoWait("UpdateAdversary", akArgs)
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function UpdateAdversary(String name, float delay=0.0)
	Utility.Wait(delay)
	LockGuard(ShiftingGuard)
		if (currentShift == None)
			Debug.Trace("ERROR: LC165ShiftingQuestScript UpdateAdversary: No active shift to move the Adversary to. Aborting.", 2)
		Else
			int index = ShiftData.FindStruct("Name", name)
			if (ShiftData[index] != currentShift)
				Debug.Trace("ERROR: LC165ShiftingQuestScript UpdateAdversary: We were asked to move the Adversaries to " + name + " but our active shift is " + currentShift + ". Ignoring.", 2)
			ElseIf (ShiftData[index].hasUpdatedAdversary)
				Debug.Trace("WARN: LC165ShiftingQuestScript UpdateAdversary: We were asked to move the Adversaries to " + name + " but they're already active. Ignoring.", 1)
			Else
				Private_UpdateAdversary()
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function Private_UpdateAdversary() RequiresGuard(ShiftingGuard)
	currentShift.hasUpdatedAdversary = True
	Actor[] adversaryArray = StarbornAdversary_Duplicates.GetArray() as Actor[]
	ObjectReference[] adversaryTargets = currentShift.AdversaryMoveTargets.GetLinkedRefChain()
	adversaryTargets.Insert(currentShift.AdversaryMoveTargets, 0)
	int adversaryIndex = 0
	int targetIndex = 0
	Debug.Trace("Private_UpdateAdversary Length=" + adversaryArray.Length)
	While (adversaryIndex < adversaryArray.Length)
		Actor current = adversaryArray[adversaryIndex]
		bool currentIsDead = current.IsDead()
		Debug.Trace("Private_UpdateAdversary dead " + current + " " +  currentIsDead)
		if (!currentIsDead)
			float targetHealth = current.GetValue(Health)
			ObjectReference currentTarget = adversaryTargets[targetIndex]
			selfAsQuestScript.TeleportIn(currentTarget)
			current.MoveTo(currentTarget)
			Debug.Trace("Private_UpdateAdversary moved " + current + " " + adversaryIndex + " to " + adversaryTargets[targetIndex].GetPositionX() + "," + adversaryTargets[targetIndex].GetPositionY() + "," + adversaryTargets[targetIndex].GetPositionZ())
			current.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
			Debug.Trace("Private_UpdateAdversary BEFORE: " + current + "=" + current.GetValue(Health))
			current.SetNoBleedoutRecovery(False)
			current.RestoreValue(Health, 1)
			current.SetNoBleedoutRecovery(True)
			float damageHealth = (current.GetValue(Health) - targetHealth)
			if (damageHealth > 0)
				current.DamageValue(Health, damageHealth)
			EndIf
			Debug.Trace("Private_UpdateAdversary AFTER: " + current + "=" + current.GetValue(Health))
			current.StartCombat(player)
			current.EvaluatePackage()
			targetIndex = Math.Min(targetIndex+1, adversaryTargets.Length-1) as int
		EndIf
		adversaryIndex = adversaryIndex + 1
	EndWhile
	player.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
	updateAdversaryInProgress = False
EndFunction

ObjectReference Function GetShiftEnableParentMarker(String name)
	int index = ShiftData.FindStruct("Name", name)
	if (index < 0)
		Debug.Trace("ERROR: LC165ShiftingQuestScript GetShiftEnableMarker: " + name + " is not a valid shift target.", 2)
		return None
	Else
		ReferenceAlias enableParentAlias = ShiftData[index].EnableParent
		if (enableParentAlias == None)
			return None
		Else
			return ShiftData[index].EnableParent.GetRef()
		EndIf
	EndIf
EndFunction

Function ShutdownShifting()
	if (inputLayer != None)
		inputLayer.Delete()
	EndIf
EndFunction

;Wait for an Adversary update to finish.
Function WaitForAdversaryUpdateToFinish()
	int failsafe = 0
	While (updateAdversaryInProgress && (failsafe < CONST_WaitForAdversaryUpdateFailsafe))
		Utility.Wait(0.25)
		failsafe = failsafe + 1
	EndWhile
	if (updateAdversaryInProgress)
		Debug.Trace("ERROR: WaitForAdversaryUpdateToFinish timed out.", 2)
	EndIf
EndFunction

;Handle objective updates for the player entering and leaving the first two distortions.
Function UpdateObjectivesWhenEnteringDistortion(int distortionID)
	if (distortionID == CONST_DistortionID_EnterVectera)
		SetObjectiveCompleted(100)
		SetObjectiveDisplayed(110)
	ElseIf (distortionID == CONST_DistortionID_LeaveVectera)
		SetObjectiveDisplayed(110, False)
		SetObjectiveCompleted(100, False)
		SetObjectiveDisplayed(100, True, False)
	ElseIf (distortionID == CONST_DistortionID_EnterScow)
		SetObjectiveCompleted(140)
		if (!GetStageDone(CONST_Stage_FoundWayOutOfScowDistortion))
			SetObjectiveDisplayed(145)
		Else
			SetObjectiveDisplayed(150)
		EndIf
	ElseIf (distortionID == CONST_DistortionID_LeaveScow)
		SetObjectiveDisplayed(145, False)
		SetObjectiveDisplayed(150, False)
		SetObjectiveCompleted(140, False)
		SetObjectiveDisplayed(140, True, False)
	EndIf
EndFunction