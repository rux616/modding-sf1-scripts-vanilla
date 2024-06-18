Scriptname TestExplodingSeedPodTriggerScript extends ObjectReference

ActorValue Property SpeedMult Mandatory Const Auto

bool bPlayerInTrigger = false

Event OnTriggerEnter(ObjectReference akActionRef)
    bPlayerInTrigger = true
    AffectPlayer()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    bPlayerInTrigger = false
    AffectPlayer()
EndEvent

Function AffectPlayer()
;Slow player movement speed while in corrosive goo.
InputEnableLayer myLayer = InputEnableLayer.Create()
    if bPlayerInTrigger
        Game.GetPlayer().SetValue(SpeedMult, 30)
        ;myLayer.EnableJumping(false)
    ElseIf bPlayerInTrigger == false
        Game.GetPlayer().SetValue(SpeedMult, 100)
        ;myLayer.EnableJumping()
    EndIf
EndFunction