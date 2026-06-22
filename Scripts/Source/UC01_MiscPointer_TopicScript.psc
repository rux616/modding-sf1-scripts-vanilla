Scriptname UC01_MiscPointer_TopicScript extends TopicInfo

Quest Property UC01 Mandatory Const Auto
{Quest form for UC01}

Quest Property UC_Tuala_Misc Mandatory Const Auto
{Quest form for the UC01 misc quest}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    if !UC01.GetStageDone(100) && !UC_Tuala_Misc.GetStageDone(100)
        UC_Tuala_Misc.SetStage(100)
    endif
EndEvent
