Scriptname LeaveUnityTriggerAliasScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Const Mandatory Auto
ReferenceAlias Property PlayerShipPilotSeat Mandatory Const Auto
ReferenceAlias Property PlayerShipCockpitEntrance Mandatory Const Auto
ReferenceAlias Property Armillary Mandatory Const Auto
Int Property TalkedToUnityStage=100 Const Auto
Int Property LeftUnityStage=300 Const Auto
ObjectReference Property LodgeStartMarker Mandatory Const Auto
Quest Property MQ00 Mandatory Const Auto

Int Property EnterUnityObjective = 100 Const Auto
Int Property LeaveUnityObjective = 110 Const Auto
Int Property ReturnUnityObjective = 120 Const Auto

Scene Property MQ305_002_Unity_04 Const Auto

GlobalVariable Property MQ305FinalSceneInt Mandatory Const Auto

ObjectReference Property MQ305EndingMarkerEmissary Mandatory Const Auto
ObjectReference Property Mq305EndingMarkerHunter Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerNeither Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerCF_SysDef Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerCF_Delgado Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeDead Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeNotDead Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeLetGo Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Masako Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Ularu Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Masako Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Ularu Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerConstellation Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerUC_Terrormorph Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerUC_Aceles Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerAndreja Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerBarrett Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerSamCoe Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerSarahMorgan Mandatory Const Auto
ReferenceAlias Property HomeShipArmillaryScreen Mandatory Const Auto

Event OnTriggerLeave(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer()
    Quest myMQ305 = GetOwningQuest()
    If (akActionRef == PlayerREF) && (myMQ305.GetStageDone(TalkedToUnityStage))
	    ;make sure the Unity recap scene is off so we don't accidentally trigger the ending
	    MQ305_002_Unity_04.Stop()
        MQ305FinalSceneInt.SetValueInt(0)
        
        ;make sure the player can't move
        (myMQ305 as MQ305Script).MQ305EnableLayer.DisablePlayerControls(abCamSwitch=True)

        ;fade out, put the player back in their ship
        Game.FadeOutGame(true, false, 0.0, 1.0, true)
	    Utility.Wait(1.0) ; give the fade a second to process

        ;disable ending markers for when the player comes back
        MQ305EndingMarkerHunter.DisableNoWait()
        MQ305EndingMarkerEmissary.DisableNoWait()
        MQ305EndingMarkerNeither.DisableNoWait()
        MQ305EndingMarkerAndreja.DisableNoWait()
        MQ305EndingMarkerBarrett.DisableNoWait()
        MQ305EndingMarkerSamCoe.DisableNoWait()
        MQ305EndingMarkerSarahMorgan.DisableNoWait()
        MQ305EndingMarkerCF_SysDef.DisableNoWait()
        MQ305EndingMarkerCF_Delgado.DisableNoWait()
        MQ305EndingMarkerFSC_HopeDead.DisableNoWait()
        MQ305EndingMarkerFSC_HopeNotDead.DisableNoWait()
        MQ305EndingMarkerFSC_HopeLetGo.DisableNoWait()
        MQ305EndingMarkerRI_NoNeuroAmp.DisableNoWait()
        MQ305EndingMarkerRI_NoNeuroAmp_Masako.DisableNoWait()
        MQ305EndingMarkerRI_NoNeuroAmp_Ularu.DisableNoWait()
        MQ305EndingMarkerRI_NeuroAmp.DisableNoWait()
        MQ305EndingMarkerRI_NeuroAmp_Masako.DisableNoWait()
        MQ305EndingMarkerRI_NeuroAmp_Ularu.DisableNoWait()
        MQ305EndingMarkerUC_Aceles.DisableNoWait()
        MQ305EndingMarkerUC_Terrormorph.DisableNoWait()
        MQ305EndingMarkerConstellation.DisableNoWait()

        ;pack up the Armillary on the ship
        ObjectReference ArmillaryREF = Armillary.GetRef()
        (ArmillaryREF as ArmillaryScript).PackupArmillary(PlayerREF)
        ArmillaryREF.Disable()

        ;move the player back to their ship. if for some reason the ship doesn't exist, move to the Lodge
        ObjectReference myShipCockpitEntrance = PlayerShipCockpitEntrance.GetRef()
        If myShipCockpitEntrance == None
            PlayerREF.moveto(LodgeStartMarker)
        Else
            ;move player to ship
            PlayerREF.moveto(myShipCockpitEntrance)
            PlayerREF.WaitFor3DLoad()
            HomeShipArmillaryScreen.GetRef().PlayAnimation("Play02") ;turn screen off
            ;failsafe make sure the player ship is no longer ghosted from the Unity Jump scene
            PlayerShip.GetShipRef().SetGhost(False)
        EndIf

        If myMQ305.GetStageDone(LeftUnityStage) == 0
            myMQ305.SetStage(LeftUnityStage)
        Else
            ;if we're leaving the Unity again after the first time, reset objectives
            myMQ305.SetObjectiveDisplayed(EnterUnityObjective, abDisplayed=False)
            myMQ305.SetObjectiveCompleted(LeaveUnityObjective)
            myMQ305.SetObjectiveCompleted(ReturnUnityObjective, abCompleted=False)
        EndIf

        ;player can now move
        (myMQ305 as MQ305Script).UnlockPlayerControlUnity()
    EndIf
EndEvent