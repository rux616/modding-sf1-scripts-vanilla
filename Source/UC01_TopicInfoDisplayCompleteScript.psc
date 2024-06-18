Scriptname UC01_TopicInfoDisplayCompleteScript extends TopicInfo

Quest Property UC01 Mandatory Const Auto

int Property PrereqStage = 200 Auto Const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    if UC01.IsRunning() && UC01.GetStageDone(PrereqStage)
        (UC01 as UC01QuestScript).DisplaySceneComplete(akSpeakerRef)
    endif
EndEvent