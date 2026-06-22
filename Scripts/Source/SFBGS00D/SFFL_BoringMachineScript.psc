Scriptname SFBGS00D:SFFL_BoringMachineScript extends ReferenceAlias

Int Property StageInUse = 1010 Auto Const
Int Property StageFinishedWork = 1030 Auto Const

Event OnLoad()
	Quest pQuest = GetOwningQuest()
	if pQuest.GetStageDone(StageInUse) && !pQuest.GetStageDone(StageFinishedWork)
		GetRef().PlayAnimation("Stage1")
	else
		GetRef().PlayAnimation("Stage2")
	endif
EndEvent
