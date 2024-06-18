Scriptname UC04_ThrallAliasScript extends ReferenceAlias

int Property PrereqStage = 575 Auto Const
{Don't register for events until this stage is set}

int Property ShutdownStage = 610 Auto Const
{If this stage is set, shut all this behavior down}

int Property StageToSet = 582 Const Auto
{Stage to set if the player shoots an NPC }

ConditionForm Property UC04_WeaponIsTypeEM Auto Const Mandatory
{Condition form used to check if the player's using EM weapons}

ReferenceAlias Property TriggerStationInterior Mandatory Const Auto
{Trigger that wraps the interior of the NAT train station}

Keyword Property UC04_Thrall_TeleportMarker_LinkedRef Mandatory Const Auto
{Keyword to find the proper linked ref for the thralls to teleport to}

Event OnAliasInit()
    trace(self, "Registering thrall: " + GetRef() + " for stage set events.")
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    trace(self, "Stage set: " + auiStageID)
    if auiStageID == PrereqStage
        trace(self, "Registering thrall: " + GetRef() + " for HIT events.")
        UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        RegisterForHitEvent(GetRef(), Game.GetPlayer())
    elseif auiStageID == ShutdownStage
        trace(self, "Sequence complete. Unregistering: " + GetRef() + " for all events.")
        UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        UnregisterForAllHitEvents()
    endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    trace(self, "Hit event registered. Target: " + akTarget + ". Aggressor: " + akAggressor + ". Source: " + akSource)
    if !GetOwningQuest().GetStageDone(ShutdownStage)
        if akAggressor == Game.GetPlayer() && !UC04_WeaponIsTypeEM.IsTrue()
            trace(self, "Hit was the player and they don't have an EM weapon equipped. Fire stage " + StageToSet)
            UnregisterForAllHitEvents()
            GetOwningQuest().SetStage(StageToSet)
        else
            RegisterForHitEvent(Game.GetPlayer())
        endif
    else
        UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        UnregisterForAllHitEvents()
    endif
EndEvent

Event OnCellLoad()
    ObjectReference currREF = GetRef()
    trace(self, "Thrall: " + currREF + " loaded. Is Disabled? " + currREF.IsDisabled() + " Teleport marker: " + currREF.GetLinkedRef(UC04_Thrall_TeleportMarker_LinkedRef))
    if !currREF.IsInTrigger(TriggerStationInterior.GetRef()) && !Game.GetPlayer().HasDetectionLOS(currRef)
        ObjectReference TeleportMarker = currREF.GetLinkedRef(UC04_Thrall_TeleportMarker_LinkedRef)
        trace(self, "They're not in their trigger!")

        if TeleportMarker
            trace(self, "Moved back inside trigger!")
            currREF.MoveTo(TeleportMarker)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction