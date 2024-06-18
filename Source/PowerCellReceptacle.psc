Scriptname PowerCellReceptacle extends ObjectReference

MiscObject Property Power_Cell Auto const
Message Property PowerCellRequiredMessage Mandatory Const Auto
Message Property PowerCellActiveMessage Mandatory Const Auto
Message Property PowerCellMissingMessage Auto const
Message Property PowerCellFullMessage Auto const
WwiseEvent property SoundPowerUp Auto Const Mandatory

ActorValue Property PowerCellReceptacleAV Auto Const
;ActorValue Property PowerGenerated Mandatory Const Auto

auto State NoPowerCell
    Event OnReset()
        SetActivateTextOverride(PowerCellRequiredMessage)
    EndEvent

    Event OnLoad()
        SetActivateTextOverride(PowerCellRequiredMessage)
        BlockActivation()
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        ;Interact with Power Cell Receptacle
        GotoState("Busy")
        if akActionRef == game.getplayer()
            if akActionRef.GetItemCount(Power_Cell) >= 1 ;Check if player has power cell
                InsertPowerCell(akActionRef)
            Else
                ;Show message for no power cell in inventory
                PowerCellMissingMessage.Show()
                GotoState("NoPowerCell")
            endif
        endif
    EndEvent
EndState

State HasPowerCell
    Event OnReset()
        SetActivateTextOverride(PowerCellRequiredMessage)
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        ;Interact with Full Power Cell Receptacle
        PowerCellFullMessage.Show()
    EndEvent
EndState

State Busy
    ;Do Nothing
EndState

Function InsertPowerCell(ObjectReference akActionRef)
    akActionRef.RemoveItem(Power_Cell)
    BlockActivation(false) 
    self.Activate(self)
    BlockActivation()
    SetActivateTextOverride(PowerCellActiveMessage)
    SoundPowerUp.Play(akActionRef)
    GotoState("HasPowerCell")
    if(PowerCellReceptacleAV)
        SetValue(PowerCellReceptacleAV, 1.0)
    EndIf
EndFunction