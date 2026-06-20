Scriptname SFBGS00D:SFBGS00D_NewContainer_Tutorial extends ReferenceAlias
{This script displays a message to the player that a new container is available}  

Group AutoFill_Properties
    Message Property SFBGS00D_UnlimitedContainer_Message Mandatory Const Auto
    GlobalVariable Property SFBGS00D_OutpostPlaced_GV Mandatory Const Auto
EndGroup

Event OnOutpostPlaced(ObjectReference akOutpostBeacon)

    if SFBGS00D_OutpostPlaced_GV.GetValueInt() <= 0
        SFBGS00D_UnlimitedContainer_Message.Show()
        SFBGS00D_OutpostPlaced_GV.SetValue(1)
        GetOwningQuest().Stop()
    EndIf

EndEvent