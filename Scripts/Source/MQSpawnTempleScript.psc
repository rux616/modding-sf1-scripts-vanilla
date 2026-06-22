Scriptname MQSpawnTempleScript extends Quest

CustomEvent TempleSpawnedEvent
LocationAlias Property TempleLocationPlaced Mandatory Const Auto
ReferenceAlias Property TemplePlacedMapMarker Mandatory Const Auto

Event OnQuestInit()
    ;when we intialize, send out a custom event for any scripts listening along with the Location spawned
    Var[] kargs = new Var[2]
    kargs[0] = TempleLocationPlaced.GetLocation()
    kargs[1] = TemplePlacedMapMarker.GetRef()
    SendCustomEvent("TempleSpawnedEvent", kargs)
    Stop()
    Reset()
EndEvent