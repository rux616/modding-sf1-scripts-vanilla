Scriptname RAD03QuestScript extends Quest

Int Property EndQuestStage = 1000 Const Auto

MissionParentScript Property MissionParent Auto Const Mandatory

MissionQuestScript[] property CargoMissions auto const

MissionParentScript property MB_Parent auto const mandatory

LocationAlias property Alias_MissionBoardLoc auto const mandatory

Event OnQuestInit()
    Actor myPlayer = Game.GetPlayer()
    RegisterForCustomEvent(MissionParent, "MissionAccepted")
EndEvent

Event OnQuestStarted()
    if CheckForActiveCargoMissions()
        ; complete quest
        SetStage(EndQuestStage)
    else
        Location missionLoc = Alias_MissionBoardLoc.GetLocation()
        ; reset missions
        MB_Parent.ResetMissions(true, false, missionLoc, true)
    endif
EndEvent

bool Function CheckForActiveCargoMissions()
    bool foundActiveMission = false
    int i = 0
    while i < CargoMissions.Length && foundActiveMission == false
        MissionQuestScript theMission = CargoMissions[i]
        ; if player has an active cargo mission, complete quest
        if theMission.PlayerAcceptedQuest && theMission.PlayerCompletedQuest == false && theMission.PlayerFailedQuest == false
            foundActiveMission = true
        endif
        i += 1
    endWhile
    return foundActiveMission
EndFunction


;When the MissionQuestscript used for Mission Board Quests sends an event saying the player has accepted the mission, it will set the stage to complete the objective and end the quest.
Event MissionParentScript.MissionAccepted(MissionParentScript akSender, Var[] akArgs)
    MissionQuestScript acceptedQuest = akArgs[0] as MissionQuestScript
    ;MissionType == 0 for Bounty, 1 for Cargo
    If acceptedQuest && acceptedQuest.MissionType == 1
        UnregisterForCustomEvent(MissionParent, "MissionAccepted")
        SetStage(EndQuestStage)
    EndIf
EndEvent