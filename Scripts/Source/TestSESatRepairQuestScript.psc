Scriptname TestSESatRepairQuestScript extends Quest

RefCollectionAlias Property DamagedSectionsAlias Auto

Event OnQuestInit()
    debug.Trace(self + "|OnQuestInit(): Started") 
    int count = 0
    While (count < DamagedSectionsAlias.GetCount())
        ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
        RegisterForHitEvent(currentObjectReference) 
        RegisterForRemoteEvent(currentObjectReference, "OnActivate")
        count += 1
    EndWhile
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    If (akSender.GetScale() > 2)
        akSender.SetScale(akSender.GetScale() - 0.25)
        RegisterForHitEvent(akSender)
    Else
        debug.Trace(self + "|OnHit(): Scale at it's lowest, disabling") 
        akSender.DisableNoWait()
        SetStage(100)
        CheckForOneMoreRemaining()
        If (CheckForAllDisabled())
            debug.Trace(self + "|OnHit(): All are disabled, set the stage!") 
            SetStage(500)
        EndIf
    EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    If (akTarget.GetScale() > 2)
        akTarget.SetScale(akTarget.GetScale() - 0.25)
        RegisterForHitEvent(akTarget)
    Else
        debug.Trace(self + "|OnHit(): Scale at it's lowest, disabling") 
        akTarget.DisableNoWait()
        SetStage(100)
        CheckForOneMoreRemaining()
        If (CheckForAllDisabled())
            debug.Trace(self + "|OnHit(): All are disabled, set the stage!") 
            SetStage(500)
        EndIf
    EndIf
EndEvent

Bool Function CheckForOneMoreRemaining()
    debug.Trace(self + "|CheckForOneMoreRemaining(): Started") 
    int count = 0
    int countDisabled = 0
    int countMax = DamagedSectionsAlias.GetCount()
    While (count < countMax)
        ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
        If (currentObjectReference.IsDisabled())
            countDisabled = countDisabled + 1
        EndIf
        count += 1
    EndWhile
    debug.Trace(self + "|CheckForOneMoreRemaining(): " + countDisabled + " of " + countMax + " repairs remaining.") 
    If (countDisabled == (countMax - 1))
        SetStage(200)
    EndIf
EndFunction

Bool Function CheckForAllDisabled()
    int count = 0
    While (count < DamagedSectionsAlias.GetCount())
        ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count)
        If (currentObjectReference.IsDisabled())
            ;Do Nothing and Keep Checking
        Else
            ;We found one that is enabled, so return false
            Return False
        EndIf
        count += 1
    EndWhile
    Return True
EndFunction