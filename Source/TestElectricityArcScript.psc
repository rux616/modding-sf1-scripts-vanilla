Scriptname TestElectricityArcScript extends ObjectReference
;Script that handles electricity arcing between two points

bool Property bPowered = true Auto

Spell Property ElectricitySpell Mandatory Const Auto
Keyword Property LinkCustom01 Mandatory Const Auto
Keyword Property LinkCustom02 Mandatory Const Auto

bool Property bRandomTarget = false Auto
{Set to true if you want this to arc to the player randomly if they're nearby}

Event OnLoad()
;Shock the player every now and then or just shock the target x marker

    If (bPowered && bRandomTarget)
        ElectrifyRandomTarget()
    ElseIf (bPowered)
        ElectrifyTarget()
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
;If system is powered, shut it down. If system is unpowered, turn it on.

    If (bPowered)
        bPowered = false
    ElseIf (bPowered == false && bRandomTarget)
        bPowered = true
        ElectrifyRandomTarget()
    ElseIf (bPowered == false)
        ElectrifyTarget()
    EndIf
EndEvent

Function ElectrifyTarget()
;Cast electricity arc spell on target xmarker every so often.

    while (bPowered)
        float fRandom = Utility.RandomFloat(0.2, 3.0)
        ElectricitySpell.Cast(GetLinkedRef(LinkCustom01), GetLinkedRef(LinkCustom02))
        Utility.Wait(fRandom)
    Endwhile
EndFunction

Function ElectrifyRandomTarget()
;Cast electricity arc spell on target x marker every so often, and hit the player every now and then too.

    while (bPowered)
        int iRandom = Utility.RandomInt(1, 100)
        float fRandom = Utility.RandomFloat(0.2, 3.0)
        float fDistance = game.GetPlayer().GetDistance(GetLinkedRef(LinkCustom01))
        If (iRandom <= 50 && fDistance < 12)
            ElectricitySpell.Cast(GetLinkedRef(LinkCustom01), game.GetPlayer())
        Else
            ElectricitySpell.Cast(GetLinkedRef(LinkCustom01), GetLinkedRef(LinkCustom02))
        EndIf
            Utility.Wait(fRandom)
    Endwhile
EndFunction