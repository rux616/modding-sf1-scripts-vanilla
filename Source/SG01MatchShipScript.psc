Scriptname SG01MatchShipScript extends RefCollectionAlias

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    if abRemove == false
        ; When a reference is added to this RefCollection - then make it so it's engine doesn't repair
        (akObject as SpaceshipReference).EnablePartRepair(EngineSystemHealth, false)
    endif
EndEvent

Event OnLoad(ObjectReference akSenderRef)
    RegisterForHitEvent(akSenderRef)
    Debug.Trace(akSenderRef + " has ben loaded.")

    ; Make it so you can't board the competitors' ships
    int i = 0
    while i < GetCount()
        ObjectReference theRef = GetAt(i)
        theRef.SetValue(DockingPermission, 4.0)     ; 4 - No boarding
        i += 1		
    endWhile          

EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
  
  if ( !SG01.GetStageDone(700) )     ; Has the match not started?
    if ( akAggressor == Game.GetPlayer() )      ; Did the player hit the target?
        SG01.SetStage(525)
        if ( SG01.GetStageDone(530) )           ; Was the player warned before?
            SG01.SetStage(550)                  ; Fail the whole match
        Else
            RegisterForHitEvent(akTarget)       ; Re-register, so if you keep attacking the same ship it'll boot you
        endif
    endif
  EndIf

EndEvent

Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)

    if akSystem == ShipSystem && aFullyDamaged
        Debug.Trace(akSenderRef + " has fired it's System Damage." + akSystem + ", " + aFullyDamaged)

        ; First set - the ship unaggressive - that's how competitors left is calculated
        akSenderRef.SetValue(aggression, 0.0)  ; 0 = Unaggressive

        ; Count the competitors left
        int nCompetitorsLeft = 0
        int i = 0
        while i < GetCount()
            ObjectReference theRef = GetAt(i)
            if theRef.GetValue(Aggression) == 2
                nCompetitorsLeft += 1
            endif
            i += 1		
        endWhile        

        if !SG01.GetStageDone(600)
            nCompetitorsLeft = GetCount()
        endif

        if ( nCompetitorsLeft == 0 )
            SG01.SetStage(800)
        endif

        if ( nCompetitorsLeft <= 2 )
            SG01.SetStage(720)
        endif

        ;  When a ship's engine is down - then it stops fighting and is out of the match
        SpaceshipReference spaceshipRef = akSenderRef as SpaceshipReference;
       	spaceshipRef.EnablePartRepair(None, false)  ; don't repair
        spaceshipRef.DamageValue(WeaponGroup1SystemHealth, 10000)
        spaceshipRef.DamageValue(WeaponGroup2SystemHealth, 10000)
        spaceshipRef.DamageValue(WeaponGroup3SystemHealth, 10000)

        spaceshipRef.StopCombat()
        spaceshipRef.SetUnconscious(true)
        spaceshipRef.RemoveFromFaction(PlayerEnemyFaction)
        spaceshipRef.AddToFaction(CaptiveFaction)
        spaceshipRef.AddToFaction(PlayerFriendFaction)
        spaceshipRef.IgnoreFriendlyHits()
        spaceshipRef.SetValue(Invulnerable, 1.0)
        spaceshipRef.EvaluatePackage(TRUE)
        spaceshipRef.StopCombat()

        ; Count how many remaining baddies there are
        SG01_CompetitorsRemaining.SetValue(nCompetitorsLeft)

        ; After booting from the RefCollection - the link to the SG01 objective wasn't refreshing - forcing it
        SG01.UpdateCurrentInstanceGlobal(SG01_CompetitorsRemaining)
        SG01.SetObjectiveDisplayed(700, TRUE, TRUE)
    EndIf

EndEvent

ActorValue Property Aggression Auto Const Mandatory
ActorValue Property ShipSystem Auto Const
ActorValue Property EngineSystemHealth Auto Const Mandatory
ActorValue Property WeaponGroup1SystemHealth Auto Const Mandatory
ActorValue Property WeaponGroup2SystemHealth Auto Const Mandatory
ActorValue Property WeaponGroup3SystemHealth Auto Const Mandatory
ActorValue Property DockingPermission Auto Const Mandatory
ActorValue Property Invulnerable Mandatory Const Auto
Quest Property SG01 Auto Const Mandatory
Faction Property CaptiveFaction Auto Const Mandatory
Faction Property PlayerFriendFaction Auto Const Mandatory
Faction Property PlayerEnemyFaction Auto Const Mandatory
GlobalVariable Property SG01_CompetitorsRemaining Auto Const Mandatory
ReferenceAlias Property PlayerShip Auto Const Mandatory
