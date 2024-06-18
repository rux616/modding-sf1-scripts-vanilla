Scriptname NeonSecurityScannerScript extends ObjectReference Const

WwiseEvent Property AMB_Ext_CityNeon_AuroraScanner_Confirmation Auto Const mandatory
{ sound to play if no aurora detected }

WwiseEvent Property AMB_Ext_CityNeon_AuroraScanner_Denial Auto Const mandatory
{ sound to play if aurora detected and guards alarmed }

Faction property CurrentFollowerFaction auto Const mandatory

Keyword property GuardKeyword auto const mandatory
{ used to find nearby guards }

Potion property Drug_Aurora auto const mandatory

Faction property CrimeFactionNeon auto const mandatory

Guard scanGuard ProtectsFunctionLogic

Message Property Neon_AuroraSnifferMessage Auto Const Mandatory

float property maxGuardDistance = 25.0 auto const
{ range to search for guards }


Event OnLoad()
    AddInventoryEventFilter(Drug_Aurora)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    debug.trace(self + " OnTriggerEnter " + akActionRef)
    if akActionRef is Actor
        ScanActor(akActionRef as Actor, true)
    elseif akActionRef.GetBaseObject() == Drug_Aurora
        ; assume if Aurora is dropped in the trigger the player is responsible
        akActionRef.SetFactionOwner(CrimeFactionNeon)
        akActionRef.SendStealAlarm(Game.GetPlayer())
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    debug.trace(self + " OnTriggerLeave " + akActionRef)
    LockGuard scanGuard
        UnregisterForRemoteEvent(akActionRef, "OnItemAdded")
        debug.trace(self + " " + akActionRef + " unregistered for OnItemAdded")
    EndLockGuard
EndEvent


Function ScanActor(Actor scanActor, bool playSound = true)
    debug.trace(self + " ScanActor " + scanActor)
    LockGuard scanGuard
        if scanActor && IsValidActor(scanActor) && IsInTrigger(scanActor)
            ; if scanActor has Aurora, trigger alarm
            int auroraCount = scanActor.GetItemCount(Drug_Aurora)
            debug.trace(self + "     auroraCount=" + auroraCount)
            if auroraCount > 0
                AMB_Ext_CityNeon_AuroraScanner_Denial.PlayandWait(self)

                ; find a live guard
                ObjectReference[] guards = FindAllReferencesWithKeyword(GuardKeyword, maxGuardDistance)
                debug.trace(self + "     guards=" + guards)
                if guards.Length > 0
                    ; find closest guard
                    int i = 0
                    Actor guardActor
                    float currentDistance = maxGuardDistance + 1.0
                    while i < guards.Length
                        Actor testGuard = guards[i] as Actor
                        float testDistance = GetDistance(testGuard)
                        debug.trace(self + " testGuard=" + testGuard + " distance=" + testDistance + " currentDistance=" + currentDistance)
                        if testGuard && testGuard.IsDead() == false && testDistance < currentDistance
                            guardActor = testGuard
                            currentDistance = testDistance
                            debug.trace(self + " guardActor=" + guardActor + " currentDistance=" + currentDistance)
                        endif   
                        i += 1
                    endWhile
                    
                    debug.trace(self + "     Closest guardActor=" + guardActor)
                    if guardActor
                        guardActor.SendSmugglingAlarm(scanActor)
                        if Game.GetPlayer().IsInCombat() == 0 ;if scanner catches player with Aurora, pop a message saying they're going to be arrested. Only show the message if player isn't in combat (that way if player resists arrest it won't keep popping up if player runs through the triggera lot)
                            Neon_AuroraSnifferMessage.Show()
                        endif
                    EndIf
                EndIf
            Else
                ; watch for actors to pick up aurora
                RegisterForRemoteEvent(scanActor, "OnItemAdded")
                debug.trace(self + " " + scanActor + " registered for OnItemAdded")
                AMB_Ext_CityNeon_AuroraScanner_Confirmation.PlayandWait(self)
            endif
        endif
    EndLockGuard
    debug.trace(self + " ScanActor " + scanActor + " END")
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    debug.trace(self + " OnItemAdded akSource=" + akSource)
    ; if we get this event, means someone picked up Aurora while in the trigger - blame the player!
    if akBaseItem == Drug_Aurora
        debug.trace(self + " added aurora - rescan " + akSource)
        ScanActor(akSource as Actor, false)
    endif
EndEvent

bool Function IsValidActor(Actor scanActor)
    return (scanActor.IsInFaction(CurrentFollowerFaction) || scanActor == Game.GetPlayer())
endFunction
