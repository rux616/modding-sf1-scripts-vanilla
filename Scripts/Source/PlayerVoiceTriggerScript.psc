ScriptName PlayerVoiceTriggerScript extends ObjectReference
{Handles all the Player Commentary Triggers}

Scene Property ScenetoStart Auto

Int Property TriggerType = 0 Auto
{0 = OnTriggerEnter, 1 = OnTriggerLeave}

Quest Property PrereqQuest Auto
{Optional: Quest on which to check Stages}

Int Property prereqStage = -1 Auto
{Optional: Stage that must be set to trigger scene}

Int Property maxStage = -1 Auto
{Optional: Stage that invalidates scene, shut down and disable trigger}

;/COMMENTING OUT FOR NOW
auto STATE waitingForPlayer
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer() && TriggerType == 0
			if (PrereqQuest == None || prereqStage == -1 || PrereqQuest.GetStageDone(prereqStage)) && (PrereqQuest == None || maxStage == -1 || PrereqQuest.GetStageDone(maxStage) == 0)
				;don't start the scene if we're in combat
				If Game.GetPlayer().GetCombatState() == 0
					debug.Trace(self + " has started scene " + SceneToStart)
					ScenetoStart.Start()
				EndIf
				gotoState("hasBeenTriggered")
				Disable()
				Delete()
			EndIf
		EndIf		
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer() && TriggerType == 1
			if (PrereqQuest == None || prereqStage == -1 || PrereqQuest.GetStageDone(prereqStage)) && (PrereqQuest == None || maxStage == -1 || PrereqQuest.GetStageDone(maxStage) == 0)
				;don't start the scene if we're in combat
				If Game.GetPlayer().GetCombatState() == 0
					debug.Trace(self + " has started scene " + SceneToStart)
					ScenetoStart.Start()
				EndIf
				gotoState("hasBeenTriggered")
				Disable()
				Delete()
			EndIf
		EndIf		
	EndEvent

	Event OnUnload()
		If (PrereqQuest != None && maxStage != -1 && PrereqQuest.GetStageDone(maxStage))
			gotoState("hasBeenTriggered")
			Disable()
			Delete()
		EndIf

	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

/;