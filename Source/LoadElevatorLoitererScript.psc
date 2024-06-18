Scriptname LoadElevatorLoitererScript extends ObjectReference

GlobalVariable property LoadElevatorLoiteringLimitSeconds auto const

ActorEntryData[] actorsInManagerRoom

Struct ActorEntryData
    Actor actorRef
    float entryTime
EndStruct

Event OnLoad()
    actorsInManagerRoom = new ActorEntryData[0]
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef is Actor)
        ActorEntryData data = new ActorEntryData
        data.actorRef = akActionRef as Actor
        data.entryTime = Utility.GetCurrentRealTime()

        actorsInManagerRoom.Add(data)

        StartTimer(LoadElevatorLoiteringLimitSeconds.Value)
    endIf
EndEvent

Event OnTimer(int aiTimerID)
    ObjectReference loadEelevatorManagerRef = GetLinkedRef()
    if(loadEelevatorManagerRef != NONE && loadEelevatorManagerRef is LoadElevatorManagerScript)
        LoadElevatorManagerScript loadElevatorManager = loadEelevatorManagerRef as LoadElevatorManagerScript
        float currentTime = Utility.GetCurrentRealTime()

        int i = actorsInManagerRoom.length - 1
        while(i >= 0)
            ActorEntryData data = actorsInManagerRoom[i]

            bool inTrigger = self.IsInTrigger(data.actorRef)
            float durationInTrigger = currentTime - data.entryTime

            if(inTrigger)
                if(durationInTrigger >= LoadElevatorLoiteringLimitSeconds.value)
                    loadElevatorManager.TravelToRandomFloor(data.actorRef)
                    actorsInManagerRoom.Remove(i)
                endIf
            else
                actorsInManagerRoom.Remove(i)
            endIf

            i =- 1
        endWhile
    endIf
EndEvent