Scriptname COM_CoraHandlerQuestScript extends Quest

Group Autofill
    ReferenceAlias Property Cora Mandatory Const Auto
    ReferenceAlias Property SamCoe Mandatory Const Auto

    LocationAlias Property PlayerShipLocation Mandatory Const Auto
    ReferenceAlias Property PlayerShipCrewMarker Mandatory Const Auto
    
    LocationAlias Property LodgeLocation Mandatory Const Auto
    ReferenceAlias Property LodgeSandboxMarker Mandatory Const Auto

    ConditionForm Property COM_CND_Cora_OnPlayerShip Mandatory Const Auto
    ConditionForm Property COM_CND_Cora_AtLodge Mandatory Const Auto

    ConditionForm Property COM_Cora_HandlerTeleportingAllowed Mandatory Const Auto
    {when this is true and quest has started (MQ103 stage 100 starts it), Cora will teleport to player ship or lodge as needed.}

    ActorValue Property FollowerState Mandatory Const Auto
EndGroup

Event OnQuestInit()
    Actor SamCoeRef = SamCoe.GetActorReference()

    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(SamCoeRef, "OnLocationChange")
    RegisterForActorValueChangedEvent(SamCoeRef, FollowerState) ;Cora needs to match Sam Coe's follower state (following/waiting)
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ;wif either change location...Achievements_CompanionsAndEliteCrew
    Actor CoraRef = Cora.GetActorReference()
    Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)

    if COM_Cora_HandlerTeleportingAllowed.IsTrue(akRefObject=CoraRef) == false
        Trace(self, "OnLocationChange() COM_Cora_HandlerTeleportingAllowed is false, BAILING - not teleporting Cora ")
        RETURN
    endif

    
    Location playerShipLoc = PlayerShipLocation.GetLocation()
    Location lodgeLoc = LodgeLocation.GetLocation()
    ObjectReference moveToRef = None

    ;if she's not on the player ship, but should be, move her there
    if playerShipLoc && CoraRef.GetCurrentLocation() != playerShipLoc && COM_CND_Cora_OnPlayerShip.IsTrue(CoraRef)
        moveToRef = PlayerShipCrewMarker.GetReference()
    elseif lodgeLoc && CoraRef.GetCurrentLocation() != lodgeLoc && COM_CND_Cora_AtLodge.IsTrue(CoraRef)
        moveToRef = LodgeSandboxMarker.GetReference()
    endif

    if moveToRef
        Trace(self, "OnLocationChange() moving Cora to: moveToRef: " + moveToRef)
        CoraRef.MoveTo(moveToRef)
        CoraRef.EvaluatePackage()
    endif


EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
    ObjectReference SamCoeRef = SamCoe.GetReference()
    if akObjRef == SamCoeRef && akActorValue == FollowerState
        float value = SamCoeRef.GetValue(FollowerState)
        Cora.GetReference().SetValue(FollowerState, value)
        RegisterForActorValueChangedEvent(SamCoeRef, FollowerState) ;Cora needs to match Sam Coe's follower state (following/waiting)
        Trace(self, "OnActorValueChanged() set Cora's FollowerState to match Sam's. value: " + value)
    endif
EndEvent


Function TestLodgeCondition()
;BUG TO WRITE UP... when this should be true, it's false if I don't pass in a subject reference (example: Sam Coe is not on the ship, and not an active companion)
    Actor CoraRef = Cora.GetActorReference()
    Trace(self, "TestLodgeCondition()  COM_CND_Cora_AtLodge: " +  COM_CND_Cora_AtLodge)
    Trace(self, "TestLodgeCondition()  COM_CND_Cora_AtLodge.IsTrue(): " +  COM_CND_Cora_AtLodge.IsTrue())
    Trace(self, "TestLodgeCondition()  COM_CND_Cora_AtLodge.IsTrue(CoraRef): " +  COM_CND_Cora_AtLodge.IsTrue(CoraRef))
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "Cora", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "Cora", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction