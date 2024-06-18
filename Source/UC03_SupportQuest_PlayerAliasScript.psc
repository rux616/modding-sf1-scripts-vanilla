Scriptname UC03_SupportQuest_PlayerAliasScript extends ReferenceAlias

int Property StageToSet = 200 Const Auto
{Stage to set once the player has visited another location}

Location Property LC028RedDevilMinesLocation Mandatory Const Auto
{Location obejct for the Deep Mines}

GlobalVariable Property UC03_PlayerKilledSpacerBoss Mandatory Const Auto
{Global used to track if the player has killed the spacer boss here}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if !GetOwningQuest().GetStageDone(StageToSet) && UC03_PlayerKilledSpacerBoss.GetValue() >= 1 && akNewLoc != LC028RedDevilMinesLocation
        GetOwningQuest().SetStage(StageToSet)
    endif
EndEvent