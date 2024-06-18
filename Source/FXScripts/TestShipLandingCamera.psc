Scriptname FXScripts:TestShipLandingCamera extends ObjectReference
{Test script for ship landing effects.}

ObjectReference Property GroundCameraMarker Auto Const Mandatory

ObjectReference ObjRef
string sTakeoffEvent = "TakeOff"
string sLandingEvent = "Land"

Event OnInit()
	ObjRef = Self as ObjectReference
EndEvent

Event OnLoad()
	if self.Is3DLoaded()
	    RegisterForAnimationEvent(ObjRef, sLandingEvent)
	    RegisterForAnimationEvent(ObjRef, sTakeoffEvent)
	EndIf
EndEvent

Event OnUnLoad()
    UnRegisterForAnimationEvent(ObjRef, sLandingEvent)
    UnRegisterForAnimationEvent(ObjRef, sTakeoffEvent)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.Trace("SourceRef is " + akSource + " and Event is " + asEventName)
	if asEventName == sLandingEvent
		GroundCameraMarker.PlayAnimation(sLandingEvent)
		debug.trace("Starting Timer for Landing Animation")
	EndIf

	if asEventName == sTakeoffEvent
		GroundCameraMarker.PlayAnimation(sTakeoffEvent)
		debug.trace("Finished FXAnimation Sequence")
	EndIf
EndEvent

;old sequences PlayLandingFX PlayTakeOffFX