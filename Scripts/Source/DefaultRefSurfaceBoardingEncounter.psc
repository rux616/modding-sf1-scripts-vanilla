Scriptname DefaultRefSurfaceBoardingEncounter extends SpaceshipReference Default
{Script for ships on the surface of a planet. When the ship lands, start a Boarding Encounter to manage the crew in the ship's interior.}

Group AliasProperties
	float property CrewSizePercent = 1.0 Auto Const
	{DEFAULT=1.0. Multiply the Boarding Encounter's base crew and corpse counts by this value.
	For example, if your encounter spawns actors outside the ship to fight the player, you might want half the usual crew in the ship (0.5).
	Note that reducing a ship's crew size with this multiplier also reduces its default loot accordingly.}
EndGroup

Group AutofillProperties CollapsedOnBase
	Keyword property BEEncounterTypeSurface Auto Const Mandatory
EndGroup

;Hidden Properties
;TODO - TTP 29661 - Save off the Boarding Encounter Quest so other scripts can find and interact with it.
Quest property myBoardingEncounterQuest Auto Hidden


;The Boarding Encounter script event expects:
; - akRef1: Player's ship (for docking events only).
; - akRef2: Enemy ship.
; - aiValue1: CrewSizePercent multiplier.
Event OnShipLanding(bool abComplete)
	if (abComplete)
		;TODO - TTP 29661 - Save the Boarding Encounter Quest for the ship so other scripts can find and interact with it.
		BEEncounterTypeSurface.SendStoryEventAndWait(akRef2=Self, aiValue1=(CrewSizePercent*100) as int)
	EndIf
EndEvent