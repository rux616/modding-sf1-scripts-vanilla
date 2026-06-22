Scriptname FrontDoorToLodgeScript extends ObjectReference

Message Property TestFrontDoorLodgeMSG Mandatory Const Auto
Bool Property LodgeFrontDoorOpen Auto
ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto
Idle Property IdleDoorWatch Mandatory Const Auto
InputEnableLayer LodgeDoorLayer
Armor Property Clothes_Chronomark_Mq101 Mandatory Const Auto
Armor StorePlayerArmor
Armor StorePlayerSuit
Int FailsafeTimerID=5
Int FailsafeTimerLength=15
Quest Property MQ101 Mandatory Const Auto
Int Property MQ101LodgeStage = 1510 Const Auto
Message Property NotAllowedDuringCombat Mandatory Const Auto

Auto State waitingforPlayer
    Event OnLoad()
        Actor PlayerREF = Game.GetPlayer()
        If (LodgeFrontDoorOpen == False) && (PlayerREF.GetValue(PlayerUnityTimesEntered) == 0) && (MQ101.GetStageDone(MQ101LodgeStage) == False) && (MQ101.IsCompleted() == False)
            Self.BlockActivation()
        Else
            GotoState("HasBeenTriggered")
        EndIf
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        Actor PlayerREF = Game.GetPlayer()
        If akActionREF == PlayerREF
            ;error out if player is in combat or being pursued by guards
            If PlayerREF.IsInCombat() || Game.IsGuardPursuingPlayer()
                NotAllowedDuringCombat.Show()
            ElseIf (LodgeFrontDoorOpen == False) && (PlayerREF.GetValue(PlayerUnityTimesEntered) == 0) && (MQ101.GetStageDone(MQ101LodgeStage) == False) && (MQ101.IsCompleted() == False)
                LodgeDoorLayer = InputEnableLayer.Create()
                LodgeDoorLayer.DisablePlayerControls(abCamSwitch=True, abLooking=True)
                RegisterForRemoteEvent(PlayerREF, "OnItemUnequipped")
                RegisterForAnimationEvent(PlayerREF, "Activate")
                Game.ForceFirstPerson()

                ;play wait if player has weapon out
                If PlayerREF.IsWeaponDrawn()
                    PlayerREF.SheatheWeapon()
                    Utility.Wait(2.0)
                EndIf

                Utility.Wait(0.1)
                PlayerREF.UnequipItemSlot(3) ;unequip armor in the body slot
                PlayerREF.UnequipItemSlot(8) ;unequip armor in the sleeves slot
                PlayerREF.UnequipItemSlot(35) ;unequip armor in the spacesuit slot

                PlayerREF.EquipItem(Clothes_Chronomark_Mq101, absilent=true) ;make sure we have the watch equipped
                Utility.Wait(0.1)
                PlayerREF.PlayIdle(IdleDoorWatch) ;play animation
                Utility.Wait(7.0)
                Self.PlayAnimation("Play01")
                StartTimer(FailsafeTimerLength, FailsafeTimerID) ;run failsafe timer
            Else
                GotoState("HasBeenTriggered")
                ;activate door and unblock in the future
                Self.BlockActivation(false)
                LodgeFrontDoorOpen=True
                Self.Activate(akActionRef)
            EndIf
        EndIf
    EndEvent

    Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
        Actor PlayerREF = Game.GetPlayer()
        If akSender == PlayerREF
            If StorePlayerArmor == None
                StorePlayerArmor = akBaseObject as Armor
            Else
                StorePlayerSuit = akBaseObject as Armor
            EndIf
        EndIf
    EndEvent

    Event OnAnimationEvent(ObjectReference akSource, string asEventName)
        Actor PlayerREF = Game.GetPlayer()
        if asEventName == "Activate"
            WatchAnimFinished()
        EndIf
    EndEvent

    Event OnTimer(int aiTimerID)
        WatchAnimFinished()
    EndEvent
EndState

State HasBeenActivated
    Event OnLoad()
        ;do nothing
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        ;do nothing
    EndEvent

    Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
        ;do nothing
    EndEvent

    Event OnTimer(int aiTimerID)
        ;do nothing
    EndEvent
EndState

Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
    ;do nothing
EndEvent

Function WatchAnimFinished()
    GotoState("HasBeenTriggered")
    CancelTimer(FailsafeTimerID)
    Actor PlayerREF = Game.GetPlayer()
    LodgeDoorLayer = None ;clear control lock

    ;re-equip armors taken off
    If StorePlayerArmor != None
        PlayerREF.EquipItem(StorePlayerArmor, absilent=true)
    EndIf

    If StorePlayerSuit != None
        PlayerREF.EquipItem(StorePlayerSuit, absilent=true)
    EndIf

    PlayerREF.RemoveItem(Clothes_Chronomark_Mq101, absilent=true)

    ;activate door and unblock in the future
    Self.BlockActivation(false)
    LodgeFrontDoorOpen=True
    Self.Activate(PlayerREF)
    UnRegisterForRemoteEvent(PlayerREF, "OnItemUnequipped")
EndFunction