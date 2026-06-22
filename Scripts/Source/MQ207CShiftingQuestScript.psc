Scriptname MQ207CShiftingQuestScript extends Quest
{Quest script for MQ207C, Entangled.}
;
;This script handles MQ207C's universe shifting. See the other quest script, MQ207CQuestScript, for quest event logic.
;In this quest, the player is 'shifting' between two alternate-universe versions of the same space.

Group ShiftingSystemProperties
	ReferenceAlias property NishinaIOriginMarker Auto Const Mandatory
	{A marker representing the position of Nishina I, set below the minimum X coordinate for Nishina I. Used to calculate the position offset to Nishina II, and to determine which Nishina the player is in.}

	ReferenceAlias property NishinaIIOriginMarker Auto Const Mandatory
	{A marker representing the position of Nishina II, set below the minimum X coordinate for Nishina II. Used to calculate the position offset to Nishina I, and to determine which Nishina the player is in.}

	ReferenceAlias property ShiftingActivator Auto Const Mandatory
	{Activator that handles the shifting imagespace animation.}

	Scene[] property ScenesToStopOnShift Auto Const
	{List of scenes to force-stop when the player shifts.}
EndGroup

Group AutofillProperties
	RefCollectionAlias property ShiftingTriggers Auto Const Mandatory
	RefCollectionAlias property Distortions01 Auto Const Mandatory
	RefCollectionAlias property Distortions02 Auto Const Mandatory
	RefCollectionAlias property Nishina01_CreaturesAll_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_SecurityCameras_I Auto Const Mandatory
	RefCollectionAlias property Nishina02_CreaturesAll_II Auto Const Mandatory
	RefCollectionAlias property Nishina02_RobotsAndTurrets_All_I Auto Const Mandatory
	Cell property LC116Nishina01 Auto Const Mandatory
	WWiseEvent property WwiseEvent_QSTMQ207C_ShiftToA Auto Const Mandatory
	WWiseEvent property WwiseEvent_QSTMQ207C_ShiftToB Auto Const Mandatory
	Keyword property MQ207CLinkTarget Auto Const Mandatory
	Static property XMarker Auto Const Mandatory
EndGroup

;Local Properties
int property NishinaOffset Auto Hidden 		;X-Delta between NishinaI and NishinaII; amount to add if the player is moving from I->II, or to subtract if moving from II->I.

;Local Variables
MQ207CQuestScript selfAsQuestScript			;This script, recast to MQ207CQuestScript.
Actor player 								;The player.
int NishinaIx 								;X-Coordinate of NishinaIOriginMarker
int NishinaIIx 								;X-Coordinate of NishinaIIOriginMarker
ObjectReference shiftingActivatorRef 		;The Shifting Activator ref.
ObjectReference[] shiftingTriggerRefs 		;Refs in ShiftingTriggers.
ObjectReference[] distortionRefs			;Refs in Distortions.

;Local Consts
int CONST_DistanceFromDistortionToForceFallback = 8 Const
int CONST_EmergencyShutdownStage = 720 Const

;Guards
Guard ShiftingGuard ProtectsFunctionLogic



;-------------------------------------
;Initialization & Event Registration
;------------------------------------

Event OnQuestInit()
	;Set up local variables and properties.
	selfAsQuestScript = (Self as Quest) as MQ207CQuestScript
	player = Game.GetPlayer()
	NishinaIx = NishinaIOriginMarker.GetRef().GetPositionX() as int
	NishinaIIx = NishinaIIOriginMarker.GetRef().GetPositionX() as int
	NishinaOffset = NishinaIIx - NishinaIx
	;Set up the Shift Marker
	shiftingActivatorRef = ShiftingActivator.GetRef()
	;Set up Shifting Triggers
	shiftingTriggerRefs = ShiftingTriggers.GetArray()
	int i = 0
	While (i < shiftingTriggerRefs.Length)
		RegisterForRemoteEvent(shiftingTriggerRefs[i], "OnTriggerEnter")
		i = i + 1
	EndWhile
	;Set up Distortions
	distortionRefs = Distortions01.GetArray()
	ObjectReference[] distortionRefs2 = Distortions02.GetArray()
	i = 0
	While (i < distortionRefs2.Length)
		distortionRefs.Add(distortionRefs2[i])
		i = i + 1
	EndWhile
	i = 0
	While (i < distortionRefs.Length)
		distortionRefs[i].BlockActivation(True, True)
		distortionRefs[i].DisableNoWait()
		i = i + 1
	EndWhile
EndEvent


;-------------------------------------
;Shifting
;---------

Auto State WaitingForShift
	;Shifting Triggers.
	Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
		GoToState("ProcessingShift")
		LockGuard ShiftingGuard
			MQ207CShiftingObjectScript shiftingObject = akSource as MQ207CShiftingObjectScript
			if ((shiftingObject != None) && (shiftingTriggerRefs.Find(shiftingObject) >= 0) && (ShouldPerformShift(akTriggerRef, shiftingObject)))
				Private_Shift(shiftingObject, True)
			EndIf
		EndLockGuard
		GoToState("WaitingForShift")
	EndEvent

	;Distortions.
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		GoToState("ProcessingShift")
		LockGuard ShiftingGuard
			MQ207CShiftingObjectScript shiftingObject = akSource as MQ207CShiftingObjectScript
			if ((shiftingObject != None) && (distortionRefs.Find(shiftingObject) >= 0) && (ShouldPerformShift(akActivator, shiftingObject)))
				Private_Shift(shiftingObject, False)
			EndIf
		EndLockGuard
		GoToState("WaitingForShift")
	EndEvent
EndState

State ProcessingShift
	;Ignore further trigger or distortion activation events until we've finished processing the last one.
EndState

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
EndEvent


;Should this object trigger a shift?
bool Function ShouldPerformShift(ObjectReference akSource, MQ207CShiftingObjectScript shiftingObject)
	if (akSource != player)
		return False
	ElseIf ((shiftingObject.PrereqStage >= 0) && (!GetStageDone(shiftingObject.PrereqStage)))
		return False
	ElseIf ((shiftingObject.TurnOffStage >= 0) && (GetStage() > shiftingObject.TurnOffStage))
		return False
	ElseIf (GetStageDone(CONST_EmergencyShutdownStage))
		return False
	Else
		return True
	EndIf
EndFunction


;Scripted shifts.
Function Shift(MQ207CShiftingObjectScript shiftingObject=None, bool shiftingObjectIsTrigger=False, bool shouldForceFallback=False, int additionalStageToSet=-1, ObjectReference shiftToMarker=None)
	LockGuard ShiftingGuard
		Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, useCollisionCheck=False)
	EndLockGuard
EndFunction

Function ShiftNoFX(MQ207CShiftingObjectScript shiftingObject=None, bool shiftingObjectIsTrigger=False, bool shouldForceFallback=False, int additionalStageToSet=-1, ObjectReference shiftToMarker=None)
	LockGuard ShiftingGuard
		Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, omitFX=True)
	EndLockGuard
EndFunction

;Perform the shift.
Function Private_Shift(MQ207CShiftingObjectScript shiftingObject=None, bool shiftingObjectIsTrigger=False, bool shouldForceFallback=False, int additionalStageToSet=-1, ObjectReference shiftToMarker=None, bool useCollisionCheck=True, bool omitFX=False) RequiresGuard(ShiftingGuard)
	;Determine which universe we're in, and which one we're shifting to.
	int currentUniverse = GetCurrentUniverse()
	int newUniverse
	if (currentUniverse == 1)
		newUniverse = 2
	Else
		newUniverse = 1
	EndIf

	;Play initial VFX & SFX.
	if (!omitFX)
		if (currentUniverse == 1)
			WwiseEvent_QSTMQ207C_ShiftToB.Play(player)
		Else
			WwiseEvent_QSTMQ207C_ShiftToA.Play(player)
		EndIf

		if (shiftingObjectIsTrigger || (shiftingObject == None))
			shiftingActivatorRef.MoveTo(player)
		Else
			shiftingActivatorRef.MoveTo(shiftingObject)
		EndIf
		shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
	EndIf

	;Stop combat. If you were fighting something before, you're not now.
	Var[] akArgs = new Var[1]
	akArgs[0] = newUniverse
	CallFunctionNoWait("StopCombatOnShift", akArgs)

	;Calculate our offset.
	int offset
	if (currentUniverse == 1)
		offset = NishinaOffset
	Else
		offset = -NishinaOffset
	EndIf

	;If we're shifting based on a trigger or a distortion (as opposed to a quest script call), make sure the
	;player is still in the trigger or near the distortion. If not, force a fallback to make sure they end
	;up in a reasonable place.
	if (shiftingObject != None)
		if (shiftingObject.ShouldForceFallback)
			shouldForceFallback = True
			shiftToMarker = shiftingObject.GetLinkedRef(MQ207CLinkTarget)
		ElseIf (shiftingObjectIsTrigger && (!shiftingObject.IsInTrigger(player)))
			shouldForceFallback = True
		ElseIf (!shiftingObjectIsTrigger && player.GetDistance(shiftingObject) > CONST_DistanceFromDistortionToForceFallback)
			shouldForceFallback = True
		EndIf
	EndIf

	;Perform the shift.
	if (shiftToMarker != None)
		;If we want to shift the player to some specific marker, just do that.
		Game.PopPlayerTo(shiftToMarker)
	ElseIf (shouldForceFallback)
		PerformFallbackShift(shiftingObject, offset)
	ElseIf (omitFX)
		Game.PopPlayerTo(player, afXOffset=offset, abCheckForCollision=False)
	Else
		bool popSuccessful = Game.PopPlayerTo(player, afXOffset=offset, abCheckForCollision=useCollisionCheck)
		if (!popSuccessful)
			PerformFallbackShift(shiftingObject, offset)
		EndIf
	EndIf

	;Stop scenes.
	int i = 0
	While (i < ScenesToStopOnShift.Length)
		ScenesToStopOnShift[i].Stop()
		i = i + 1
	EndWhile

	;Set any stages we need to set, based on our shifting object.
	if ((shiftingObject != None) && (shiftingObject.StageToSetOnShift > 0))
		SetStage(shiftingObject.StageToSetOnShift)
	EndIf

	;Set any additional stages.
	if (additionalStageToSet > 0)
		SetStage(additionalStageToSet)
	EndIf

	;If we're shifting based on a trigger, update the Nishina01 Guidenace Trigger AV if needed.
	if (shiftingObjectIsTrigger)
		selfAsQuestScript.UpdateGuidanceTriggerAV()
	EndIf

	;Update Alarm SFX on shift.
	selfAsQuestScript.SilenceNishina02AlarmsNoWait()
	
	;Update the Research Lab event on shift.
	selfAsQuestScript.Private_UpdateLabResearchLabStateOnShift(newUniverse)

	;End VFX.
	if (!omitFX)
		shiftingActivatorRef.PlayAnimation("Stop01")
	EndIf
EndFunction

;Helper function for Shift.
Function PerformFallbackShift(ObjectReference shiftingObject, int offset) RequiresGuard(ShiftingGuard)
	if (shiftingObject == None)
		Debug.Trace("ERROR: MQ207CShiftingQuestScript was asked to perform a fallback shift, but does not have a shifting object. Shifting will fail.", 2)
	Else
		ObjectReference fallbackLink = shiftingObject.GetLinkedRef(MQ207CLinkTarget)
		if (fallbackLink != None)
			Game.PopPlayerTo(fallbackLink)
			Debug.Trace("Shift: Fallback to link " + fallbackLink)
		Else
			;Debug.Trace("MQ207C: Called PerformFallbackShift")
			ObjectReference marker = shiftingObject.PlaceAtMe(XMarker)
			marker.MoveTo(marker, afXOffset=offset)
			marker.MoveToNearestNavmeshLocation()
			marker.SetAngle(0, 0, player.GetAngleZ())
			Game.PopPlayerTo(marker)
			Debug.Trace("Shift: Fallback to " + marker.GetPositionX() + " " + marker.GetPositionY() + " " + marker.GetPositionZ())
			marker.Delete()
		EndIf
	EndIf
EndFunction

;Helper function for Shift.
Function StopCombatOnShift(int newUniverse)
	Debug.Trace("Stop combat start.")
	player.StopCombat()
	if (player.GetParentCell() == LC116Nishina01)
		if (newUniverse == 1)
			Nishina01_CreaturesAll_II.StopCombat()
		EndIf
		;If newUniverse == 2, nothing to do.
	Else
		if (newUniverse == 1)
			Nishina02_CreaturesAll_II.StopCombat()
		Else
			Nishina02_SecurityCameras_I.StopCombat()
			Nishina02_RobotsAndTurrets_All_I.StopCombat()
		EndIf
	EndIf
	Debug.Trace("Stop combat done.")
EndFunction

;-------------------------------------
;Ending III Functions
;----------------------------------

Function PlaySpecialEndingFadeOut()
	shiftingActivatorRef.MoveTo(player)
	shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
	WwiseEvent_QSTMQ207C_ShiftToA.Play(player)
EndFunction

Function PlaySpecialEndingFadeIn()
	shiftingActivatorRef.MoveTo(player)
	shiftingActivatorRef.PlayAnimation("Stop01")
EndFunction


;-------------------------------------
;Shifting Object Utility Functions
;----------------------------------

;Enable or disable all of the shifting triggers.
Function EnableShiftingTriggers(bool shouldBeEnabled)
	int i = 0
	While (i < shiftingTriggerRefs.Length)
		if (shouldBeEnabled)
			shiftingTriggerRefs[i].EnableNoWait()
		Else
			shiftingTriggerRefs[i].DisableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Enable or disable all of the distortions.
Function EnableDistortions(bool shouldBeEnabled)
	int i = 0
	While (i < distortionRefs.Length)
		if (shouldBeEnabled)
			Debug.Trace("Enabling " + distortionRefs[i])
			distortionRefs[i].EnableNoWait()
		Else
			Debug.Trace("Disabling " + distortionRefs[i])
			distortionRefs[i].DisableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Block or unblock activation on all of the distortions.
Function SetDistortionsActivationBlocked(bool shouldBeActivationBlocked)
	int i = 0
	While (i < distortionRefs.Length)
		distortionRefs[i].BlockActivation(shouldBeActivationBlocked, shouldBeActivationBlocked)
		if (shouldBeActivationBlocked)
			UnregisterForRemoteEvent(distortionRefs[i], "OnActivate")
		Else
			RegisterForRemoteEvent(distortionRefs[i], "OnActivate")
		EndIf
		i = i + 1
	EndWhile
EndFunction


;-------------------------------------
;Utility & Debug Functions
;--------------------------

;Return the player's current universe.
int Function GetCurrentUniverse()
	if (player.GetPositionX() < NishinaIIx)
		return 1
	Else
		return 2
	EndIf
EndFunction


;-------------------------------------
;Shutdown
;---------

Function ClearVariables()
	shiftingActivatorRef = None
	shiftingTriggerRefs = None
	distortionRefs = None
EndFunction