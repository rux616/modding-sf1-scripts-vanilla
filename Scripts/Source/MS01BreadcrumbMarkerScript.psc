Scriptname MS01BreadcrumbMarkerScript extends ReferenceAlias

Event OnAliasInit()
	Debug.Trace("MS01BreadcrumbMarkerScript: " + PrereqStage + " stage, " + DistanceToTrigger + "m, " + DistanceTargerAlias)

	if PrereqStage > 0
        ; If there is a pre-req stage - listen in on the event
        ; NOTE: This whole step is being done since once the distance check Event is triggered, it's consumed
		RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
	else
        ; If there isn't a pre-req - register for the disance check immediately
		RegisterForDistanceLessThanEvent(Self, DistanceTargerAlias, DistanceToTrigger)
	endif
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	;When the proper stage is set, register for the distance less than event
    if auiStageID == PrereqStage
		RegisterForDistanceLessThanEvent(Self, DistanceTargerAlias, DistanceToTrigger)
    	UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
    endif
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	Debug.Trace("MS01BreadcrumbMarkerScript: " + PrereqStage + " stage, " + DistanceToTrigger)
    ; If you get too close, then disable
    GetRef().Disable()
EndEvent

ReferenceAlias Property DistanceTargerAlias Auto Const
Int Property PrereqStage Auto Const
Float Property DistanceToTrigger Auto Const
