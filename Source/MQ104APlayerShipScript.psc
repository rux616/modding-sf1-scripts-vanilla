Scriptname MQ104APlayerShipScript extends ReferenceAlias

Int Property Planet01ScanStage=24 Const Auto
Int Property Planet02ScanStage=34 Const Auto
Int Property ScanPrereqStage=20 Const Auto
LocationAlias Property Location01Planet Mandatory Const Auto
LocationAlias Property Location02Planet Mandatory Const Auto

Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)
    Location Planet01Loc = Location01Planet.GetLocation()
    Location Planet02Loc = Location02Planet.GetLocation()
    Quest myQuest = GetOwningQuest()

    ;player scans Planet01 or Planet02
    If (aPlanet == Planet01Loc) && (myQuest.GetStageDone(ScanPrereqStage)) && (myQuest.GetStageDone(Planet01ScanStage) == False)
        myQuest.SetStage(Planet01ScanStage)
    ElseIf (aPlanet == Planet02Loc) && (myQuest.GetStageDone(ScanPrereqStage)) && (myQuest.GetStageDone(Planet02ScanStage) == False)
        myQuest.SetStage(Planet02ScanStage)
    EndIf
EndEvent