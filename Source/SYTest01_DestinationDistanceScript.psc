Scriptname SYTest01_DestinationDistanceScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Auto Const

Event OnAliasInit()
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	; Check the various checkpoints for things to happen as you get closer to your destination
    if auiStageID == 400
        Debug.Trace(self+" has detected stage 400 set")
        PlayerShip.RefillAlias()
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 21000)
    endif
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	; Run through the stages to get the evolving prototype test
    if GetOwningQuest().GetStageDone(440)
		GetOwningQuest().SetStage(460)
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 1000)
    elseif GetOwningQuest().GetStageDone(430)
		GetOwningQuest().SetStage(440)
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 1000)
    elseif GetOwningQuest().GetStageDone(420)
		GetOwningQuest().SetStage(430)
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 5000)
    elseif GetOwningQuest().GetStageDone(410)
		GetOwningQuest().SetStage(420)
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 8000)
    elseif GetOwningQuest().GetStageDone(400)
		GetOwningQuest().SetStage(410)
		RegisterForDistanceLessThanEvent(Self, PlayerShip, 14000)
	endif
EndEvent