Scriptname TestElectrifiedWaterScript extends ObjectReference
;Script that handles playing effects and sounds and enabling electricity hazard for water.

Keyword Property LinkCustom01 Mandatory Const Auto

VisualEffect Property ElectrifiedWaterEffect Mandatory Const Auto
WWiseEvent Property ElectrifiedWaterSound Const Auto

bool Property bPowered = true Auto

int instance1

Event OnLoad()
;If system is powered, play electricity effects and sounds.

    If (bPowered)
        ElectrifiedWaterEffect.Play(GetLinkedRef(LinkCustom01))
        instance1 = ElectrifiedWaterSound.Play(self)
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
;If system is powered, stop effects and sounds and set to unpowered.

    If (bPowered)
        ElectrifiedWaterEffect.Stop(GetLinkedRef(LinkCustom01))
        GetLinkedRef(LinkCustom01).Disable()
        WwiseEvent.StopInstance(instance1) 
        bPowered = false
    ElseIf (bPowered == false)
    ;If system is unpowered, play effects and sounds and set to powered.

        GetLinkedRef(LinkCustom01).Enable()
        Utility.Wait(0.5)
        ;ElectrifiedWaterEffect.Play(GetLinkedRef(LinkCustom01))
        ElectrifiedWaterEffect.Play(game.GetPlayer())
        instance1 = ElectrifiedWaterSound.Play(self)
        bPowered = true
    EndIf
EndEvent
