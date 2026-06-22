Scriptname MQ302B_HelixScript extends ReferenceAlias

ReferenceAlias Property Helix_AndrejaVoice Const Auto Mandatory
ReferenceAlias Property Helix_BarrettVoice Const Auto Mandatory
ReferenceAlias Property Helix_SamVoice Const Auto Mandatory
ReferenceAlias Property Helix_SarahVoice Const Auto Mandatory

GlobalVariable Property COM_CompanionID_Andreja Const Auto Mandatory
GlobalVariable Property COM_CompanionID_Barrett Const Auto Mandatory
GlobalVariable Property COM_CompanionID_SamCoe Const Auto Mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Const Auto Mandatory
GlobalVariable Property MQ_CompanionDead Const Auto Mandatory

Auto State WaitingForTrigger
    Event OnLoad()
        gotostate("HasBeenTriggered")
        ;set the Helix's voicetype to match the companion who dies
        Int iCompanionDead = MQ_CompanionDead.GetValueInt()
        SpaceshipReference HelixREF = Self.GetShipRef()

        If iCompanionDead == COM_CompanionID_Andreja.GetValueInt()
            Helix_AndrejaVoice.ForceRefTo(HelixREF)
        ElseIf iCompanionDead == COM_CompanionID_Barrett.GetValueInt()
            Helix_BarrettVoice.ForceRefTo(HelixREF)
        ElseIf iCompanionDead == COM_CompanionID_SamCoe.GetValueInt()
            Helix_SamVoice.ForceRefTo(HelixREF)
        ElseIf iCompanionDead == COM_CompanionID_SarahMorgan.GetValueInt()
            Helix_SarahVoice.ForceRefTo(HelixREF)
        EndIf
    EndEvent
EndState

State HasBeenTriggered
    Event OnLoad()
        ;do nothing
    EndEvent
EndState