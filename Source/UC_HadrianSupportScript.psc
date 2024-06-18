Scriptname UC_HadrianSupportScript extends Actor

Group Optional_Properties
    bool Property TeleportAfterUC05 Const Auto
    {If true, teleport this NPC back to Mars after UC05}

    bool Property TeleportAfterUC08 Const Auto
    {If true, teleport this NPC back to Mars after UC08}

    bool Property TeleportAfterUC09 Const Auto
    {If true, teleport this NPC back to Mars after UC09}

    bool Property DisableOnECPickup Const Auto
    {If true, we'll disable this script once the NPC has been picked up via the EC system}

    bool Property SetStageOnRHQQuest Const Auto
    {When this NPC unloads post-UC09, should we set the stage on the RedDevilsHQ quest to set up the intro scene?}

    bool Property SetAVOnLoad = false Const Auto
    {If there's a custom AV you'd like set on this NPC on load, set to true}

    ActorValue Property AVToSet Const Auto
    {If you want to set an AV on this NPC on load, set that here}

    float Property NewValueToSet Const Auto
    {What AVToSet gets set to on load}

    ObjectReference Property UC09SecondayTeleportDestination Const Auto
    {Marker to which we'll move Hadrian after UC09 if a marker is added to this}    
EndGroup

Group Required_Properties
    ObjectReference Property TeleportDestination Mandatory Const Auto
    {Marker to which we'll move Hadrian once this stage is set}

    Cell Property POI064RedDevilHq01 Mandatory Const Auto
    {Destination cell for Hadrian's teleport}
EndGroup

Group Teleport_Data
    Quest Property UC05 Mandatory Const Auto
    {Quest to check for a Hadrian teleport}

    Quest Property UC08 Auto Const Mandatory
    {Quest to check for end-questline teleport}

    Quest Property UC09 Auto Const Mandatory
    {Quest to check for end-questline teleport}

    Quest Property DialogueRedDevilsHQ Mandatory Const Auto
    {Red Devils location quest}

    Quest Property CREW_EliteCrew_Hadrian Mandatory Const Auto
    {Used to check if Hadrian's been picked up as crew}

    int Property UC05TeleportPrereqStage = 985 Const Auto
    {Check to see if this stage is complete on UC05. If so, teleport Hadrian back to Mars as soon as she unloads}

    int Property PostUC05TeleportShutdownStage = 171 Const Auto
    {If this stage is stage on UC08, ignore trying to teleport Hadrian back to Mars.}

    int Property UC08TeleportPrereqStage = 1000 Auto Const
    {If this stage has been set on UC08, when Hadrian next unloads, teleport her to Mars}

    int Property PostUC08TeleportShutdownStage = 200 Auto Const
    {If this stage is stage on UC09, ignore trying to teleport Hadrian back to Mars.}

    int Property UC09TeleportPrereqStage = 500 Auto Const
    {If this stage has been set on UC09, when Hadrian next unloads, teleport her to Mars}

    int Property PostUC09TeleportShutdownStage = 50 Auto Const
    {If this stage is stage on Hadrian's EC behavior, turn this system off permanently.}

    int Property RHQStagetoSet = 500 Auto Const
    {Stage to set on the Red Devil's HQ quest when this NPC unloads post UC09 AND SetStageOnRHQQuest is true}
EndGroup

Event OnUnload()
    if GetParentCell() != POI064RedDevilHq01 
    
        if (!DisableOnECPickup || (DisableOnECPickup && !CREW_EliteCrew_Hadrian.GetStageDone(50)))

            if TeleportAfterUC05 && UC05.GetStageDone(UC05TeleportPrereqStage) && !UC08.GetStageDone(PostUC05TeleportShutdownStage)
                MoveTo(TeleportDestination)
            elseif TeleportAfterUC08 && UC08.GetStageDone(UC08TeleportPrereqStage) && !UC09.GetStageDone(PostUC08TeleportShutdownStage)
                MoveTo(TeleportDestination)
            elseif TeleportAfterUC09 && UC09.GetStageDone(UC09TeleportPrereqStage)
                if UC09SecondayTeleportDestination != none
                    MoveTo(UC09SecondayTeleportDestination)
                else
                    MoveTo(TeleportDestination)
                endif

                if SetStageOnRHQQuest
                    DialogueRedDevilsHQ.SetStage(RHQStagetoSet)
                endif
            endif
        endif
    endif
EndEvent

Event OnLoad()
    if SetAVOnLoad
        if GetValue(AVToSet) != NewValueToSet
            SetValue(AVToSet, NewValueToSet)
        endif
    endif
EndEvent