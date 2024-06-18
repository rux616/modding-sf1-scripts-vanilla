Scriptname TerrormorphRaceEffectScript extends ActiveMagicEffect
{make sure Terrormorphs flee when they enter combat with an Aceles}

Faction property AcelesFaction auto const mandatory

float fUpdateTime = 1.0 const
int iUpdateTimerID = 1 Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    debug.trace(self + " OnEffectStart on " + akCaster)
    RegisterForRemoteEvent(akCaster, "OnCombatListAdded")
    RegisterForRemoteEvent(akCaster, "OnCombatListRemoved")

    UpdateAcelesFlee()
EndEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
    if akTarget && akTarget.IsInFaction(AcelesFaction)
        debug.trace(self + " OnCombatListAdded " + akTarget + ": running timer")
        StartTimer(fUpdateTime, iUpdateTimerID)
    endif
EndEvent

Event Actor.OnCombatListRemoved(Actor akSource, Actor akTarget)
    if akTarget && akTarget.IsInFaction(AcelesFaction)
        debug.trace(self + " OnCombatListRemoved " + akTarget + ": running timer")
        StartTimer(fUpdateTime, iUpdateTimerID)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iUpdateTimerID
        UpdateAcelesFlee()
    endif
EndEvent

Function UpdateAcelesFlee()
    ; check combat list for any Aceles
    Actor myCaster = GetCasterActor()
    Actor[] myTargets = myCaster.GetAllCombatTargets()

    debug.trace(self + " UpdateAcelesFlee myTargets=" + myTargets)

    Actor foundAceles = None

    if myTargets.Length > 0
        int i = 0
        while i < myTargets.Length && foundAceles == NONE
            Actor theTarget = myTargets[i]
            debug.trace(self + "   checking " + theTarget)
            if theTarget.IsDead() == false && theTarget.IsInFaction(AcelesFaction)
                foundAceles = theTarget
                debug.trace(self + " found living Aceles in combat list")
            endif
            i += 1
        endWhile
    endif

    if foundAceles
        debug.trace(self + " " + myCaster + " is fleeing from " + foundAceles)
        myCaster.SetValue(Game.GetConfidenceAV(), 0)
    Else
        debug.trace(self + " " + myCaster + " is not fleeing")
        myCaster.SetValue(Game.GetConfidenceAV(), 4)
    endif
    myCaster.EvaluatePackage()
endFunction