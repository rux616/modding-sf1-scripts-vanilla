Scriptname CF05_LocationChangeScript extends ReferenceAlias
{Prevent player from destroying a quest essential ship while also keeping them from being invicible while piloting it}

LocationAlias Property CF05_Location_PrototypeInterior Auto Const Mandatory

ReferenceAlias Property CF05_PrototypeShip Auto Const Mandatory

int Property StageToCheck Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if CF05.GetStageDone(StageToCheck)
        if akNewLoc == CF05_Location_PrototypeInterior.GetLocation()
            CF05_PrototypeShip.GetShipRef().SetEssential(false)
        else
            CF05_PrototypeShip.GetShipRef().SetEssential(true)
        endif
    endif
EndEvent