Scriptname SFBGS00D:SMS_ExtendedCommArrayScript extends ActiveMagicEffect
{Script that manages the Extended Comm Array effect for the equipment module.}

;Properties
Group AutofillProperties
   ActorValue Property Health Mandatory Const Auto 
EndGroup

Group MiscProperties
    ReferenceAlias Property PlayerShip Mandatory Const Auto
    float Property ShipDamagePercent = 0.5 Const Auto
    float Property DelayTime = 5.0 Const Auto
    int Property RollChance = 10 Const Auto
EndGroup

Group QuestProperties
    Quest Property ExtendedCommQuest Mandatory Const Auto
    int Property CleanupStage = 20 Const Auto
EndGroup

;Non-Property Variables
SpaceshipReference ActiveShip
bool IsInCombat = false
float ShipHealth
float DamageThreshold
int TimerID = 1

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    ActiveShip = PlayerShip.GetShipRef()
    ShipHealth = ActiveShip.GetValue(Health)
    DamageThreshold = ShipHealth * ShipDamagePercent

    RegisterForRemoteEvent(ActiveShip, "OnCombatStateChanged")
EndEvent

Event SpaceshipReference.OnCombatStateChanged(SpaceshipReference akSender, ObjectReference akTarget, int aeCombatState)
    If (aeCombatState == 1)
        Debug.Trace("Extended Comm - IN COMBAT")
        IsInCombat = true
        RegisterForActorValueLessThanEvent(ActiveShip, Health, DamageThreshold)
    Else
        Debug.Trace("Extended Comm Combat State:" + aeCombatState)
        IsInCombat = false
        ExtendedCommQuest.SetStage(CleanupStage)
        UnregisterForActorValueLessThanEvent(ActiveShip, Health, DamageThreshold)
    EndIf
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    If (IsInCombat == true)
        StartTimer(DelayTime, TimerID)
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    If (aiTimerID == TimerID  && IsInCombat == true && ExtendedCommQuest.IsRunning() == false)
        If (Game.GetDieRollSuccess(RollChance))
            ExtendedCommQuest.Start()
            ExtendedCommQuest.SetStage(10)
        EndIf
        StartTimer(DelayTime, TimerID)
    EndIf
EndEvent