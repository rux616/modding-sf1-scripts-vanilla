Scriptname StarbornPuzzleScript extends ObjectReference

ObjectReference Property FirstPositionMarker Mandatory Const Auto
ObjectReference Property SecondPositionMarker Mandatory Const Auto
ObjectReference Property ThirdPositionMarker Mandatory Const Auto
ObjectReference Property FourthPositionMarker Mandatory Const Auto

ObjectReference Property Ring Mandatory Const Auto
ObjectReference Property OtherRing1 Mandatory Const Auto
ObjectReference Property OtherRing2 Mandatory Const Auto
ObjectReference Property mySoundMarker Mandatory Const Auto
ObjectReference Property MasterDummy Mandatory Const Auto

WwiseEvent Property sTurning Mandatory Const Auto

int Property iCurrentPosition = 1 Auto

auto State FirstPosition
    Event OnActivate(ObjectReference akActionRef)
        iCurrentPosition = 2
        GotoState("Waiting")
        ;ShrinkOtherRings()
        Ring.TranslateToRef(SecondPositionMarker, 20.0, 20)
        Shake()
        sTurning.Play(mySoundMarker)
        utility.Wait(4.5)
        ;GrowOtherRings()
        GotoState("SecondPosition")
    EndEvent
EndState
State SecondPosition
    Event OnActivate(ObjectReference akActionRef)
        iCurrentPosition = 3
        GotoState("Waiting")
        ;ShrinkOtherRings()
        Ring.TranslateToRef(ThirdPositionMarker, 20.0, 20)
        Shake()
        sTurning.Play(mySoundMarker)
        utility.Wait(4.5)
        ;GrowOtherRings()
        GotoState("ThirdPosition")
    EndEvent   
EndState
State ThirdPosition
    Event OnActivate(ObjectReference akActionRef)
        iCurrentPosition = 4
        GotoState("Waiting")
        ;ShrinkOtherRings()
        Ring.TranslateToRef(FourthPositionMarker, 20.0, 20)
        Shake()
        sTurning.Play(mySoundMarker)
        utility.Wait(4.5)
        ;GrowOtherRings()
        GotoState("FourthPosition")
    EndEvent 
EndState
State FourthPosition
    Event OnActivate(ObjectReference akActionRef)
        iCurrentPosition = 1
        GotoState("Waiting")
        ;ShrinkOtherRings()
        Ring.TranslateToRef(FirstPositionMarker, 20.0, 20)
        Shake()
        sTurning.Play(mySoundMarker)
        utility.Wait(4.5)
        ;GrowOtherRings()
        GotoState("FirstPosition")
    EndEvent 
EndState

State Waiting
    ;do nothing
EndState

Function Shake()
    Game.ShakeCamera(none, 0.2, 3)
;	Game.ShakeController(0.2, 0.2, 3)
EndFunction

Function ShrinkOtherRings()
    OtherRing1.SetScale(0.98)
    OtherRing2.SetScale(0.98)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.96)
    OtherRing2.SetScale(0.96)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.94)
    OtherRing2.SetScale(0.94)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.92)
    OtherRing2.SetScale(0.92)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.9)
    OtherRing2.SetScale(0.9)
    utility.Wait(0.05)
EndFunction

Function GrowOtherRings()
    OtherRing1.SetScale(0.92)
    OtherRing2.SetScale(0.92)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.94)
    OtherRing2.SetScale(0.94)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.96)
    OtherRing2.SetScale(0.96)
    utility.Wait(0.05)
    OtherRing1.SetScale(0.98)
    OtherRing2.SetScale(0.98)
    utility.Wait(0.05)
    OtherRing1.SetScale(1)
    OtherRing2.SetScale(1)
    utility.Wait(0.05)
EndFunction


