Scriptname FXScripts:FXLandingRaycasts extends ObjectReference
{Test script for ship landing effects.}

ImpactDataSet Property ThrusterDustKickupImpacts Auto Const Mandatory
{The impact set that will be spawned from the ship thrusters.}
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property ImpactRange = 50.0 Auto Const 
float Property ImpactCloseRange = 15.0 Auto Const 
string Property ThrusterRayCaster01 = "FX_LightEngBig" Auto Const 

bool bPlayImpactEffects = false
int ImpactTimer = 10



; Event OnInit()
; 	ObjectReference TestRef = Self as ObjectReference
; 	ObjectReference ObjRef = self as ObjectReference
; 	if TestRef.IsBoundGameObjectAvailable()
; 		Debug.trace(self + "------- LandingFX Self is  : " + Self)
; 		Debug.trace(self + "------- LandingFX ObjRef is: " + TestRef)

; 		Cell ShipCell = TestRef.GetParentCell()
; 		Debug.trace(self + "------- LandingFX Cell is: " + ShipCell)

; 		SpaceshipReference ShipRef = ShipCell.GetParentRef() as SpaceshipReference
; 		Debug.trace(self + "------- LandingFX Ship is: " + ShipRef)
; 		;ObjRef = TestRef

; 		RegisterForRemoteEvent(ShipRef, "OnShipLanding")
; 		RegisterForRemoteEvent(ShipRef, "OnShipTakeOff")
; 	EndIf
; EndEvent

; Event SpaceShipReference.OnShipLanding(SpaceShipReference akSender, bool abComplete)
; 	ObjectReference ObjRef = self as ObjectReference
; 	;Cell ShipCell = Self.GetParentCell()
; 	;ObjectReference ShipRef = ShipCell.GetParentRef()
; 	Debug.trace(self + "------- OnShipLanding event fired for: " + ObjRef)
; 	if abComplete == false
; 	    RegisterForAnimationEvent(ObjRef, "StartImpactFX")
; 	    RegisterForAnimationEvent(ObjRef, "StopImpactFX")
; 	Else
; 		bPlayImpactEffects = False
; 		UnRegisterForAnimationEvent(ObjRef, "StartImpactFX")
; 	    UnRegisterForAnimationEvent(ObjRef, "StopImpactFX")
; 	EndIf
; EndEvent

; Event SpaceShipReference.OnShipTakeOff(SpaceShipReference akSender, bool abComplete)
; 	ObjectReference ObjRef = self as ObjectReference
; 	;Cell ShipCell = Self.GetParentCell()
; 	;ObjectReference ShipRef = ShipCell.GetParentRef()
; 	Debug.trace(self + "------- OnShipTakeoff event fired for: " + ObjRef)
; 	if abComplete == false
; 	    RegisterForAnimationEvent(ObjRef, "StartImpactFX")
; 	    RegisterForAnimationEvent(ObjRef, "StopImpactFX")
; 	Else
; 		bPlayImpactEffects = False
; 		UnRegisterForAnimationEvent(ObjRef, "StartImpactFX")
; 	    UnRegisterForAnimationEvent(ObjRef, "StopImpactFX")
; 	EndIf
; EndEvent

Event OnLoad()
	ObjectReference ObjRef = self as ObjectReference
	debug.Trace(self + "Landing Raycasts: "+ ObjRef + " is loaded.")
 	bPlayImpactEffects = True
    RegisterForAnimationEvent(ObjRef, "StartImpactFX")
    RegisterForAnimationEvent(ObjRef, "StopImpactFX")
EndEvent

Event OnUnLoad()
	ObjectReference ObjRef = self as ObjectReference
	debug.Trace(self + "Landing Raycasts: "+ ObjRef + " is UNLOADED.")
 	bPlayImpactEffects = False
    UnRegisterForAnimationEvent(ObjRef, "StartImpactFX")
    UnRegisterForAnimationEvent(ObjRef, "StopImpactFX")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.Trace(self + "SourceRef is " + akSource + " and Event is " + asEventName)
	if asEventName == "StartImpactFX"
		bPlayImpactEffects = true
		debug.trace(self + "Starting Timer for ImpactFX Animation")
		StartTimer(ImpactRecastDelay, ImpactTimer)
	EndIf

	if asEventName == "StopImpactFX"
		debug.trace(self + "Finished ImpactFX Sequence")
		bPlayImpactEffects = False
	EndIf
EndEvent

Event OnTimer(int aiTimerID)
	ObjectReference ObjRef = self as ObjectReference
	if aiTimerID == ImpactTimer
		if bPlayImpactEffects == True
			debug.trace(self + "FIRE")
			ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, ThrusterRayCaster01, 0, 0, -1, ImpactRange, false, false)
			;ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster02", 0, 0, -1, ImpactRange, true, false)
			;ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster03", 0, 0, -1, ImpactRange, true, false)
			;ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster04", 0, 0, -1, ImpactRange, true, false)

			ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, ThrusterRayCaster01, 0, 0, -1, ImpactCloseRange, false, false)
			;ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster02", 0, 0, -1, ImpactCloseRange, true, false)
			;ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster03", 0, 0, -1, ImpactCloseRange, true, false)
			;ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster04", 0, 0, -1, ImpactCloseRange, true, false)
			StartTimer(ImpactRecastDelay, ImpactTimer)
		endif
	endif
EndEvent
