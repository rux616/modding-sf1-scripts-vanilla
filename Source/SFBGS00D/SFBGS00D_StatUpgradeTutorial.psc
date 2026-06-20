Scriptname SFBGS00D:SFBGS00D_StatUpgradeTutorial extends ObjectReference Const

Group AutoFill_Properties
    GlobalVariable Property SFBGS00D_HasStatUpgradeMod Auto Const Mandatory
    Message Property SFBGS00D_Tutorial_StatUpgrade Mandatory Const Auto
EndGroup

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    If (akNewContainer == Game.GetPlayer())
        If (SFBGS00D_HasStatUpgradeMod.GetValue() != 1)
            SFBGS00D_Tutorial_StatUpgrade.Show()
            SFBGS00D_HasStatUpgradeMod.SetValue(1)
        EndIf
    EndIf
EndEvent