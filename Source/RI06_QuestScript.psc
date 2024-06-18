Scriptname RI06_QuestScript extends Quest

Int Property iSeanCallsSecurityStage = 1258 Auto Const 
Int Property iDrLaneCallsSecurityStage = 1273 Auto Const 
Int Property iPlayerCaughtStealing = 1236 Auto Const
Int Property iAllAccessGranted = 1235 Auto Const 
Int Property iComputerAccessGranted = 1271 Auto Const

ReferenceAlias Property Sean Auto Const Mandatory
ReferenceAlias Property DrLane Auto Const Mandatory
ReferenceAlias Property GuardAlias Auto Const Mandatory
ReferenceAlias Property Staff01 Auto Const Mandatory
ReferenceAlias Property Staff02 Auto Const Mandatory
ReferenceAlias Property DrLaneTerminal Auto Const Mandatory
ReferenceAlias Property RothiciteShipment Auto Const Mandatory
ReferenceAlias Property RothiciteShipmentPost Auto Const Mandatory

Scene Property RI06_1258_Sean_CaughtStealingScene Auto Const Mandatory
Scene Property RI06_1258_DrLane_CaughtStealingScene Auto Const Mandatory

MiscObject Property RI06_RothiciteShipment Auto Const Mandatory

Faction Property RI06_SecureWingFaction Auto Const Mandatory

Function SeanStartTimer()
; Function called in Stage 1257.
    Debug.Trace(Self + "SendRegisterLOSLost function called for Sean")
    SeanTimer()
EndFunction

Function DrLaneStartTimer()
; Function called in Stage 1272.
    Debug.Trace(Self + "SendRegisterLOSLost function called for Dr. Lane")
    DrLaneTimer()
EndFunction

Function SeanRegisterLOSGain()
    Debug.Trace(Self + "SendRegisterLOSGain function called for Sean")
    RegisterForDirectLOSGain(Sean.GetRef(), Game.GetPlayer())
    Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
EndFunction

Function DrLaneRegisterLOSGain()
    Debug.Trace(Self + "SendRegisterLOSGain function called for Dr. Lane")
    RegisterForDirectLOSGain(DrLane.GetRef(), Game.GetPlayer())
    Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
EndFunction

Function SeanTimer()
    Debug.Trace(Self + "SeanTimer function called for Sean")
    StartTimer(60, 1)
EndFunction

Function DrLaneTimer()
    Debug.Trace(Self + "DrLaneTimer function called for Dr. Lane")
    StartTimer(60, 2)
EndFunction

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
    Debug.Trace(Self + "OnGainLOS Event Fired" + akViewer)
    If akViewer == Sean.GetRef()
        SetStage(iSeanCallsSecurityStage)
    EndIf
    If akViewer == DrLane.GetRef()
        SetStage(iDrLaneCallsSecurityStage)
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
Debug.Trace(Self + "Timer aiTimerID expired")
    If aiTimerID == 1 
        Debug.Trace(Self + "Passed TIMER 1 check for Sean")
        If Sean.GetActorRef().HasDetectionLOS(Game.GetPlayer())
            SetStage(iSeanCallsSecurityStage)
        Else
            SeanRegisterLOSGain()
        EndIf
    EndIf
    If aiTimerID == 2
        Debug.Trace(Self + "Passed TIMER 2 check for Dr. Lane")
        If DrLane.GetActorRef().HasDetectionLOS(Game.GetPlayer())
            SetStage(iDrLaneCallsSecurityStage)
        Else
            DrLaneRegisterLOSGain()
        EndIf
    EndIf
EndEvent

Function CheckForAccess(ObjectReference akObjectRef)
Debug.Trace(Self + "RI06: CheckForOwners function called: akObjectRef: " + akObjectRef)
    Actor PlayerRef = Game.GetPlayer()
    If akObjectRef == RothiciteShipment.GetRef()
    Debug.Trace(Self + "RI06: Item to check is Rothicite Shipment")
        If !GetStageDone(iAllAccessGranted)
            Debug.Trace(Self + "RI06: Stage 1235 is NOT done. Player does NOT have access.")
            CheckForLOS()
            PlayerRef.RemoveItem(RI06_RothiciteShipment, 99, abSilent = True)
            PlayerRef.AddAliasedItem(RI06_RothiciteShipment, RothiciteShipmentPost, abSilent = True)
        EndIf
    EndIf
    If akObjectRef == DrLaneTerminal.GetRef()
    Debug.Trace(Self + "RI06: Item to check is Dr. Lane's Terminal")
        If !GetStageDone(iAllAccessGranted) && !GetStageDone(iComputerAccessGranted)
            Debug.Trace(Self + "RI06: Stage 1235 is NOT done. Stage 1271 is NOT done. Player does NOT have access.")
            CheckForLOS()
        EndIf
    Else
    Debug.Trace(Self + "RI06: Failed faction owner. Current Faction Owner: " + akObjectRef.GetFactionOwner())
    EndIf
EndFunction

Function CheckForLOS()
; Function called in Stage 1230 and 1261.
Debug.Trace(Self + "RI06: Check for LOS was called")
Actor PlayerRef = Game.GetPlayer()
    If Sean.GetActorRef().HasDetectionLOS(PlayerRef)
    Debug.Trace(Self + "RI06: Sean has LOS")
        SetStage(iPlayerCaughtStealing)
        RI06_1258_Sean_CaughtStealingScene.Start()
    EndIf
    If DrLane.GetActorRef().HasDetectionLOS(PlayerRef)
    Debug.Trace(Self + "RI06: Dr. Lane has LOS")
        SetStage(iPlayerCaughtStealing)
        RI06_1258_DrLane_CaughtStealingScene.Start()
    EndIf
    If Staff01.GetActorRef().HasDetectionLOS(PlayerRef) || Staff02.GetActorRef().HasDetectionLOS(PlayerRef)
    Debug.Trace(Self + "RI06: Staff has LOS")
        SetStage(iPlayerCaughtStealing)
    EndIf
EndFunction
