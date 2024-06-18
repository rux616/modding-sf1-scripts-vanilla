Scriptname MQ301ReleaseArtifactSwitchScript extends ReferenceAlias

Key Property MQ301PrototypeKey Mandatory Const Auto
Message Property MQ301_ReleaseSwitchActivateMSG Mandatory Const Auto
Message Property MQ301_ReleaseSwitchNotification Mandatory Const Auto
Message Property MQ301_ReleaseSwitchNameMSG Mandatory Const Auto
Int Property ReleaseArtifactStage=160 Const Auto

Auto State waitingforPlayer
    Event OnLoad()
        ObjectReference mySelfREF = Self.GetRef()
        mySelfREF.BlockActivation()
        mySelfREF.SetActivateTextOverride(MQ301_ReleaseSwitchActivateMSG)
        mySelfREF.SetOverrideName(MQ301_ReleaseSwitchNameMSG)
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        If akActionREF == Game.GetPlayer()
            if akActionREF.GetItemCount(MQ301PrototypeKey) >= 1
                ;if the player has the key, activate button
                GotoState("HasBeenTriggered")
                ObjectReference mySelfREF = Self.GetRef()
                mySelfREF.Activate(akActionRef, True)
                mySelfREF.BlockActivation(True, True)
                GetOwningQuest().SetStage(ReleaseArtifactStage)
            Else
                MQ301_ReleaseSwitchNotification.Show()
            EndIf
        EndIf
    EndEvent
EndState

State HasBeenTriggered
    Event OnLoad()
        ;do nothing
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        ;do nothing
    EndEvent
EndState