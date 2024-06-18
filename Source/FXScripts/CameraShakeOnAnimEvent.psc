Scriptname FXScripts:CameraShakeOnAnimEvent extends ObjectReference Const
{Shake the camera on an animation event}

String[] Property sAnimEventList Auto Const Mandatory

Float Property fCameraShake = 1.0 Auto Const
Float Property fCameraShakeDuration = 1.0 Auto Const

Function ShakeAndRumble(float fShakeAmount, float fShakeTime)
	Game.ShakeCamera(afStrength = fShakeAmount, afDuration = fShakeTime)
	Game.ShakeController(fShakeAmount, fShakeAmount, fShakeTime)
EndFunction

Event OnLoad()
	if (Self.Is3DLoaded())
		int i = 0
		while (i < sAnimEventList.length)
			RegisterForAnimationEvent(self, sAnimEventList[i])
			debug.Trace("EventName " + i + " is: " + sAnimEventList[i])
			i += 1
		EndWhile
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if sAnimEventList.Find(asEventName) < 0
	  return
	else
	  ShakeAndRumble(fCameraShake, fCameraShakeDuration)
	endIf
EndEvent

Event OnUnLoad()
	int i = 0
	while (i < sAnimEventList.length)
		UnRegisterForAnimationEvent(self, sAnimEventList[i])
		i += 1
	EndWhile
EndEvent