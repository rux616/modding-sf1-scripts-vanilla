Scriptname TestLandingPlatformAnimation extends ObjectReference
{Test script for animating the landing platform in New Atlantis.}

ObjectReference Property PlatformRef Auto Const

String Property sAnimEvent Auto Const
String Property sWakeAnimEvent Auto Const


Event OnLoad()
	Debug.Trace(self + " is trying to load and register for animations.")
  if !self.IsDisabled()
  		if (self.Is3DLoaded())
   		 	If (!RegisterForAnimationEvent(self, sWakeAnimEvent))
  			Debug.Trace("Failed to register for event!")
			EndIf
   		endif
  endif
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	;We only want to listen for the sAnimEvent if we have already recieved the wake event.
	if asEventName == sWakeAnimEvent
		RegisterForAnimationEvent(Self, sAnimEvent)
	endif
	if asEventName == sAnimEvent
		PlatformRef.PlayAnimation("Stage2")
	endif
EndEvent