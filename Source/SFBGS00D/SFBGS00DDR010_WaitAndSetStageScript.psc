Scriptname SFBGS00D:SFBGS00DDR010_WaitAndSetStageScript extends ObjectReference Const

; General variables needed to progress the quest when trigger is entered
Quest Property thisQuest Auto Const
Int Property StageToSet Auto Const
Int Property preReqStage Auto Const

; values needed for the random wait timer
Float Property minWaitTime Auto Const
Float Property maxWaitTime Auto Const

; Check this is if you want the above values to be used. Otherwise it will use nonRandomWaitTime value
Bool Property randomizedWait Auto Const
Float Property nonRandomWaitTime Auto Const

; The RefAlias that will be checked when TriggerEnter happens
ReferenceAlias Property AliasToCheck Auto Const


Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef == AliasToCheck.GetActorRef() && thisQuest.GetStage() == preReqStage)
        if randomizedWait
            Utility.Wait(Utility.RandomFloat(minWaitTime, maxWaitTime))
        else
            Utility.Wait(nonRandomWaitTime)
        endif
        thisQuest.SetStage(StageToSet)
    endif
EndEvent
