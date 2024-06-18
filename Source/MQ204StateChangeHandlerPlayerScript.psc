Scriptname MQ204StateChangeHandlerPlayerScript extends ReferenceAlias

Location Property CityNewAtlantisLocation Auto Const Mandatory
MusicType Property _MUSExplore_WwiseSilence Mandatory Const Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

    If akNewLoc == CityNewAtlantisLocation
        _MUSExplore_WwiseSilence.Add()
    ElseIf akOldLoc == CityNewAtlantisLocation
        If Game.GetPlayer().IsInLocation(CityNewAtlantisLocation) == False
            _MUSExplore_WwiseSilence.Remove()
        EndIf
    EndIf
EndEvent