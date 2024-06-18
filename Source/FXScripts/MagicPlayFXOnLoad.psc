Scriptname FXScripts:MagicPlayFXOnLoad extends ActiveMagicEffect 
{Places a activator on death.}

VisualEffect Property VisualEffectToApply Auto Const Mandatory

ObjectReference ObjRef
bool done = False

Event OnInit()
    ObjRef = GetTargetActor()
	If ObjRef
	    Debug.trace("JumpFX Target is: " + ObjRef)
	EndIf
EndEvent

Event OnLoad()
	if ObjRef && !done
		if ObjRef.IsDisabled() == false
			if ObjRef.Is3DLoaded()
				VisualEffectToApply.Play(ObjRef)
				done = True
				Debug.trace("OnLoad for " + ObjRef + ". Trying to play effect: " + VisualEffectToApply)
			EndIf
		EndIf
	EndIf
EndEvent

 Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
 	if ObjRef && !done
 		done = true
    	VisualEffectToApply.play(akCaster)
 	EndIf
 EndEvent

Event OnUnLoad()
	if ObjRef
		VisualEffectToApply.Stop(ObjRef)
	EndIf
EndEvent

