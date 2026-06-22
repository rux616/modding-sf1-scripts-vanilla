Scriptname TriggerAmbushOnMarkerHit extends ObjectReference

Keyword Property DMP_AmbushMarker Mandatory Const Auto
{Keyword used to find the critter linked to this ambush marker}

Keyword Property LinkAmbushTrigger Mandatory Const Auto
{Keyword to find the trigger linked to the ambushing critter}

Auto State Waiting
    Event OnLoad()
        RegisterForHitEvent(self)
        trace(self, "OnHit event registered.")
    EndEvent

    Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
        trace(self, "Hit received! Processing.")
        ProcessHit()
    EndEvent

    Event OnUnload()
        UnregisterForHitEvent(self)
        trace(self, "OnHit event unregistered.")
    EndEvent
EndState

State Triggered
    Event OnLoad()
        ;Do nothing
    EndEvent

    Event OnUnload()
        ;Do nothing
    EndEvent
EndState

Function ProcessHit()
    ObjectReference[] LinkedNPCs = GetRefsLinkedToMe(DMP_AmbushMarker)
    int iLength = LinkedNPCs.Length
    trace(self, "Number of refs linked to me: " + iLength)
    bool AmbushNPCFound
    Actor NPCRef

    if iLength > 0 && !AmbushNPCFound
        int i = 0
        NPCRef = LinkedNPCs[i] as Actor
        trace(self, "Checking if linked ref: " + NPCRef + " is an actor.")

        if NPCRef != None
            AmbushNPCFound = true
        endif
    endif

    if AmbushNPCFound
        DefaultRefAmbushTrigger2 TriggerRef = NPCRef.GetLinkedRef(LinkAmbushTrigger) as DefaultRefAmbushTrigger2         

        if TriggerRef != none
            TriggerRef.TriggerAmbush()
        endif
    else
        trace(self,"ERROR: No NPCs attached to this ambush marker!")
    endif

    GotoState("Triggered")
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC09", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction