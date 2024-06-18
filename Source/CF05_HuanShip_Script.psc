Scriptname CF05_HuanShip_Script extends ReferenceAlias

Event OnLoad()
	alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
EndEvent

ReferenceAlias Property Alias_CF05_HuanShip Auto Const
