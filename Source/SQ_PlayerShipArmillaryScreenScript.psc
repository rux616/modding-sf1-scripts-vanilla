Scriptname SQ_PlayerShipArmillaryScreenScript extends ReferenceAlias

GlobalVariable Property MQAlllowArmillaryGravDrive Mandatory Const Auto
Message Property MQPlaceArmillaryShipScreenMSGBox Mandatory Const Auto
Message Property MQRemoveArmillaryShipScreenMSGBox Mandatory Const Auto
Message Property MQBlockArmillaryShipScreenMSGBox Mandatory Const Auto
ReferenceAlias Property PlayerShipArmillary Mandatory Const Auto
ReferenceAlias Property MQ00_Armillary Mandatory Const Auto
Quest Property MQ204 Auto Const Mandatory
Quest Property MQ404 Mandatory Const Auto
Quest Property MQ305 Auto Const Mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Quest Property MQ00 Mandatory Const Auto
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const Mandatory
Keyword Property ObjectTypeMQArtifact Mandatory Const Auto
Message Property ArmillaryNoArtifactsAddedMSG Mandatory Const Auto
ReferenceAlias Property HomeShipArmillaryScreen Mandatory Const Auto
Furniture Property PilotSeatStarborn Mandatory Const Auto
{ the ship armillary screen on a starborn ship is the pilot seat }

WwiseEvent Property WwiseEvent_AMBArtifactArmillaryShipInstall Mandatory Const Auto
WwiseEvent Property WwiseEvent_AMBArtifactArmillaryShipUninstall Mandatory Const Auto
WwiseEvent Property WwiseEvent_AMBArtifactArmillaryShipAddArtifact Mandatory Const Auto

Event OnLoad()
    ;if the home ship's armillary is enabled, turn on screen
    ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
    ObjectReference ArmillaryScreenTriggerREF = Self.GetRef()
    ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
    Utility.Wait(1.0) ;wait a second for things to load
    if ArmillaryREF.IsEnabled()
        If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn
            HomeShipArmillaryScreenREF.PlayAnimation("Play01") ;play screen animation
        Else        
            HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ;alternate starborn animation
        EndIf
    ElseIf MQ00_Armillary.GetRef() == ArmillaryREF ;the ship armillary is disabled despite being the current MQ00 armillary, so enable it
        ArmillaryREF.Enable()
        If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn
            HomeShipArmillaryScreenREF.PlayAnimation("Play01") ;play screen animation
        Else        
            HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ;alternate starborn animation
        EndIf
    Else
        If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn
            HomeShipArmillaryScreenREF.PlayAnimation("Play02") ;turn screen off
        Else
            HomeShipArmillaryScreenREF.PlayAnimation("Stage1") ;alternate starborn animation
        EndIf
    EndIf

    ;enable the Armillary Screen if at that point in the MQ
    If (MQAlllowArmillaryGravDrive.GetValueInt() >= 1) && (ArmillaryScreenTriggerREF.IsDisabled())
        ArmillaryScreenTriggerREF.Enable()
    EndIf
EndEvent

Auto State AllowInputState
    Event OnActivate(ObjectReference akActionRef)
        ;GotoState("ProcessingState")
        Actor PlayerREF = Game.GetPlayer()
        ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef()
        ObjectReference mySelfREF = Self.GetRef()
        If akActionRef == PlayerREF
            If (ArmillaryMountOrScreenREF == None)
                PlaceArmillaryMessage()
            ElseIf (ArmillaryMountOrScreenREF == mySelfREF)
                ArmillaryInShipMessage()
            Else
                MQBlockArmillaryShipScreenMSGBox.Show()
            EndIf
        EndIf
        GotoState("AllowInputState")
    EndEvent
EndState

State ProcessingState
    Event OnActivate(ObjectReference akActionRef)
        ;empty state
    EndEvent
EndState

Function PlaceArmillaryMessage()
    Actor PlayerREF = Game.GetPlayer()
    Int ButtonPressed = MQPlaceArmillaryShipScreenMSGBox.Show()
    ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
    ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
    If ButtonPressed == 1 ;building Armillary
        WwiseEvent_AMBArtifactArmillaryShipInstall.Play(PlayerREF) ;play soundfx
        If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn
            HomeShipArmillaryScreenREF.PlayAnimation("Play01") ;play screen animation
        Else
            HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ;alternate starborn animation
        EndIf
        ArmillaryREF.Enable()     
        (ArmillaryREF as ArmillaryScript).BuildArmillary(PlayerREF, Self.GetRef())
    EndIf
EndFunction

Function ArmillaryInShipMessage()
    Actor PlayerREF = Game.GetPlayer()
    Int ButtonPressed = MQRemoveArmillaryShipScreenMSGBox.Show()
    ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
    ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
    If ButtonPressed == 1 ;player is adding artifacts
        WwiseEvent_AMBArtifactArmillaryShipAddArtifact.Play(PlayerREF)
        If PlayerREF.GetItemCount(ObjectTypeMQArtifact) > 0
            (ArmillaryREF as ArmillaryScript).BuildArmillary(PlayerREF, Self.GetRef())
        Else
            ArmillaryNoArtifactsAddedMSG.Show() ;if player has no Artifacts, show message
        EndIf
    ElseIf ButtonPressed == 2 ;removing Armillary
        WwiseEvent_AMBArtifactArmillaryShipUninstall.Play(PlayerREF)
        If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn
            HomeShipArmillaryScreenREF.PlayAnimation("Play02") ;turn screen off
        Else
            HomeShipArmillaryScreenREF.PlayAnimation("Stage1") ;alternate starborn animation
        EndIf
        (ArmillaryREF as ArmillaryScript).PackupArmillary(PlayerREF)
        ArmillaryREF.Disable()
    EndIf
EndFunction