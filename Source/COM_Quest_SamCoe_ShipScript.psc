Scriptname COM_Quest_SamCoe_ShipScript extends ReferenceAlias

LocationAlias Property PlayerShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipModule Auto Const Mandatory

ReferenceAlias Property LillianSceneMarker Auto Const Mandatory

ReferenceAlias Property LillianHart Auto Const Mandatory

int Property LillianOnShipStage Auto Const Mandatory

int Property LillianOffShipStage Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc == PlayerShipInteriorLocation.GetLocation()
		Alias_PlayerShipModule.RefillDependentAliases()
		Quest myQuest = GetOwningQuest()
		if myQuest.GetStageDone(LillianOnShipStage) && !myQuest.GetStageDone(LillianOffShipStage)
			LillianHart.GetRef().MoveTo(LillianSceneMarker.GetRef())
		endif
	endif
EndEvent