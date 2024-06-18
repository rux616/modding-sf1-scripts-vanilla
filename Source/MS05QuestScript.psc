Scriptname MS05QuestScript extends Quest

Int Property CompleteBountyStage = 510 Const Auto
Int Property CompletePassengerStage = 520 Const Auto
MissionParentScript Property MissionParent Auto Const Mandatory


Function StartMissions()
    Actor myPlayer = Game.GetPlayer()
    RegisterForCustomEvent(MissionParent, "MissionCompleted")
EndFunction


Function MissionsCompleted()
    UnregisterForCustomEvent(MissionParent, "MissionCompleted")
EndFunction




;When the MissionQuestscript used for Mission Board Quests sends an event saying the player has completed the mission, it will set the stage to complete the objective and end the quest.
Event MissionParentScript.MissionCompleted(MissionParentScript akSender, Var[] akArgs)
    MissionQuestScript completedQuest = akArgs[0] as MissionQuestScript
    bool missionFailed = akArgs[1] as bool
    ;MissionType == 1 for Cargo, 9 for Space Bounty
    If missionFailed == false
        if completedQuest && completedQuest.MissionType == 2
            SetStage(CompletePassengerStage)
        ElseIf completedQuest && completedQuest.MissionType == 9
            SetStage(CompleteBountyStage)
        EndIf
    endif
EndEvent

