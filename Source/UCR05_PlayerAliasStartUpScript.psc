Scriptname UCR05_PlayerAliasStartUpScript extends ReferenceAlias

Quest Property UCR05 Mandatory Const Auto

Location Property POI063SubsectionSevenLocation Mandatory Const Auto
{Subsection seven location. Used to know if we should start up or shut down UCR05}

GlobalVariable Property UCR05_Enabled Mandatory Const Auto
{Global used to manage if UCR05's been enabled by the end of UC09}

int Property QuietShutdownStage = 9000 Auto Const
{Stage to set to shut down UCR05 quietly}

int Property QuestActiveStage = 75 Auto Const
{When this stage is set, the quest has been accepted and will stay available for the player}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if UCR05_Enabled.GetValue() >= 1
        if akNewLoc == POI063SubsectionSevenLocation && !UCR05.IsRunning() && !UCR05.GetStageDone(QuietShutdownStage)
            UCR05.Start()
        ElseIf akOldLoc == POI063SubsectionSevenLocation && !UCR05.GetStageDone(QuestActiveStage)
            UCR05.SetStage(QuietShutdownStage)
        endif
    endif
EndEvent