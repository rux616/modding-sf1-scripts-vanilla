Scriptname OnReadAddToMap extends ObjectReference Const

ObjectReference Property MapMarker Auto Const

Event OnRead()
	debug.trace(Self +" has been read")
    Mapmarker.AddToMapScanned()
EndEvent
