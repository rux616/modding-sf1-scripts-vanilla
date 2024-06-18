Scriptname RAD04QuestScript extends Quest

Int Property EndQuestStage = 1000 Const Auto
MissionParentScript Property MissionParent Auto Const Mandatory

Event OnQuestInit()
    Actor myPlayer = Game.GetPlayer()
    RegisterForCustomEvent(MissionParent, "MissionAccepted")
EndEvent

;When the MissionQuestscript used for Mission Board Quests sends an event saying the player has accepted the mission, it will set the stage to complete the objective and end the quest.
Event MissionParentScript.MissionAccepted(MissionParentScript akSender, Var[] akArgs)
    MissionQuestScript acceptedQuest = akArgs[0] as MissionQuestScript
    ;MissionType == 0 for Bounty, 9 for Destroy (Bounty in Space)
    If acceptedQuest && (acceptedQuest.MissionType == 0 || acceptedQuest.MissionType == 9)
        UnregisterForCustomEvent(MissionParent, "MissionAccepted")
        SetStage(EndQuestStage)
    EndIf
EndEvent