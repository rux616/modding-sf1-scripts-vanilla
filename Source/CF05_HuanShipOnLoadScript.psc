Scriptname CF05_HuanShipOnLoadScript extends ReferenceAlias

ReferenceAlias Property Alias_CF05_HuanShipDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanShip Auto Const Mandatory

Event OnLoad()
    if !GetOwningQuest().GetStageDone(721)
        Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
        Self.RefillDependentAliases()
        Alias_CF05_HuanShipDoor.RefillAlias()
    endif
endEvent