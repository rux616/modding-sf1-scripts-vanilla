Scriptname BQ01_QuestScript extends Quest

Group Required
    ReferenceAlias property PlayerShip auto const mandatory
    ReferenceAlias Property MapMarker_Temple auto const mandatory
    LocationAlias property Location_Temple auto const mandatory
    LocationAlias property Location_TemplePlanet auto const mandatory
    Keyword Property MQTempleQuestActive auto const mandatory
    Keyword Property BQ01_Keyword_TempleLocation Mandatory Const Auto
    Quest Property MQ_TempleQuest_SpawnTemple auto const mandatory
    Quest Property StarbornTempleQuest Mandatory Const Auto
    InputEnableLayer Property BQ01_EnableLayer Auto
EndGroup 

Event OnQuestStarted()
    Location TemplePlanetLocation = Location_TemplePlanet.GetLocation().GetCurrentPlanet().GetLocation()
    Location TempleLocation = Location_Temple.GetLocation()
    TemplePlanetLocation.AddKeyword(MQTempleQuestActive)
    TempleLocation.AddKeyword(BQ01_Keyword_TempleLocation)
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
    akMapMarker.Enable()
    akMapMarker.AddtoMapScanned(True)
    akMapMarker.SetMarkerVisibleOnStarMap()
    akMapMarker.SetRequiresScanning(false)
    akMapMarker.EnableFastTravel()
EndFunction

; This is the public function called by the quest stage. It establishes the quest data. 
Function TempleDiscovered()
    ;if there is no Temple Location because we skipped landing at the Anomaly Site but discovered the planetary trait, then spawn a Temple
    ;MQ_TempleQuest_SpawnTemple.Start() ;when the OnQuestInit event fires, it will call the ForceSpawnTemple function in the respective quest
    ;RegisterForCustomEvent((MQ_TempleQuest_SpawnTemple as MQSpawnTempleScript), "TempleSpawnedEvent")

    SetMapMarkerFlags(MapMarker_Temple.GetRef())

    ;set the Temple as always Parellel Self (Sigma)
    Int iArtifactNumber = (StarbornTempleQuest as StarbornTempleQuestScript).FindSigmaArtifactBarrett()
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(iArtifactNumber, Location_Temple.GetLocation())
EndFunction