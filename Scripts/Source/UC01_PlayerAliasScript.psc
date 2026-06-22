Scriptname UC01_PlayerAliasScript extends ReferenceAlias

int Property SitRegistrationStage = 500 Const Auto
{Once this stage is set, register the player for OnSit events}

ReferenceAlias Property PilotsExamChair Mandatory Const Auto
{The seat we're looking for to launch the player into space}

GlobalVariable Property UC01_ShipSim_PlayerEverPassedSequence Mandatory Const Auto 
{Global used to track if the player has successfully completed the Ship Sim sequence}

Location Property LC037VanguardCourseLocation Mandatory Const Auto
{Location to check for to complete the experience for the player}

int Property StagetoSet = 600 Auto Const
{Once the player's completed the sim sequence, set this stage}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if akNewLoc == LC037VanguardCourseLocation && UC01_ShipSim_PlayerEverPassedSequence.GetValue() >= 1.0 && !GetOwningQuest().GetStageDone(StageToSet) 
        GetOwningQuest().SetStage(StageToSet)
    endif
EndEvent