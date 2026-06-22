Scriptname MQ204StateChangeHandlerPlayerScript extends ReferenceAlias

Location Property CityNewAtlantisLocation Auto Const Mandatory
MusicType Property _MUSExplore_WwiseSilence Mandatory Const Auto

GlobalVariable Property MQ204_NumTimesMusicAdded_Global Mandatory Const Auto

Function RemoveSilentMusic()
    Int i
    Int iValue = MQ204_NumTimesMusicAdded_Global.GetValue() as Int
    If iValue > 0
        While i <= iValue
            _MUSExplore_WwiseSilence.Remove()
            i += 1
        EndWhile
    EndIf
EndFunction


Event OnLocationChange(Location akOldLoc, Location akNewLoc)

    If akNewLoc == CityNewAtlantisLocation
        _MUSExplore_WwiseSilence.Add()
        MQ204_NumTimesMusicAdded_Global.Mod(1)
    ElseIf akOldLoc == CityNewAtlantisLocation
        If Game.GetPlayer().IsInLocation(CityNewAtlantisLocation) == False
            _MUSExplore_WwiseSilence.Remove()
        EndIf
    EndIf
EndEvent