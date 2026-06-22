Scriptname FFCydoniaZ01QuestScript extends Quest

ActorValue Property Aggression Mandatory Const Auto
GlobalVariable Property FFCydoniaZ01_CargoHalfTotal Mandatory Const Auto
GlobalVariable Property FFCydoniaZ01_CargoTotal Mandatory Const Auto
RefCollectionAlias Property Cargo Mandatory Const Auto
RefCollectionAlias Property Leeches Mandatory Const Auto

Function SetLeechesAggressive()
    Leeches.SetValue(Aggression, 2)
EndFunction

Event OnQuestInit()
    Int TotalCargo = Cargo.GetCount()
    Int HalfTotalCargo = TotalCargo/2
    FFCydoniaZ01_CargoTotal.SetValue(TotalCargo)
    FFCydoniaZ01_CargoHalfTotal.SetValue(HalfTotalCargo)
    SetLeechesAggressive()
EndEvent