Scriptname SQ_PlayerShipArmillaryScript extends ReferenceAlias

Keyword Property ObjectTypeMQArtifact Mandatory Const Auto
Message Property MQAddArtifactEnterShipMSG Mandatory Const Auto
ActorValue Property MQArmillaryShipBuilderCheck Mandatory Const Auto
GlobalVariable Property MQAllowArmillaryGravDrive Mandatory Const Auto
ReferenceAlias Property MQ00_Armillary Mandatory Const Auto

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    If MQAllowArmillaryGravDrive.GetValueInt() >= 1
        Actor PlayerREF = Game.GetPlayer()
        If abRemove == True
            (akObject as ArmillaryScript).PackupArmillary(PlayerREF)
            akObject.Disable()
        EndIf
    EndIf
EndEvent