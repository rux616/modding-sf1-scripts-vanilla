Scriptname DialogueCydoniaHurstAliasScript extends ReferenceAlias
{Used when the player has turned in evidence against Hurst to make him disable the next time they leave}

Int Property StagePrereq = 510 Const Auto
Int Property RedTapeStagePrereq = 900 Const Auto
Quest Property City_CY_RedTape02 Mandatory Const Auto
GlobalVariable Property CY_HurstGone Mandatory Const Auto

Event OnLoad()
    If GetOwningQuest().GetStageDone(StagePrereq) && City_CY_RedTape02.GetStageDone(RedTapeStagePrereq)
        GetRef().Disable()
        CY_HurstGone.SetValue(1)
    EndIf
EndEvent