Scriptname UC01_PilotExamSeatScript extends ObjectReference Const

Quest Property UC01 Auto Const Mandatory
{Property for the UC01 quest}

int Property AccessStage = 410 Const Auto
{Once the player has completed this stage in UC01, they can access this }

Quest Property UC01_ShipSimulatorHelperQuest Mandatory Const Auto
{Helper quest that handles getting the player into the sim}

Scene Property  DialogueUCFaction_Recruitment_999_PilotSeat Mandatory Const Auto
{Scene to play if the player gets here early}

Event OnLoad()
    if !UC01.GetStageDone(AccessStage)
        BlockActivation(true, true)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if UC01.GetStageDone(410)
            Utility.Wait(0.5)
            UC01_ShipSimulatorHelperQuest.Start()
        else
            if !DialogueUCFaction_Recruitment_999_PilotSeat.IsPlaying()
                DialogueUCFaction_Recruitment_999_PilotSeat.Start()
            endif
        endif
    endif
EndEvent