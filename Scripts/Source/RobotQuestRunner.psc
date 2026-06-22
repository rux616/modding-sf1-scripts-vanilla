scriptName RobotQuestRunner extends Actor

import Game
import Quest
import Debug
import ObjectReference
import InputEnableLayer

; Constants

int WaitDuration = 1 ;Seconds, how long to wait between ticks
int MaxQuestsToComplete = 1
int FailedInteractionThreshold = 10 ;how many times an interaction attempt can fail before it's considered a fatal error

; Gameplay Bot state enum values
; These values are pulled from GameplayAutoBot.h in the StateType enum
int IdleState = 0
int PathingState = 1
int DialogueState = 2
int CombatState = 3
int InteractState = 4
int MenuState = 5

;distance references:
;fActivatePickLength = 2.4
;fLargeActivatePickLength_G = 7.144
;f3rdPersonCameraPickBoost = 0.286

float AcceptableDistance = 2.3 ;meters
float AcceptableDistanceSpace = 100.0 ;meters

; Variables

Quest CurrentQuest = None
ObjectReference CurrentTarget = None
ObjectReference CombatTarget = None
InputEnableLayer DisableForTesting = None
bool TestSuccessful = false
bool TestPaused = false
int QuestsComplete = 0

; The quest running robot is a state machine that has these transitions:
; Idle - State we start in or when the test is inactive.
;   -> SelectingQuest - Once the test is started
; SelectingQuest - Finds a quest to run.  If one is not active, starts a timer to see if there is an active quest for the robot to run.
;   -> ActiveCombat - We are engaged in combat.  Let the combat system take over.
;   -> FindTarget - Once it finds a quest, stored in CurrentQuest
; FindTarget - Searches for target for the current quest.  If one is not found, starts a timer to occasionally check for targets
;   -> ActiveCombat - We are engaged in combat.  Let the combat system take over.
;   -> SelectingQuest - If the current quest is no longer valid (completed, failed)
;   -> PathToTarget - Once it find a target for the quest, start pathing to it.
; PlayerInDialogue - If we get into dialog with someone, this state will help us get through dialogue\
;   -> ActiveCombat - We are engaged in combat.  Let the combat system take over.
;   -> SelectingQuest - If the current quest is no longer valid (completed, failed)
;   -> FindTarget - If the target is no longer valid but the quest is, attempt to find a new target.
; PlayerInMessageBox - If we get into a messagebox (such as train transit destination) this state will handle choosing an option.
;   -> ActiveCombat - We are engaged in combat.  Let the combat system take over.
;   -> SelectingQuest - resume the quest once the messagebox is handled
; TestCompleted - Mark that the test is completed.
; Inert - A save created with this script was loaded by a normal human, make the script revert bot settings and go "inert"

state Idle
	Event OnBeginState(string asOldState)
		Debug.Trace(Self + " OnBeginState")
	EndEvent
	
	Event OnEndState(string asNewState)
	endEvent
endState

int MaxTimeBeforeFailureSelectingQuest = 150;seconds = 2.5 min
int CurrentTimePassedSelectingQuest = 0
state SelectingQuest
	Event OnBeginState(string asOldState)
		DebugTraceAndLogProgress("Selecting a Quest!")
		CurrentTimePassedSelectingQuest = 0
	EndEvent

	Function UpdateState()
		if(CurrentQuest != None && CurrentQuest.IsCompleted())
			Debug.AutomatedTestLogProgress("Quest completed!")
			QuestsComplete += 1

			if(QuestsComplete >= MaxQuestsToComplete)
				Debug.AutomatedTestLogProgress("Completed " + QuestsComplete + " quests, test successful")
				SucceedAutomatedTest()
				return
			endif

			;clear the completed quest
			CurrentQuest = None
		endif

		if(CurrentQuest == None)
			CurrentQuest = SelectQuest()
		endif
		; If we found the quest, great!  Now we can transition.  Else, we just wait for our next update
		if ( CurrentQuest != None )
			GotoState("SelectingTarget")
		Else
			CurrentTimePassedSelectingQuest = CurrentTimePassedSelectingQuest + WaitDuration
			if ( CurrentTimePassedSelectingQuest > MaxTimeBeforeFailureSelectingQuest )
				FailAutomatedTest()
			else
				Debug.AutomatedTestLogProgress("Still looking for a quest!")
			endif
		endif
	EndFunction

	Event OnEndState(string asNewState)
	EndEvent
endState

int MaxTimeBeforeKillAllSelectingTarget = 180;seconds = 3 min
int MaxTimeBeforeFailureSelectingTarget = 300;seconds = 5 min
int CurrentTimePassedSelectingTarget = 0
; Will need to add checks for the quest in the appropriate places to see if we need to find a new quest.
state SelectingTarget
	Event OnBeginState(string asOldState)
		DebugTraceAndLogProgress("Valid Quest: " + CurrentQuest + " Selecting Target!")
		CurrentTimePassedSelectingTarget = 0
	EndEvent

	Function UpdateState()
		ObjectReference prospectiveTarget = SelectQuestTarget( CurrentQuest )
		; If we found the quest, great!  Now we can transition.  Else, we just wait for our next update
		if ( prospectiveTarget != None )
			SpaceshipReference playerSpaceship = GetCurrentShipRef()
			bool inCombatWithPlayer = false

			Actor targetActor = prospectiveTarget as Actor
			SpaceshipReference targetShip = prospectiveTarget As SpaceshipReference
			if ( targetActor != None )
				Actor[] combatTargets = targetActor.GetAllCombatTargets()
				int combatTargetIndex = 0
				while( combatTargetIndex < combatTargets.Length && !inCombatWithPlayer )
					inCombatWithPlayer = combatTargets[combatTargetIndex] == Self
					combatTargetIndex = combatTargetIndex + 1
				endwhile
			elseif ( targetShip != None )
				SpaceshipReference[] combatTargets = targetShip.GetAllCombatTargets()
				int combatTargetIndex = 0
				while( combatTargetIndex < combatTargets.Length && !inCombatWithPlayer )
					inCombatWithPlayer = combatTargets[combatTargetIndex] == playerSpaceship
					combatTargetIndex = combatTargetIndex + 1
				endWhile
			endif
			if ( inCombatWithPlayer )
				if( targetActor )
					CombatTarget = targetActor
				else
					CombatTarget = targetShip
				endif
				DebugTraceAndLogProgress("Requesting combat state from SelectingTarget")
				MakeGameplayBotRequest(CombatTarget, CombatState)
				GotoState("CodeControlled")

			elseif( prospectiveTarget == GetFurnitureUsing() )
				Keyword PilotSeatKeyword = Game.GetForm( 0x00005627 ) As Keyword
				if( prospectiveTarget.HasKeyword( PilotSeatKeyword ) )
					if( playerSpaceship )
						DebugTraceAndLogProgress(Self + " selected pilot seat we are already in, and we have spaceship, TAKING OFF")
						playerSpaceship.TakeOff()
					else
						DebugTraceAndLogError(Self + " error, sitting in selected target " + prospectiveTarget + " that was a pilot seat but we're not in a spaceship?")
					endif
				else
					DebugTraceAndLogProgress(Self + " targeting a furniture we are using. Do nothing")
				endif
			elseif(GetDistance(prospectiveTarget) < AcceptableDistance)
				CurrentTarget = prospectiveTarget
				DebugTraceAndLogProgress("Requesting interact state from SelectingTarget")
				MakeGameplayBotRequest(CurrentTarget, InteractState)
				GotoState("CodeControlled")
			else
				CurrentTarget = prospectiveTarget
				DebugTraceAndLogProgress("Requesting path state to " +  CurrentTarget + "from SelectingTarget")
				MakeGameplayBotRequest(CurrentTarget, PathingState)
				GotoState("CodeControlled")
			endif
		else 
			; If we don't have a current target, see if anything is trying to fight us and let's go get it.
			; note this will (probably) fail for space combat because SelectCombatTarget will not function in spaceships
			CombatTarget = SelectCombatTarget()
			if ( CombatTarget != None )
				DebugTraceAndLogProgress("Requesting combat state from SelectingTarget")
				MakeGameplayBotRequest(CombatTarget, CombatState)
				GotoState("CodeControlled")
			Else
				CurrentTimePassedSelectingTarget = CurrentTimePassedSelectingTarget + WaitDuration
				if ( CurrentTimePassedSelectingTarget > MaxTimeBeforeFailureSelectingTarget )
					FailAutomatedTest()
				elseif ( CurrentTimePassedSelectingTarget > MaxTimeBeforeKillAllSelectingTarget )
					RoboKillAllHostile()
				else
					Debug.AutomatedTestLogProgress("Still looking for target")
				endif
			endif
		endif
	EndFunction

	Event OnEndState(string asNewState)
	EndEvent
endState

; Constants for PlayerInDialogue substates
int Property Dialogue_Substate_Exit = 0 AutoReadOnly
int Property Dialogue_Substate_Skip = 1 AutoReadOnly
int Property Dialogue_Substate_MAX = 2 AutoReadOnly
int MaxTimeBeforeDialogFailure = 240 ;seconds = 4 min

; Variables for PlayerInDialogue
int CurrentTimePassedInDialog = 0
int DialogueStateIterator = 0
state PlayerInDialogue
	Event OnBeginState(string asOldState)
		Debug.Trace(Self +" beginning dialogue state")
		CurrentTimePassedInDialog = 0
		DialogueStateIterator = Dialogue_Substate_Exit
	EndEvent

	Function UpdateState()
		if( CurrentTimePassedInDialog > MaxTimeBeforeDialogFailure )
			DebugTraceAndLogError("Player was stuck in dialog for " + CurrentTimePassedInDialog + " seconds, failing test")
			FailAutomatedTest()
		else
			CurrentTimePassedInDialog = CurrentTimePassedInDialog + WaitDuration
			Debug.Trace(Self + " has been in dialog for " + CurrentTimePassedInDialog + " seconds")
			bool IsPlayerInDialogue = Game.IsPlayerInDialogue()
			if ( IsPlayerInDialogue )
				Actor dialogueActor = Self.GetActorInDialogueWithRobot()
				DebugTraceAndLogProgress("In dialogue with " + dialogueActor)
			
				; Check the actor in dialogue with the player is valid to speak to
				if(dialogueActor != None && Self.GetParentCell() != dialogueActor.GetParentCell())
					Debug.AutomatedTestLogError(dialogueActor + " is in " + dialogueActor.GetParentCell() + " and the player is in " + Self.GetParentCell())
					FailAutomatedTest()
				EndIf

				int[] topics = Game.GetPlayerActiveDialogueUnsaidInfo()

				int choiceIndex = -1
				int topicIndex = 0
				;pick the first choice that hasn't been said before
				while(choiceIndex == -1 && topicIndex < topics.Length)
					if(topics[topicIndex] > 0)
						choiceIndex = topicIndex
					endif
					topicIndex += 1
				endWhile
			
				if(choiceIndex != -1)
					Debug.AutomatedTestLogProgress("Requesting dialog option " + choiceIndex)
					Game.RequestDialogueSelect(choiceIndex)
				elseif(DialogueStateIterator == Dialogue_Substate_Exit)
					Debug.AutomatedTestLogProgress("Requesting dialog exit")
					Game.RequestDialogueExit()
				elseif(DialogueStateIterator == Dialogue_Substate_Skip)
					Debug.AutomatedTestLogProgress("Trying to skip dialogue")
					Game.RequestDialogueSkip()
				EndIf

				;try the next state next time if we're still in dialogue
				DialogueStateIterator = (DialogueStateIterator + 1) % Dialogue_Substate_MAX
			else
				SaveAndCheckTransitionToNewQuestOrTarget()
			EndIf ;Otherwise we're waiting for dialog to exit.
		EndIf
	EndFunction

	Event OnEndState(string asNewState)
		Debug.Trace(Self + " ending of dialogue state")
	EndEvent
endState

state PlayerInMessageBox
	Event OnBeginState(string asOldState)
	EndEvent

	Function UpdateState()
		if ( Game.IsPlayerInMessageBox() )
			Debug.AutomatedTestLogProgress("Attempting to select a messagebox option")
			;hardcoded to 1 at the moment, as that is the correct selection for the transit train (Mast)
			;we currently have no way to dynamically find the correct choice
			Game.RequestMessageBoxSelect(1)
		else
			CheckTransitionToNewQuestOrTarget()
		EndIf
	EndFunction

	Event OnEndState(string asNewState)
	EndEvent
endState


state TestCompleted
	Event OnBeginState(string asOldState)
		ResetPlayerStateFromRobotTest()
	EndEvent
	bool Function StateRequestsFinish()
		return true
	endFunction
endState

state Inert
	Event OnBeginState(string asOldState)
		ResetPlayerStateFromRobotTest()
	EndEvent
	bool Function StateRequestsFinish()
		return !TestPaused
	endFunction
endState

state CodeControlled
	Event OnBeginState(string asOldState)
		DebugTraceAndLogProgress("Moving to code controlled state from " + asOldState)	
	EndEvent

	bool Function StateRequestsFinish()
		return false
	EndFunction
endState

;; end states

;; begin functions
bool Function IsValidState(string asState)
	if(asState == "none")
		return false
	elseif(asState != "PlayerInDialogue" || asState != "PlayerInMessageBox" || asState != "Inert" || asState != "TestCompleted" || asState !="SelectingTarget" || asState !="SelectingQuest")
		return false
	Else
		return true
	endif
EndFunction

; Makes a request to the code gameplay bot and checks the script's state
Function MakeGameplayBotRequest(ObjectReference Target, int aiState)
	; Only make the request if we aren't in code controlled state. Otherwise, we may unintentionally interrupt a state that was just started
	if(GetState() != "CodeControlled")
		Game.RequestGameplayBotState(Target, aiState)
	EndIf
EndFunction

Function RequestToggleCodeControl(bool abCodeWantsControl, string NewState = "none")
	string currentState = GetState()
	if(currentState == "CodeControlled" && !abCodeWantsControl)
		DebugTraceAndLogProgress("Received request to return to script control.")
		if(Game.IsPlayerInDialogue())
			GotoState("PlayerInDialogue")
		elseif(Game.IsPlayerInMessageBox())
			GotoState("PlayerInMessageBox")
		elseif(IsValidQuestTarget( CurrentQuest, CurrentTarget ) && IsValidState(NewState))
			GoToState(NewState)
		Else
			; No valid state was provided or the target is invalid, so check the transition to a new quest or target
			if(IsValidQuestTarget(CurrentQuest, CurrentTarget))
				if(!IsBestInteractionTarget())
					GotoState("SelectingTarget")
				Elseif(GetDistance(CurrentTarget) < AcceptableDistance)
					DebugTraceAndLogProgress("Requesting interact with "+ CurrentTarget + " after receiving code control request " + abCodeWantsControl)
					Game.RequestGameplayBotState(CurrentTarget, InteractState)
				Else
					DebugTraceAndLogProgress("Requesting a path to " + CurrentTarget + " after receiving code control request " + abCodeWantsControl)
					Game.RequestGameplayBotState(CurrentTarget, PathingState) ; Request a path to the target
				EndIf
			Else
				CheckTransitionToNewQuestOrTarget()
			EndIf
		EndIf
	; If the code wants control and we aren't already in codecontrolled state, go to that state
	Elseif(currentState != "CodeControlled" && abCodeWantsControl)
		GotoState("CodeControlled")
	EndIf

EndFunction

string lastState = "none"
; Function called from robot test script.
Function StartTest()
	;If we're reaching here and already in combat, the AI needs a cleanup and reboot of combat.
	;TODO GEN-339020: need to test if this is going to work for loading a save made during spaceship combat
	Actor currentCombatTarget = None
	if ( IsInCombat() )
		currentCombatTarget = GetCombatTarget()
		StopCombat()
	endif
	
	SetupPlayerForRobotTest()
	TestSuccessful = true

	if ( currentCombatTarget != None )
		StartCombat(currentCombatTarget)
		CombatTarget = currentCombatTarget
		Game.RequestGameplayBotState(CombatTarget, CombatState)
		GotoState("CodeControlled")
	Else
		GotoState("SelectingQuest")
	endif

	while( !StateRequestsFinish() )
		string currentState = GetState()
		
		if(currentState != lastState)
			Debug.AutomatedTestLogProgress("Changed to state " + currentState)
			lastState = currentState
		endif
		if (!TestPaused && GetState() != "CodeControlled") ; when under code control, let the code break out before starting the script state
			if (Game.IsPlayerInDialogue() && GetState() != "PlayerInDialogue")
				GotoState("PlayerInDialogue")
			endif
			if (Game.IsPlayerInMessageBox() && GetState() != "PlayerInMessageBox")
				GotoState("PlayerInMessageBox")
			endif
		endif
		UpdateState()
		Utility.WaitMenuPause(WaitDuration)
	EndWhile
	Game.GameplayAutomatedTestComplete(TestSuccessful)
endFunction

Quest Function SelectQuest()
	Quest[] activeQuestList = Game.GetPlayerActiveQuests()
	Quest selectedQuest = None
	if ( activeQuestList.Length > 0 )
		;Right now don't have a better way to select a quest than to just select the first one, so do that now.activeQuestList
		selectedQuest = activeQuestList[0]
	endif
	return selectedQuest
EndFunction

int previousTarget = 0
int previousStage = -1
ObjectReference Function SelectQuestTarget( Quest aQuest )
	ObjectReference returnTarget = None
	if ( aQuest != None )
		int currStage = aQuest.GetStage()
		int target = 0
		
		ObjectReference[] targets = aQuest.GetCurrentStageTargets()

		if(previousStage != currStage)
			previousStage = currStage
		elseif(targets.Length > 1)
			target = previousTarget + 1
			; If we've already gone through all the targets, start from 0 again
			if(target > targets.Length)
				target = 0
			EndIf
		EndIf

		if ( targets.Length > 0 )
			; Select an appropriate target.
			returnTarget = targets[target]
		endif

		previousTarget = target
	endif
	return returnTarget
EndFunction 

bool Function IsBestInteractionTarget ()
	bool isBest = true
	if(CurrentQuest != None)
		ObjectReference[] targets = CurrentQuest.GetCurrentStageTargets()
		isBest = (targets.Length == 1) 
	EndIf
	return isBest
EndFunction

Actor Function SelectCombatTarget()
	Actor returnTarget = None
	; intended for use for on-foot combat, space combat autopilot acquires targets on its own
	Actor player = Game.GetPlayer()
	Actor[] allActors = player.GetCurrentLocation().GetActors()
		
	float closestDistance = -1.0
	int actorToTest = 0
	while ( actorToTest < allActors.Length )
		if(!allActors[actorToTest].IsDead() && !allActors[actorToTest].IsUnconscious() && allActors[actorToTest].IsHostileToActor(player))
			float checkDistance = GetDistance(allActors[actorToTest])
			if ( closestDistance < 0.0 || checkDistance < closestDistance )
				closestDistance = checkDistance
				returnTarget = allActors[actorToTest]
			endif
		endif
		actorToTest = actorToTest + 1
	EndWhile
	
	if(returnTarget != None)
		Debug.AutomatedTestLogProgress("Combat Targeting: " + returnTarget)
	else
		Debug.AutomatedTestLogProgress("No combat target found")
	endif
	
	return returnTarget
EndFunction

bool Function IsValidQuestTarget( Quest aQuest, ObjectReference aQuestTarget )
	bool returnValue = false
	if ( aQuest != None && aQuestTarget != None )
		ObjectReference[] targets = aQuest.GetCurrentStageTargets()
		int targetToTest = 0
		while( targetToTest < targets.Length && !returnValue )
			returnValue = targets[targetToTest] == aQuestTarget
			targetToTest = targetToTest + 1
		EndWhile
	endif
	return returnValue
EndFunction

Function MakeQuestNameSave(string asStringToInsertToName = "")
	string questName = "NoQuest"
	int questStage = 0
	if ( CurrentQuest != None )
		questName = CurrentQuest.GetFormEditorID()
		questStage = CurrentQuest.GetStage()
	endif
	string saveName = "RobotTest" + asStringToInsertToName + "_" + questName + "_" + questStage
	Game.RequestSaveByName(saveName)
EndFunction

Function CheckTransitionToNewQuestOrTarget()
	if ( GetState() != "Inert" )
		if ( CurrentQuest == None || CurrentQuest.IsCompleted() )
			GotoState("SelectingQuest")
		Else ; we have a quest and it's not complete, find a target
			CurrentTarget = None
			GotoState("SelectingTarget")
		EndIf
	EndIf
endFunction

Function SaveAndCheckTransitionToNewQuestOrTarget()
	if ( GetState() != "Inert" )
		MakeQuestNameSave()
		CheckTransitionToNewQuestOrTarget()
	EndIf
endFunction

Function SucceedAutomatedTest()
	Game.RequestSaveByName("RobotTest_success")
	TestSuccessful = true
	GotoState( "TestCompleted" )
EndFunction


Function FailAutomatedTest()
	Game.RequestSaveByName("RobotTest_failure")
	TestSuccessful = false
	GotoState( "TestCompleted" )
EndFunction

; Handled Events

Event OnInit()
	Utility.SetINIBool( "bDisableAutoVanityMode:Camera", 1 )
	Utility.SetINIBool( "bAlwaysActive:General", 1 )
	ActorValue playerConfidence = Game.GetForm( 0x2bd ) as ActorValue
	if ( playerConfidence != None )
		SetValue( playerConfidence, 4 )
	endif
	GotoState("Idle")
EndEvent

Event OnPlayerLoadGame()
	;TODO GEN-339020: Need to update this for loading saves made in space combat when that is possible
	if( !Game.IsAutomatedTestControllingPlayerInProgress() )
		;The AI robot has some special combat logic, try and clean it up before going inert.
		if ( IsInCombat() )
			StopCombat()
		endif
		TestPaused = false
		GotoState("Inert")
	Else ;don't know what we can trust right now, go back to searching
		CheckTransitionToNewQuestOrTarget()
	endif
endEvent

;Utility functions

Function DebugTraceAndLogError( string asTextToPrint ) debugOnly
	Debug.AutomatedTestLogError( asTextToPrint )
	Debug.Trace(Self + " " + asTextToPrint)
EndFunction

Function DebugTraceAndLogProgress( string asTextToPrint ) debugOnly
	Debug.AutomatedTestLogProgress( asTextToPrint )
	Debug.Trace(Self + " " + asTextToPrint)
EndFunction

Function TogglePauseTest()
	if( TestPaused )
		Debug.AutomatedTestLogDebug( "Resuming robot test." )
		SetupPlayerForRobotTest()
		TestPaused = false
		if ( CurrentQuest == None || CurrentQuest.IsCompleted() )
			GotoState("SelectingQuest")
		Else ; we have a quest and it's not complete, find a target
			CurrentTarget = None
			GotoState("SelectingTarget")
		EndIf
	Else
		Debug.AutomatedTestLogDebug( "Pausing robot test." )
		ResetPlayerStateFromRobotTest()
		Debug.SetGodMode(true)
		TestPaused = true
		GoToState("Inert")
	endif
EndFunction

Function SetupPlayerForRobotTest()
	if ( DisableForTesting == None )
		DisableForTesting = InputEnableLayer.Create()
		DisableForTesting.DisablePlayerControls( false, true, true, false, true, false, false, true, true, true, false )
	endif
EndFunction

Function ResetPlayerStateFromRobotTest()
	DisableForTesting = None
EndFunction

bool Function StateRequestsFinish()
  return false
EndFunction

Function UpdateState()
	;Do nothing, this is just a place holder
EndFunction

Function RoboKillAllHostile()
	DebugTraceAndLogError("Resorting to killing all hostiles")

	;actors
	Actor player = Game.GetPlayer()
	Actor[] allCombatTargetActors = player.GetAllCombatTargets()
	
	int actorToTest = 0
	while ( actorToTest < allCombatTargetActors.Length )
		if(!allCombatTargetActors[actorToTest].IsDead() && !allCombatTargetActors[actorToTest].IsUnconscious())
			DebugTraceAndLogError("Killing " + allCombatTargetActors[actorToTest])
			allCombatTargetActors[actorToTest].Kill()
		endif
		actorToTest = actorToTest + 1
	EndWhile

	;ships
	SpaceshipReference playerSpaceship = GetCurrentShipRef()
	SpaceshipReference[] allCombatTargetShips = playerSpaceship.GetAllCombatTargets()

	int shipToTest = 0
	while( shipToTest < allCombatTargetShips.Length )
		DebugTraceAndLogError("Killing " + allCombatTargetShips[actorToTest])
		allCombatTargetShips[shipToTest].Kill()
		shipToTest = shipToTest + 1
	EndWhile
EndFunction
