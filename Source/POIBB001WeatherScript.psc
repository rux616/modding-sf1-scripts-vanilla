Scriptname POIBB001WeatherScript extends ObjectReference Const

Weather Property wStorm Mandatory Const Auto
ObjectReference Property DustMarker Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    self.Disable()
    wStorm.SetActive(true)
    Utility.Wait(40)
    DustMarker.Enable()
EndEvent

Event OnUnload()
    Weather.ReleaseOverride()
EndEvent