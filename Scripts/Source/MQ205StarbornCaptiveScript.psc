Scriptname MQ205StarbornCaptiveScript extends ReferenceAlias

Function RegisterForHits()
    RegisterForHitEvent(Self.GetActorRef(), Game.GetPlayer())
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    If akAggressor == Game.GetPlayer()
        Quest MQ205Quest = GetOwningQuest()
        If MQ205Quest.GetStageDone(310) && MQ205Quest.GetStageDone(315) == 0
            MQ205Quest.SetStage(315)
        ElseIf MQ205Quest.GetStageDone(320) && MQ205Quest.GetStageDone(325) == 0
            MQ205Quest.SetStage(325)
        ElseIf MQ205Quest.GetStageDone(330) && MQ205Quest.GetStageDone(350) == 0
            MQ205Quest.SetStage(350)
        EndIf
    EndIf
EndEvent