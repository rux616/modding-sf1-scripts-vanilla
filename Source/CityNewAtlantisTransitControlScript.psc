Scriptname CityNewAtlantisTransitControlScript extends Quest

Group Autofill
    ActorValue Property FastTravelOverEncumbered Mandatory Const Auto
    {0 = don't allow fast travel when Over Encumbered, any other value = allow it}
EndGroup

Function Travel(ObjectReference DestinationRef)
    Actor playerRef = Game.GetPlayer()

    playerRef.SetValue(FastTravelOverEncumbered, 1)
CityNewAtlantisTransitScene.Stop()
    Game.FastTravel(DestinationRef)
    playerRef.SetValue(FastTravelOverEncumbered, 0)
EndFunction
Scene Property CityNewAtlantisTransitScene Auto Const Mandatory
