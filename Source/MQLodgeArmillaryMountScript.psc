Scriptname MQLodgeArmillaryMountScript extends ObjectReference Const

Quest Property MQ404 Mandatory Const Auto
Int Property MQ404_PackUpStage=110 Const Auto
Int Property MQ404_PackUpPrereqStage=100 Const Auto
Message Property ArmillaryNoArtifactsAddedMSG Mandatory Const Auto
Keyword Property ObjectTypeMQArtifact Mandatory Const Auto
WwiseEvent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer()
    ;build up the Armillary, except during MQ404 where we're packing it up
    If (akActionREF == PlayerREF) && ((MQ404.GetStageDone(MQ404_PackUpPrereqStage) == False) || (MQ404.GetStageDone(MQ404_PackUpStage)))
        If PlayerREF.GetItemCount(ObjectTypeMQArtifact) > 0
            WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self)
            ArmillaryScript ArmillaryREF = (Self.GetLinkedRef() as ArmillaryScript)
            ArmillaryREF.BuildArmillary(PlayerREF)           
        Else
            ArmillaryNoArtifactsAddedMSG.Show() ;if player has no Artifacts, show message
        EndIf
    EndIf
EndEvent