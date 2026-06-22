Scriptname DR007CaveFallScript extends ObjectReference Const

ImageSpaceModifier Property FadeToBlack Mandatory Const Auto
ImageSpaceModifier Property StayBlack Mandatory Const Auto
ImageSpaceModifier Property FadeFromBlack Mandatory Const Auto

WwiseEvent Property sSplashEvent Mandatory Const Auto

ObjectReference Property SplashMarker Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    InputEnableLayer myLayer = InputEnableLayer.Create()
    myLayer.DisablePlayerControls()
    ;utility.Wait(2)
    ;FadeToBlack.Apply()
    ;utility.Wait(0.5)
    ;StayBlack.Apply()
    ;utility.Wait(2)
    ;int instanceID = sSplashEvent.play(SplashMarker)
    ;Sound.SetInstanceVolume(instanceID, 1)
    ;utility.Wait(2)
    ;FadeFromBlack.Apply()
    ;Utility.Wait(0.2)
    ;StayBlack.Remove()
    Utility.Wait(6)
    myLayer.EnablePlayerControls()
EndEvent
    