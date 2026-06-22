Scriptname RI01PlayerAliasScript extends ReferenceAlias

Scene Property RI01_Radio_JobAdNeonScene Auto Const Mandatory
Scene Property RI01_Radio_JobAdNewAtlantisScene Auto Const Mandatory
Scene Property RI01_Radio_JobAdRyujinTowerScene Auto Const Mandatory
Location Property CityNeonLocation Auto Const Mandatory
Location Property CityNewAtlantisLocation Auto Const Mandatory
GlobalVariable Property UC04_AttackActive Auto Const Mandatory

Event OnAliasInit()
    Debug.Trace(Self + "RI01: Alias initialized. Register and run RunSetup function")
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RunSetup()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
Debug.Trace(Self + "RI01: EVENT: OnLocationChange: Location " + akOldLoc + "NEW Location " + akNewLoc)

        If akOldLoc == CityNewAtlantisLocation
            RI01_Radio_JobAdNewAtlantisScene.Stop()
        EndIf
        If akOldLoc == CityNeonLocation
            RI01_Radio_JobAdNeonScene.Stop()
            RI01_Radio_JobAdRyujinTowerScene.Stop()
        EndIf
        
        If akNewLoc == CityNeonLocation
        Debug.Trace(Self + "RI01: New Locaiton is NEON")
            RI01_Radio_JobAdNeonScene.Start()
            RI01_Radio_JobAdRyujinTowerScene.Start()
        EndIf
        If akNewLoc == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0
            RI01_Radio_JobAdNewAtlantisScene.Start()
        EndIf

EndEvent

Function RunSetup()
Debug.Trace(Self + "RI01: RunSetup function was called")
Location CurrentLocation = Game.GetPlayer().GetCurrentLocation()
Debug.Trace(Self + "RI01: Current Location is " + CurrentLocation)

        If CurrentLocation == CityNeonLocation
        Debug.Trace(Self + "RI01: New Location is NEON")
            RI01_Radio_JobAdNeonScene.Start()
            RI01_Radio_JobAdRyujinTowerScene.Start()
        EndIf
        If CurrentLocation == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0
            RI01_Radio_JobAdNewAtlantisScene.Start()
        EndIf

EndFunction