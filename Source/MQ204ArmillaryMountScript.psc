Scriptname MQ204ArmillaryMountScript extends ObjectReference

Quest Property MQ00 Auto Const Mandatory
Message Property ArmillaryNoArtifactsAddedMSG Mandatory Const Auto
Keyword Property ObjectTypeMQArtifact Mandatory Const Auto
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const Mandatory
Message Property MQBlockArmillaryShipScreenMSGBox Mandatory Const Auto
WwiseEvent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Mandatory Const Auto

;run a short timer that then runs a central function call in case the events come in out of order
Event OnWorkshopObjectPlaced(ObjectReference akReference)
	Actor PlayerREF = Game.GetPlayer()
	(Self.GetLinkedRef() as ArmillaryScript).BuildArmillary(PlayerREF)
	(MQ00 as MQ00QuestScript).StartArmillaryTimer(Self.GetWorkshop()) ; we need to know which workshop this came from
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
	Actor PlayerREF = Game.GetPlayer()
	(Self.GetLinkedRef() as ArmillaryScript).PackupArmillary(PlayerREF)
	(MQ00 as MQ00QuestScript).StartArmillaryTimer(Self.GetWorkshop()) ; we need to know which workshop this came from
EndEvent

Event OnActivate(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer()
    ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef()
    ;add artifacts to armillary
    If (akActionREF == PlayerREF)
        If ArmillaryMountOrScreenREF != Self ;Armillary was built elsewhere, so block
            MQBlockArmillaryShipScreenMSGBox.Show()
        Else
            If PlayerREF.GetItemCount(ObjectTypeMQArtifact) > 0
                WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self)
                ArmillaryScript ArmillaryREF = (Self.GetLinkedRef() as ArmillaryScript)
                ArmillaryREF.BuildArmillary(PlayerREF, Self)                
            Else
                ArmillaryNoArtifactsAddedMSG.Show() ;if player has no Artifacts, show message
            EndIf
        EndIf
    EndIf
EndEvent