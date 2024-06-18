Scriptname CF05_PrototypeShipDockingScript extends ReferenceAlias

ReferenceAlias Property StateChangeMarker Auto Const Mandatory

Location Property StationTheKeySpaceCellLocation Auto Const Mandatory

Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
        Quest myQuest = GetOwningQuest()
        Location currentLocation = TryToGetCurrentLocation()
        SpaceshipReference myShip = GetShipRef()

            if myShip == akDocking && currentLocation == StationTheKeySpaceCellLocation
                StateChangeMarker.GetRef().EnableNoWait()
            endif

EndEvent

Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
        Quest myQuest = GetOwningQuest()
        Location currentLocation = TryToGetCurrentLocation()
        SpaceshipReference myShip = GetShipRef()

            if myQuest.GetStageDone(1890) && !myQuest.GetStageDone(1900)
                myQuest.SetStage(1900)
            endif

            if myShip == akUnDocking && currentLocation == StationTheKeySpaceCellLocation
                StateChangeMarker.GetRef().DisableNoWait()
            endif

endEvent