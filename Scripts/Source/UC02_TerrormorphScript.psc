Scriptname UC02_TerrormorphScript extends ReferenceAlias

ReferenceAlias Property ActiveLure Mandatory Const Auto
{Ref alias for the currently active lure}

ReferenceAlias Property LurePathingTarget Mandatory Const Auto
{Ref alias for the active lure pathing target}

int Property TriggerDistance = 3 Const Auto
{Once the Terrormorph has gotten this close, kick off the timer for it to ignore the object}

GlobalVariable Property UC02_TerrormorphAttentionLength Mandatory Const Auto
{How long the Terrormorph will hang out here before moving on}

ReferenceAlias Property Hadrian Mandatory Const Auto
{Ref alias for Hadrian}

int Property StageToSet = 702 Const Auto
{Stge to set if Hadrian hits the Terrormorph at any point}

GlobalVariable Property UC02_Terrormorph_PlayerTargetPercent Mandatory Const Auto
{If the player gets added to the Morph's combat list, what's the percent chance it'll focus on the player as their target}

Event OnLoad()
    if !GetActorRef().IsDead()
        RegisterForHitEvent(GetRef(), Hadrian.GetRef())
    endif
EndEvent

int InspectTimerID = 1 const
ObjectReference CurrentLureTarget
Function RegisterForReachActiveLure(ObjectReference akActiveLure)
    trace(self, "Active lure: " + akActiveLure + " registered for a distance event.")
    UnregisterForDistanceEvents(GetRef(), GetRef())
    RegisterForDistanceLessThanEvent(GetRef(), akActiveLure, TriggerDistance)
    CurrentLureTarget = akActiveLure
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID )
    if !GetActorRef().IsInCombat() && (akObj1 == GetRef() || akObj2 == GetRef()) && (akObj1 == CurrentLureTarget || akObj2 == (akObj1 == GetRef() || akObj2 == GetRef()))
        trace(self, "Morph has reached the target. Start the hang out timer.")
        StartTimer(UC02_TerrormorphAttentionLength.GetValue(), InspectTimerID)
    else
        RegisterForDistanceLessThanEvent(GetRef(), CurrentLureTarget, TriggerDistance)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == InspectTimerID
        trace(self, "Inspect timer expired. Have the morph move on.")
        ActiveLure.Clear()
        LurePathingTarget.Clear()
        GetActorRef().EvaluatePackage()
    endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    if akAggressor == Hadrian.GetRef()
        if !GetActorRef().IsDead()
            GetOwningQuest().SetStage(StageToSet)
        endif
    endif
EndEvent

Event OnCombatListAdded(Actor akTarget)
    trace(self, "UC02 Morph: Target added to combat list: " + akTarget)
    Actor PlayACT = Game.GetPlayer()
    if akTarget == PlayAct
        int iRand = Utility.RandomInt(0, 100)
        trace(self, "UC02 Morph: It's the player. Roll to see if they should become the Morph's target: " + iRand)
        if iRand <= UC02_Terrormorph_PlayerTargetPercent.GetValueInt()
            GetActorRef().StartCombat(PlayACT, true)
            trace(self, "UC02 Morph: Yup! The morph is now targeting the player.")
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC02", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction