Scriptname FXScripts:MagicFXLandingRaycasts extends ActiveMagicEffect
{Test script for ship landing effects.}

ImpactDataSet Property ThrusterDustKickupImpacts Auto Const Mandatory
{The impact set that will be spawned from the ship thrusters.}
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property ImpactRange = 50.0 Auto Const 
float Property ImpactCloseRange = 15.0 Auto Const 

bool bPlayImpactEffects = false
int ImpactTimer = 10
ObjectReference ObjRef

Event OnInit()
	ObjRef = self.GetTargetActor() as ObjectReference
	If ObjRef
		debug.trace("*FX* : Raycaster has initialized and " + ObjRef + " is the TargetActor.")
	EndIf
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	;;if ObjRef.Is3DLoaded()
		ObjRef = akTarget as Actor
		If ObjRef
			RegisterForAnimationEvent(akTarget, "StartImpactFX")
			RegisterForAnimationEvent(akTarget, "StopImpactFX")
		EndIf
	;;EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	If ObjRef
		bPlayImpactEffects = False
		UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
		UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.Trace("SourceRef is " + akSource + " and Event is " + asEventName)
	if asEventName == "StartImpactFX"
		bPlayImpactEffects = true
		debug.trace("Starting Timer for Landing Animation")
		StartTimer(ImpactRecastDelay, ImpactTimer)
	EndIf

	if asEventName == "StopImpactFX"
		debug.trace("Finished FXAnimation Sequence")
		bPlayImpactEffects = False
	EndIf
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == ImpactTimer
		if bPlayImpactEffects == True
			ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0, 0, -1, ImpactRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster02", 0, 0, -1, ImpactRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster03", 0, 0, -1, ImpactRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster04", 0, 0, -1, ImpactRange, true, false)

			ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0, 0, -1, ImpactCloseRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster02", 0, 0, -1, ImpactCloseRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster03", 0, 0, -1, ImpactCloseRange, true, false)
			ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster04", 0, 0, -1, ImpactCloseRange, true, false)
			StartTimer(ImpactRecastDelay, ImpactTimer)
		endif
	endif
EndEvent
