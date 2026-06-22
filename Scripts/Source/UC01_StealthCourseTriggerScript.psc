Scriptname UC01_StealthCourseTriggerScript extends ObjectReference

Quest Property UC01 Mandatory Const Auto
{Quest object that manages this stage}

int Property ShutdownStage = 400 Const Auto
{Once this stage is set on UC01, shut it all down}

Faction Property UC01_SectorBEnemyFaction Mandatory Const Auto
{Faction to apply to the player if they're in the trigger}

int iTriggerCount

Event OnTriggerEnter(ObjectReference akActionRef)
    if !UC01.GetStageDone(ShutdownStage)
        AdjustTriggerCount()
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if !UC01.GetStageDone(ShutdownStage)
        AdjustTriggerCount(false)
    endif
EndEvent

bool bProcessing
Function AdjustTriggerCount(bool bAdd = true)
 while bProcessing
    Utility.Wait(0.5)
 endwhile
    bProcessing = true
    Actor PlayerACT = Game.GetPlayer()

    if bAdd
        iTriggerCount += 1
        if iTriggerCount == 1
            PlayerACT.AddToFaction(UC01_SectorBEnemyFaction)
        endif
    else
        iTriggerCount -= 1
        if iTriggerCount == 0
            PlayerACT.RemoveFromFaction(UC01_SectorBEnemyFaction)
        endif
    endif
    bProcessing = false
EndFunction