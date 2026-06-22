Scriptname OutpostTutorialScript extends Quest Conditional

ReferenceAlias Property Alias_Outpost Auto Const
ReferenceAlias Property Alias_PowerRequiredObject Auto Const

ReferenceAlias Property Alias_SourceObject Auto Const
ReferenceAlias Property Alias_TargetObject Auto Const

Keyword Property WorkshopNoRepairKeyword Auto Const mandatory
{ keyword on object which indicates it can't be repaired }

ActorValue Property OutpostTutorialObject Auto Const mandatory
{ script only checks refs with this AV }

GlobalVariable Property OutpostTutorialEnterMenuCount auto const mandatory
{ count how many times player has entered build menu }

ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
{ check this on start - no tutorials for new game plus }

group MiscObjective
	ConditionForm Property OutpostTutorialConditionMiscObjective auto const mandatory
	{ condition to check for when to trigger outpost misc objective }

	Keyword Property OutpostPreventPlacement Auto Const mandatory
	{ keyword on location that prevents outpost placement }

	Keyword Property LocTypeSurface Auto Const mandatory
	{ find planet surface }

	int property MiscObjectiveStartStage = 10 auto Const

	int property MiscObjectiveDoneStage = 20 auto Const

EndGroup

int property PlaceOutpostAchievement = 23 auto Const
{ achievement for placing an outpost }

bool debugAllowMiscObjective = false conditional

String HelpMessageString = "OutpostTutorialEvent"
float helpMessageInterval = 10.0 			; how long between repeating help messages
float helpMessageDurationLong = 10.0			; how long to display long help message
float helpMessageDurationShort = 3.0		; how long to display short (repeating) help message

float messageBoxDelay = 0.2  ; delay message boxes by a bit

Group EventTypes
	int property EventType_Build = 0 auto const
	int property EventType_Move = 1 auto const
	int property EventType_Destroy = 2 auto const
	int property EventType_Assign = 3 auto const
	int property EventType_Unassign = 4 auto const
	int property EventType_DestructionState = 5 auto const
	int property EventType_PowerOn = 6 auto const
	int property EventType_EnterMenu = 7 auto const
	int property EventType_PlaceBeacon = 8 auto const
	int property EventType_OutputLink = 9 auto const
	int property EventType_EnterBeaconPlacement = 10 auto const
	int property EventType_PowerOff = 11 auto const
	int property EventType_Flycam = 12 auto const
endGroup

;this is a set of data for a single tutorial steps that may be grouped with others in a sequence
struct WorkshopTutorialStep
	int tutorialID = -1
	{ which tutorial do I go with? (since we can't put arrays into structs) - matches ID of WorkshopTutorial }

	bool bStartingStep
	{ TRUE for the step that starts a tutorial sequence - should be only 1 of these }
	bool bFinalStep
	{ TRUE for the step that completes a tutorial sequence }

	Message	TriggerMessage
	{  message to display when starting this tutorial step - optional }

	Message TriggerMessagePC
	{ if this exists, use this instead of TriggerMessage if not using gamepad }

	bool bTriggerIsMessageBox = false
	{ set to true to display trigger messages as message boxes instead of help messages }

	Message HelpMessage
	{ help message to display during this step }

	Message	CompletionMessage
	{  message to display when completing this tutorial step - optional - usually just the final step needs this }

	Message	CompletionMessage2
	Message	CompletionMessage3

	ConditionForm TriggerCondition
	{ OPTIONAL - condition must evaluate to TRUE for this to even consider triggering }

	int TriggerEvent
	{ event type that STARTS this step
		(I think this only applies to starting steps)
	}

	bool TriggerOnEventOnly = false
	{ if TRUE don't check anything but getting the event }

	int CompletionEvent
	{ event that completes this step
		-1 = immediately complete the step (no additional event needed)
	 }

	bool CompletionOnEventOnly = false
	{ if TRUE don't check anything but getting the event }

	ConditionForm CompletionCondition
	{ condition must evaluate to TRUE for this to complete }

	int Status = -1
	{ -1 = not started
	  0 = active
	  1 = done
	}
endStruct

struct WorkshopTutorial
	int tutorialID
	{ the ID of this tutorial (which is made up of 1 or more TutorialItems )}

	string description
	{ describe this so it's easier to parse later }

	bool bDone
	{ if true, this whole sequence is done }

	int startingStep = -1
	{ set to index of starting step in TutorialSteps array }

	int activeStep = -1
	{ -1 = not active, otherwise the active step (index to TutorialSteps array) }

	ObjectReference outpostRef
	{ the workshop where this tutorial is happening }

	ReferenceAlias AliasToFill
	{ optional - put the object into this alias
		will be cleared when step is completed
	 }

	; for now, let's try just having 1 "mutually exclusive" tutorial ID - can add more if we need to, sadly not as an array
	int mutuallyExclusiveTutorialID = -1
	{ if this tutorial is currently running, don't start this one
		AND automatically complete me if mutually exclusive tutorial completes }

	ConditionForm requiredCondition
	{ if this condition isn't true, don't start this tutorial }

	int UnregisterForEventTypeOnCompletion = -1
	{ if this is the final event of a type, unregister for that event when done }

	GlobalVariable completionGlobal
	{ optional - set this global when complete }

endStruct

WorkshopTutorial[] property Tutorials auto
{ list of tutorials }

WorkshopTutorialStep[] property TutorialSteps auto
{ complete list of all tutorial steps - grouped by tutorialID }

Event OnQuestInit()
    Actor playerRef = Game.GetPlayer()
	if playerRef.GetValue(PlayerUnityTimesEntered) > 0
		Stop()
	else
		; outpost tutorial events
		RegisterForRemoteEvent(playerRef, "OnEnterOutpostBeaconMode")
		RegisterForRemoteEvent(playerRef, "OnOutpostPlaced")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectPlaced")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectGrabbed")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectMoved")
		RegisterForRemoteEvent(Alias_Outpost, "OnObjectDestroyed")
		RegisterForRemoteEvent(Alias_Outpost, "OnObjectRepaired")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectRemoved")
		RegisterForRemoteEvent(Alias_Outpost, "OnOutpostItemPowerOn")
		RegisterForRemoteEvent(Alias_Outpost, "OnOutpostItemPowerOff")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopOutputLink")
		RegisterForRemoteEvent(Alias_Outpost, "OnWorkshopFlycam")

		; player change location for misc objective
		RegisterForRemoteEvent(playerRef, "OnLocationChange")

		; TODO - output link event
	endif
endEvent

event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Actor playerRef = Game.GetPlayer()
	if akSender == playerRef
		; check if conditions pass
		Trace(self, " IsConditionTrue=" + OutpostTutorialConditionMiscObjective.IsTrue(akRefObject=playerRef))
		if OutpostTutorialConditionMiscObjective.IsTrue(akRefObject=playerRef)
			; locations allow placement?
			Location currentLocation = playerRef.GetCurrentLocation()
			Trace(self, " " + currentLocation + ".HasKeyword(OutpostPreventPlacement)=" + currentLocation.HasKeyword(OutpostPreventPlacement))
			if currentLocation.HasKeyword(OutpostPreventPlacement) == false
				if currentLocation.HasKeyword(LocTypeSurface)
					setStage(MiscObjectiveStartStage)
					; don't need on location change anymore
					UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
				EndIf
			endif
		endif
	endif
EndEvent

Guard workshopEventGuard ProtectsFunctionLogic
function HandleWorkshopEvent(ObjectReference outpostRef, Objectreference newObject, int iEventType, ObjectReference targetObject = NONE)
	LockGuard workshopEventGuard 
	    Trace(self, " HandleWorkshopEvent: type " + iEventType + " from " + outpostRef + ": newObject=" + newObject + ", targetObject=" + targetObject)
		int completedCount = 0 ; count how many complete so we can unregister and shut down once all steps are done

		; fill text replacement aliases
		if newObject
			Alias_SourceObject.ForceRefTo(newObject)
		else
			Alias_SourceObject.Clear()
		endif
		if targetObject
			Alias_TargetObject.ForceRefTo(targetObject)
		EndIf

		int tutorialIndex = 0
		while tutorialIndex < Tutorials.Length
			WorkshopTutorial theTutorial = Tutorials[tutorialIndex]
			if theTutorial.bDone == false
				Trace(self, " 	HandleWorkshopEvent: tutorial=" + theTutorial)
				if theTutorial.activeStep > -1
					Trace(self, " 		active tutorial - make sure we're still at " + theTutorial.outpostRef)
					; active tutorial
					; if this tutorial was at a different workshop, roll back - need to restart
					if theTutorial.outpostRef == outpostRef
						; same workshop - check active step
						EvaluateEvent(theTutorial, theTutorial.activeStep, outpostRef, newObject, targetObject, iEventType)
					else
						; clear roll back all completed steps for this tutorial
						RollBackTutorial(theTutorial)
						; check if starting step should trigger
						EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType)
					endif
				else
					Trace(self, " 		inactive tutorial - check to see if this event starts it")
					; see if first step is started by this event
					EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType)
				endif
			else
				; make sure unregistered (failsafe)
				if theTutorial.UnregisterForEventTypeOnCompletion > -1
					UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
				endif
				completedCount += 1
			endif
			tutorialIndex += 1
		endWhile

		; loop through TutorialSteps looking for anything that has no completion event
		int stepIndex = 0
		Trace(self,"    checking for steps with no completion event:")
		while stepIndex < TutorialSteps.Length
			WorkshopTutorialStep theStep = TutorialSteps[stepIndex]
			Trace(self,"   checking step " + theStep)
;			Trace(self,"   checking step " + stepIndex + ": status=" + theStep.Status)
			if theStep.Status == 0 && theStep.CompletionEvent == -1
				; no completion event - complete immediately
				Trace(self,"     step " + stepIndex + " started, no completion event: completing tutorial " + theStep.tutorialID)
				CompleteTutorialStep(Tutorials[theStep.tutorialID], stepIndex, newObject)
			endif
			stepIndex += 1
		endWhile

		if completedCount >= Tutorials.Length
			Trace(self," ALL TUTORIALS COMPLETE - shut down")
			Stop()
		else
			Trace(self," 	" + completedCount + " out of " + Tutorials.Length + " tutorials completed")
		endif

		; clear text replacement aliases
		Alias_SourceObject.Clear()
		Alias_TargetObject.Clear()
	EndLockGuard
endFunction

function RollBackTutorial(WorkshopTutorial theTutorial)
	Trace(self," RollBackTutorial " + theTutorial.tutorialID)
	; reset this tutorial back to starting state
	theTutorial.outpostRef = NONE
	theTutorial.activeStep = -1
	; loop through TutorialSteps looking for something to complete or start
	int stepIndex = 0
	while stepIndex < TutorialSteps.Length
		WorkshopTutorialStep theStep = TutorialSteps[stepIndex]
		if theStep.tutorialID == theTutorial.tutorialID
			theStep.Status = -1
			; reset any current help messages for this step
			if theStep.TriggerMessage
				Trace(self," trying to cancel help message " + theStep.TriggerMessage)
				theStep.TriggerMessage.UnshowAsHelpMessage()
			endif
			if theStep.TriggerMessagePC
				Trace(self," trying to cancel help message " + theStep.TriggerMessagePC)
				theStep.TriggerMessagePC.UnshowAsHelpMessage()
			endif
			if theStep.HelpMessage
				Trace(self," trying to cancel help message " + theStep.HelpMessage)
				theStep.HelpMessage.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage
				Trace(self," trying to cancel help message " + theStep.CompletionMessage)
				theStep.CompletionMessage.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage2
				Trace(self," trying to cancel help message " + theStep.CompletionMessage2)
				theStep.CompletionMessage2.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage3
				Trace(self," trying to cancel help message " + theStep.CompletionMessage3)
				theStep.CompletionMessage3.UnshowAsHelpMessage()
			endif

;			HelpMessage(theTutorial, stepIndex, false)
		endif
		stepIndex += 1
	endWhile

endFunction

function HelpMessage(WorkshopTutorial theTutorial, int iStepIndex, bool bShowMessage = true)
	Trace(self,"   HelpMessage for tutorial " + theTutorial.tutorialID + ", stepIndex = " + iStepIndex + ", bShowMessage=" + bShowMessage)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	if theStep.HelpMessage
		if bShowMessage
			string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex
			theStep.HelpMessage.ShowAsHelpMessage(eventString, helpMessageDurationShort, helpMessageInterval, 0, "WorkshopMenu")
		else
			Trace(self," trying to cancel help message " + theStep.HelpMessage)
			theStep.HelpMessage.UnshowAsHelpMessage()
		endif
	endif
endFunction


function EvaluateEvent(WorkshopTutorial theTutorial, int iStepIndex, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, int iEventType)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	Trace(self,"  EvaluateEvent for tutorial " + theTutorial.tutorialID + ", step " + iStepIndex)

	; make sure workshop is currently loaded (can receive some events during e.g. daily update)
	if outpostRef && outpostRef.Is3dLoaded() == false
		return
	endif

	; see if this step should respond to the event
	if theStep.Status == 1
		; failsafe - do nothing if already complete
		return
	elseif theStep.Status == -1
		Trace(self,"	EvaluateEvent: not started - should I start?")
		; should I start?
		; check for required condition
		if theTutorial.requiredCondition
			Trace(self,"	EvaluateEvent: requiredCondition=" + theTutorial.requiredCondition)
			; if required tutorial not complete, don't start
			if IsConditionTrue(theTutorial.requiredCondition, theObject, targetObject) == false
				; do nothing
				Trace(self,"	EvaluateEvent: required condition not true - don't start")
				return
			endif
		endif

		; check for mutually exclusive tutorial already active:
		if theTutorial.mutuallyExclusiveTutorialID > -1
			WorkshopTutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
			Trace(self,"	EvaluateEvent: mutually exclusive tutorial=" + nemesisTutorial.tutorialID)
			if nemesisTutorial && nemesisTutorial.activeStep > -1
				; do nothing
				Trace(self,"	EvaluateEvent: mutually exclusive tutorial active - don't start")
				return
			endif
		endif
		; if no active "nemesis tutorial", okay to try to start me
		if IsValidEvent(true, theStep, outpostRef, theObject, targetObject, iEventType)
			Trace(self,"	EvaluateEvent: event type matches, correct trigger resource type - show trigger message")
			StartTutorialStep(theTutorial, iStepIndex, theObject)
			theTutorial.outpostRef = outpostRef
		endif
	elseif theStep.Status == 0
		Trace(self,"	EvaluateEvent: started - should I complete?")
		; should I complete?
		if IsValidEvent(false, theStep, outpostRef, theObject, targetObject, iEventType)
			Trace(self,"	EvaluateEvent: event type matches, correct completion resource type - COMPLETE")
			CompleteTutorialStep(theTutorial, iStepIndex, theObject)
		endif
	endif
endFunction

bool function IsValidEvent(bool bTriggerEvent, WorkshopTutorialStep theStep, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, int iEventType)
	; bTriggerEvent:
	; 	TRUE = checking for trigger event
	;	FALSE = checking for completion event

	Trace(self,"     IsValidEvent: bTriggerEvent = " + bTriggerEvent + ", theStep=" + TutorialSteps.Find(theStep) + ", theObject=" + theObject + ", targetObject=" + targetObject + ", iEventType=" + iEventType)
	bool bIsValid = false

	int eventToCheck
	ConditionForm conditionToCheck
	bool checkEventOnly = false
	
	if bTriggerEvent
		eventToCheck = theStep.TriggerEvent
		conditionToCheck = theStep.TriggerCondition
		checkEventOnly = theStep.TriggerOnEventOnly
	else
		eventToCheck = theStep.CompletionEvent
		conditionToCheck = theStep.CompletionCondition
		checkEventOnly = theStep.CompletionOnEventOnly
	endif

	if iEventType == eventToCheck
		Trace(self," 	  IsValidEvent: checkEventOnly=" + checkEventOnly)
		if checkEventOnly
			; special case - damage should only trigger for objects that can be repaired
			if iEventType == EventType_DestructionState
				if theObject.HasKeyword(WorkshopNoRepairKeyword) == false
					bIsValid = true
				endif
			else
				bIsValid = true
			endif
		elseif IsConditionTrue(conditionToCheck, theObject, targetObject)
			Trace(self," 	  IsValidEvent: checking condition=" + conditionToCheck)
			bIsValid = true
		; anything else... for future expansion
		endif
	endif

	Trace(self," 		IsValidEvent=" + bIsValid)
	return bIsValid
endFunction

bool function IsConditionTrue(ConditionForm conditionToCheck, ObjectReference subjectRef = NONE, ObjectReference targetRef = NONE)
	bool bIsTrue = true
	if conditionToCheck
		bIsTrue = conditionToCheck.IsTrue(subjectRef, targetRef)
	endif
	Trace(self," 		IsConditionTrue=" + bIsTrue + ": conditionToCheck=" + conditionToCheck + " subjectRef=" + subjectRef + " targetRef=" + targetRef + " bIsTrue=" + bIsTrue)
	return bIsTrue
EndFunction


function StartTutorialStep(WorkshopTutorial theTutorial, int iStepIndex, ObjectReference theObject)
	Trace(self,"   StartTutorialStep " + iStepIndex)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	theStep.status = 0
	theTutorial.activeStep = iStepIndex
	; fill alias if there is one
	if theTutorial.AliasToFill
		theTutorial.AliasToFill.ForceRefTo(theObject)
	endif
	if theStep.TriggerMessage
		if theStep.bTriggerIsMessageBox
			Trace(self, "    showing message box " + theStep.TriggerMessage + ", source alias=" + Alias_SourceObject.GetRef() + ", target alias=" + Alias_TargetObject.GetRef())
			Utility.Wait(messageBoxDelay)
			if theStep.TriggerMessagePC && Game.UsingGamePad() == false
				theStep.TriggerMessagePC.Show()
			else
				theStep.TriggerMessage.Show()
			endif
		else
			string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex + "_START"
			if theStep.TriggerMessagePC && Game.UsingGamePad() == false
				theStep.TriggerMessagePC.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0, 1, "WorkshopMenu")
			else
				theStep.TriggerMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0, 1, "WorkshopMenu")
			endif
		endif
	endif
	if theStep.HelpMessage
		HelpMessage(theTutorial, iStepIndex)
	endif
endFunction

function CompleteTutorialStep(WorkshopTutorial theTutorial, int iStepIndex, ObjectReference theObject)
	Trace(self,"   CompleteTutorialStep " + iStepIndex)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	theStep.status = 1
	; turn off help message
	if theStep.HelpMessage
		HelpMessage(theTutorial, iStepIndex, false)
	endif

	; if there's a completion message, show it
	if theStep.CompletionMessage
		string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex + "_COMPLETE"
		theStep.CompletionMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0, 1, "WorkshopMenu")
		if theStep.CompletionMessage2
			theStep.CompletionMessage2.ShowAsHelpMessage(eventString + "2", helpMessageDurationLong, 0, 1, "WorkshopMenu")
		endif
		if theStep.CompletionMessage3
			theStep.CompletionMessage3.ShowAsHelpMessage(eventString + "3", helpMessageDurationLong, 0, 1, "WorkshopMenu")
		endif
	endif
	
	if theTutorial.AliasToFill
		theTutorial.AliasToFill.Clear()
	endif

	; if there's a next step, make it active automatically
	bool bFoundNextStep = false
	int i = iStepIndex + 1
	while i < TutorialSteps.Length && bFoundNextStep == false
		WorkshopTutorialStep nextStep = TutorialSteps[i]
		if nextStep.tutorialID == theTutorial.tutorialID
			Trace(self," 	found next step: " + i)
			; found a new step - make it active
			bFoundNextStep = true
			StartTutorialStep(theTutorial, i, theObject)
		endif
		i += 1
	endWhile
	if bFoundNextStep == false
		; no next step - tutorial is complete
		Trace(self,"	TUTORIAL " + theTutorial.tutorialID + " COMPLETE")
		theTutorial.bDone = true
		theTutorial.activeStep = -1
		theTutorial.outpostRef = NONE
		; unregister for this event if appropriate
		if theTutorial.UnregisterForEventTypeOnCompletion > -1
			UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
		endif

		; if completion global, set it
		if theTutorial.completionGlobal
			theTutorial.completionGlobal.SetValueInt(1)
		endif

		; also complete any mutually exclusive tutorials
		if theTutorial.mutuallyExclusiveTutorialID > -1
			WorkshopTutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
			if nemesisTutorial
				nemesisTutorial.bDone = true
				nemesisTutorial.outpostRef = NONE
				; unregister for this event if appropriate
				if nemesisTutorial.UnregisterForEventTypeOnCompletion > -1
					UnregisterForWorkshopEvent(nemesisTutorial.UnregisterForEventTypeOnCompletion)
				endif
			endif
		endif
	endif
endFunction

; handle outpost events
Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
		Trace(self," ***OnWorkshopObjectPlaced " + akReference)
	if akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnWorkshopObjectPlaced " + akReference + ": TUTORIAL OBJECT")
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Build)
	endif
EndEvent

Event ReferenceAlias.OnWorkshopObjectGrabbed(ReferenceAlias akSource, ObjectReference akReference)
	if akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnWorkshopObjectGrabbed " + akReference)
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move)
	endif
EndEvent

Event ReferenceAlias.OnWorkshopObjectMoved(ReferenceAlias akSource, ObjectReference akReference)
	if akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnWorkshopObjectMoved " + akReference)
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move)
	endif
EndEvent

Event ReferenceAlias.OnObjectDestroyed(ReferenceAlias akSource, ObjectReference akReference)
	if akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnObjectDestroyed " + akReference)
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState)
	endif
EndEvent

Event ReferenceAlias.OnObjectRepaired(ReferenceAlias akSource, ObjectReference akReference)
	if akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnObjectRepaired " + akReference)
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState)
	endif
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
	; is this the outpost beacon itself?
	if akReference == Alias_Outpost.GetRef()
		; clear the aliases - player removed the outpost beacon
		ClearAllOutpostAliases()
	elseif akReference.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnWorkshopObjectRemoved " + akReference)
		HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Destroy)
	endif
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOn(ReferenceAlias akSource, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
	if akPoweredItem.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnOutpostItemPowerOn " + akPoweredItem)
		HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOn, akPowerGenerator)
	endif
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOff(ReferenceAlias akSource, ObjectReference akPoweredItem)
	if akPoweredItem.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnOutpostItemPowerOff " + akPoweredItem)
		HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOff)
	endif
EndEvent

Event ReferenceAlias.OnWorkshopOutputLink(ReferenceAlias akSourceAlias, ObjectReference akSource, ObjectReference akTarget)
	if akSource.GetValue(OutpostTutorialObject) > 0 || akTarget.GetValue(OutpostTutorialObject) > 0
		Trace(self," ***OnWorkshopOutputLink*** " + akSource + " " + akTarget)
		HandleWorkshopEvent(akSourceAlias.GetRef(), akSource, EventType_OutputLink, akTarget)
	endif
EndEvent

Event ReferenceAlias.OnWorkshopFlyCam(ReferenceAlias akSourceAlias, bool aStart)
	if aStart
		ObjectReference outpostBeaconRef = akSourceAlias.GetRef()
		Trace(self," ***OnWorkshopFlyCam outpostBeaconRef=" + outpostBeaconRef)
		HandleWorkshopEvent(outpostBeaconRef, NONE, EventType_Flycam)
	endif
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
	Trace(self," ***OnOutpostPlaced akOutpostBeacon=" + akOutpostBeacon)
    Alias_Outpost.ForceRefTo(akOutpostBeacon)
	if GetStageDone(MiscObjectiveStartStage) && GetStageDone(MiscObjectiveDoneStage) == false
		SetStage(MiscObjectiveDoneStage)
	endif
	HandleWorkshopEvent(akOutpostBeacon, NONE, EventType_PlaceBeacon)
	Game.AddAchievement(PlaceOutpostAchievement)
EndEvent

Event Actor.OnEnterOutpostBeaconMode(Actor akSource)
	Trace(self," ***OnEnterOutpostBeaconMode")
	HandleWorkshopEvent(NONE, NONE, EventType_EnterBeaconPlacement)
EndEvent

; called from OutpostBeaconScript
function EnterWorkshopMenu(ObjectReference akOutpostBeacon)
	Trace(self," ***EnterWorkshopMenu akOutpostBeacon=" + akOutpostBeacon)
    Alias_Outpost.ForceRefTo(akOutpostBeacon)
	OutpostTutorialEnterMenuCount.Mod(1.0)
	HandleWorkshopEvent(akOutpostBeacon, NONE, EventType_EnterMenu)
EndFunction

function UnregisterForWorkshopEvent(int eventType)
	Trace(self," UnregisterForWorkshopEvent type=" + eventType)
	if eventType == EventType_Build
		UnregisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectPlaced")
	elseif eventType == EventType_Move
		UnregisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectMoved")
	elseif eventType == EventType_Destroy
		UnregisterForRemoteEvent(Alias_Outpost, "OnWorkshopObjectRemoved")
	elseif eventType == EventType_Assign
;		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	elseif eventType == EventType_Unassign
;		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")
	elseif eventType == EventType_DestructionState
		UnregisterForRemoteEvent(Alias_Outpost, "OnObjectDestroyed")
	elseif eventType == EventType_PowerOn
		UnregisterForRemoteEvent(Alias_Outpost, "OnOutpostItemPowerOn")
	elseif eventType == EventType_EnterMenu
		;UnregisterForCustomEvent(WorkshopParent, "WorkshopEnterMenu")
	elseif eventType == EventType_OutputLink
		UnregisterForRemoteEvent(Alias_Outpost, "OnWorkshopOutputLink")
	elseif eventType == EventType_EnterBeaconPlacement
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnEnterOutpostBeaconMode")
	elseif eventType == EventType_PowerOff
		UnregisterForRemoteEvent(Alias_Outpost, "OnOutpostItemPowerOff")
	endif
endFunction

function ClearAllOutpostAliases()
	Alias_Outpost.Clear()
	Alias_PowerRequiredObject.Clear()
	Alias_SourceObject.Clear()
	Alias_TargetObject.Clear()
EndFunction


function TestDisplay()
	int i = 0
	while i < TutorialSteps.Length
		WorkshopTutorialStep theStep = TutorialSteps[i]
		Trace(self, "Step " + i + ": " + theStep)
		i += 1
	endWhile

	i = 0
	while i < Tutorials.Length
		WorkshopTutorial theTutorial = Tutorials[i]
		Trace(self, "Tutorial " + i + ": " + theTutorial)
		i += 1
	endWhile

endFunction

function TestMiscObjective()
	debugAllowMiscObjective = true
endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    ;debug.Trace(self + " " + asTextToPrint)

    ;ALSO OUTPUT TO THE OutpostTutorial log
    debug.TraceLog(CallingObject, asTextToPrint, "OutpostTutorial")
endFunction

