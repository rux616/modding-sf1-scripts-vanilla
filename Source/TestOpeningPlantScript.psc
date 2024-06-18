Scriptname TestOpeningPlantScript extends ObjectReference Const

Keyword Property LinkCustom01 Mandatory Const Auto
Keyword Property LinkCustom02 Mandatory Const Auto
Keyword Property LinkCustom03 Mandatory Const Auto
Keyword Property LinkCustom04 Mandatory Const Auto

Explosion Property PlantOpenExplosion Mandatory Const Auto
Explosion Property PlantClosedExplosion Mandatory Const Auto

Event OnLoad()
;Set initial scales and register for distance less than and hit events.
    GetLinkedRef(LinkCustom01).SetScale(2)
    GetLinkedRef(LinkCustom02).SetScale(2)
    RegisterForDistanceLessThanEvent(game.GetPlayer(), GetLinkedRef(LinkCustom01), 4)
    RegisterForHitEvent(GetLinkedRef(LinkCustom04))
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    PlantOpen()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    If akTarget == GetLinkedRef(LinkCustom04)
        If (GetLinkedRef(LinkCustom01).GetScale() < 1)
            ;Place small explosion
            GetLinkedRef(LinkCustom01).PlaceAtMe(PlantOpenExplosion)
        ElseIf (GetLinkedRef(LinkCustom01).GetScale() > 1)
            ;Place large explosion
            GetLinkedRef(LinkCustom01).PlaceAtMe(PlantClosedExplosion)
        EndIf
        GetLinkedRef(LinkCustom01).Disable()
        GetLinkedRef(LinkCustom02).Disable()
        GetLinkedRef(LinkCustom03).Disable()
        GetLinkedRef(LinkCustom04).Disable()
    EndIf
EndEvent

Function PlantOpen()
;Open plant and place toxic explosion. This will eventually be an animation.
    GetLinkedRef(LinkCustom01).Disable()
    GetLinkedRef(LinkCustom02).Enable()
    GetLinkedRef(LinkCustom02).PlaceAtMe(PlantOpenExplosion)
    GetLinkedRef(LinkCustom03).Enable()
    GetLinkedRef(LinkCustom01).SetScale(0.3)
    Utility.Wait(4)
    PlantShrink()
EndFunction

Function PlantShrink()
;Shrink plant. This will eventually be an animation.
    GetLinkedRef(LinkCustom01).Enable()
    RegisterForHitEvent(GetLinkedRef(LinkCustom01))
    ObjectReference myPlant = GetLinkedRef(LinkCustom02)
    float fCurrentScale = myPlant.GetScale()
    int count = 0
        While (fCurrentScale > 0.3)
            myPlant.SetScale(fCurrentScale - 0.02)
            fCurrentScale -= 0.02
            Utility.Wait(0.1)
            count += 1
        EndWhile
        GetLinkedRef(LinkCustom02).Disable()
        GetLinkedRef(LinkCustom03).Disable()
        GetLinkedRef(LinkCustom02).SetScale(2)
        Utility.Wait(3)
        PlantGrow()
EndFunction

Function PlantGrow()
;Grow plant. This will eventually be an animation.
;Re-register for distance less than event.
    ObjectReference myPlant = GetLinkedRef(LinkCustom01)
    float fCurrentScale = myPlant.GetScale()
    int count = 0
        While (fCurrentScale < 2.0)
            myPlant.SetScale(fCurrentScale + 0.02)
            fCurrentScale += 0.02
            Utility.Wait(0.1)
            count += 1
        EndWhile
        RegisterForDistanceLessThanEvent(game.GetPlayer(), GetLinkedRef(LinkCustom01), 2)
EndFunction