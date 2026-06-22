Scriptname SFBGS00D:MuriaRecruitStart extends ReferenceAlias

Quest Property DialogueUCNewAtlantis Auto Const Mandatory

int Property StageToCheck Auto Const Mandatory

Auto State Waiting
	Event OnLoad()
		if DialogueUCNewAtlantis.GetStageDone(StageToCheck)
			GetOwningQuest().SetStage(2)
			goToState("Done")
		endif
	endEvent
endState

State Done
endState

