Scriptname RI01_TomoAliasScript extends ReferenceAlias

Keyword Property WeaponTypeEM Auto Const Mandatory
Int Property StageToSet Auto Const Mandatory

Event OnAliasInit()
    RegisterForHitEvent(Self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
  Debug.Trace(Self + "Tomo received ON HIT event: akTarget = " + akTarget + " akAggressor = " + akAggressor + " akSource = " + akSource + " akProjectile = " + akProjectile)

    ; If the player attacked and the weapon is NOT an EM weapon...
    If akAggressor == Game.GetPlayer() && akSource.HasKeyword(WeaponTypeEM) != 1  
    Debug.Trace(Self + "RI01: Pass initial checks: akAggressor = " + akAggressor + " akSource = " + akSource.HasKeyword(WeaponTypeEM))

        Spell sourceSpell = akSource as Spell

        ; If source is NOT a spell OR spell source is Hostile...
        If SourceSpell == NONE || SourceSpell.IsHostile()
        Debug.Trace(Self + "RI01: Pass 2nd checks if spell: Is akSource a spell: " + akSource + " and is it hostile: " + sourceSpell.IsHostile())
            GetOwningQuest().SetStage(StageToSet)
        EndIf
    EndIf

EndEvent
