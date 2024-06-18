Scriptname BE_KT02_GravitySwitchScript extends ObjectReference

bescript Property BE_KT02 Auto Const Mandatory

WwiseEvent Property PowerON Auto Const Mandatory

WwiseEvent Property PowerOFF Auto Const Mandatory

ReferenceAlias Property Alias_EnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Minibot Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

Function GravitySwitch()
ObjectReference PlayerRef = Game.GetPlayer()
Float myGravity = PlayerRef.GetGravityScale()
    if myGravity == 0
        BE_KT02.SetShipGravity(1)
        PowerON.Play(PlayerRef)
        Alias_EnableMarker.GetRef().EnableNoWait()
        Alias_AllCrew.EvaluateAll()
    else
        BE_KT02.SetShipGravity(0)
        PowerOFF.Play(PlayerRef)
        Alias_EnableMarker.GetRef().DisableNoWait()
        Alias_Minibot.GetActorRef().EvaluatePackage()
    endif
    Self.BlockActivation(false)
    goToState("Waiting")
endFunction

auto State waiting
    Event OnActivate(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
            goToState("Busy")
            Self.BlockActivation(true, true)
            GravitySwitch()
        endif
    EndEvent
endState

state Busy
endState