Scriptname AliasSetStageOnActorValueChanged extends ReferenceAlias

ActorValue Property WatchedValue Auto Const Mandatory
{The actor value to watch for}

int Property AVThreshold Mandatory Const Auto
{When your actor value get BELOW this number, set the appropriate stage. So if you want it to fire when your AV is zero, set this to a number more than zero}

int Property StageToSet Const Mandatory Auto
{Stage to set when "ValueTarget" is reached on WatchedValue}

int Property PrereqStage = -1 Const Auto
{OPTIONAL: Don't start watching for this value until this stage is set}

int Property ShutdownStage = -1 Const Auto
{OPTIONAL: If this stage is set, you can clean up this registration}


Event OnAliasInit()
    ObjectReference currRef = GetRef()
    if currRef != none
        if ShutdownStage <= -1 || !GetOwningQuest().GetStageDone(ShutdownStage)
            if PrereqStage >= 0
                RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
            else
                AliasValueRegistration(currRef)
            endif
        endif

        if ShutdownStage > 0 && !GetOwningQuest().GetStageDone(ShutdownStage)
            RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        endif
    endif
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    if auiStageID == PrereqStage
        ObjectReference currRef = GetRef()

        if currRef != none
            AliasValueRegistration(currRef)
        endif
    elseif auiStageID == ShutdownStage
        ObjectReference currRef = GetRef()
        UnregisterForActorValueLessThanEvent(currRef, WatchedValue, AVThreshold)
    endif
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Quest OQ = GetOwningQuest()
    ObjectReference currRef = GetRef()
    bool passedThreshold = false
    if (OQ.GetStageDone(PrereqStage) || PrereqStage < 0) && (!OQ.GetStageDone(ShutdownStage) || ShutdownStage < 0)
        ; AVThreshold defined as integer, ceil AV float value to only consider threshold passed the value is at least a whole number less (main use case looking for 0 on a health AV, e.g. don't want to consider 0.1)
        int currentValue = Math.Ceiling(currRef.GetValue(WatchedValue))
        if akObjRef == currRef && akActorValue == WatchedValue && (currentValue < AVThreshold)
            passedThreshold = true
            OQ.SetStage(StageToSet)
        endif
    endif
    ; If we didn't pass the threshold due to ceiling, we need to re-register to get another callback
    if (!passedThreshold)
        AliasValueRegistration(akObjRef)
    endif
EndEvent

Function AliasValueRegistration(ObjectReference akTargetRef)
    if akTargetRef != none
        RegisterForActorValueLessThanEvent(akTargetRef, WatchedValue, AVThreshold)
    endif
endFunction





