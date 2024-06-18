Scriptname UC08_ContainerDoorRefScript extends ObjectReference Const

Quest Property UC08 Mandatory Const Auto
{Managing quest}

int Property StageToReenableActivation = 350 Auto Const
{Once this stage is set on UC08, it's okay for the doors to have activation again}

int Property DisableActivationStage = 1000 Auto Const
{If this stage is set, disable activation again}

Event OnLoad()
    if UC08.GetStageDone(DisableActivationStage) || !UC08.GetStageDone(StagetoReenableActivation)
        BlockActivation(true, true)
    endif
EndEvent