Scriptname SFBGS00D:SFBGS00D_EquipmentSchematicScript extends ObjectReference
{Script to set a Global Value when an Equipment Module Schematic is obtained.}

;Properties
ReferenceAlias Property PlayerShip Mandatory Const Auto
GlobalVariable Property SchematicGlobal Mandatory Const Auto
GlobalVariable Property SchematicTutorialGlobal Mandatory Const Auto
Message Property SchematicTutorialMSG Mandatory Const Auto
Message Property LootSchematicMSG Mandatory Const Auto


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    If (akNewContainer == Game.GetPlayer() || akNewContainer == PlayerShip.GetShipRef())
        If (SchematicGlobal.GetValue() != 1)
            If (SchematicTutorialGlobal.GetValue() != 1)
                SchematicTutorialMSG.Show()
                SchematicTutorialGlobal.SetValue(1)
            Else
                LootSchematicMSG.Show()
            EndIf
            SchematicGlobal.SetValue(1)
        EndIf
    EndIf
EndEvent
