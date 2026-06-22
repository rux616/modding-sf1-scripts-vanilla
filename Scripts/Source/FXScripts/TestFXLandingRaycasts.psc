Scriptname FXScripts:TestFXLandingRaycasts extends ObjectReference
{Test script for ship landing effects.}

ImpactDataSet Property ThrusterDustKickupImpacts Auto Const Mandatory
{The impact set that will be spawned from the ship thrusters.}
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}
ImpactDataSet Property ThrusterFireMidRangeKickupImpacts Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property ImpactRange = 45.0 Auto Const 
float Property ImpactMidRange = 13.0 Auto Const 
float Property ImpactCloseRange = 7.0 Auto Const 

bool bPlayImpactEffects = false
int ImpactTimer = 10
ObjectReference ObjRef



Event OnLoad()
	ObjectReference TestRef = Self as ObjectReference
	if TestRef.IsBoundGameObjectAvailable()
		Debug.trace("------- LandingFX Self is  : " + Self)
		Debug.trace("------- LandingFX ObjRef is: " + TestRef)

		Cell ShipCell = TestRef.GetParentCell()
		Debug.trace("------- LandingFX Cell is: " + ShipCell)

		ObjectReference ShipRef = ShipCell.GetParentRef()
		Debug.trace("------- LandingFX Ship is: " + ShipRef)
		ObjRef = TestRef

		RegisterForRemoteEvent(ShipRef as SpaceshipReference, "OnShipLanding")
		RegisterForRemoteEvent(ShipRef as SpaceshipReference, "OnShipTakeOff")
	EndIf
EndEvent

Event SpaceshipReference.OnShipLanding(SpaceshipReference akSender, bool abComplete)
	Cell ShipCell = Self.GetParentCell()
	ObjectReference ShipRef = ShipCell.GetParentRef()
	Debug.trace("------- OnShipLanding event fired for: " + ObjRef)
	if ShipRef
		if abComplete == false
			RegisterForAnimationEvent(ShipRef, "StartImpactFX")
			RegisterForAnimationEvent(ShipRef, "StopImpactFX")
		Else
			bPlayImpactEffects = False
			UnRegisterForAnimationEvent(ShipRef, "StartImpactFX")
			UnRegisterForAnimationEvent(ShipRef, "StopImpactFX")
		EndIf
	endif
EndEvent

Event SpaceshipReference.OnShipTakeOff(SpaceshipReference akSender, bool abComplete)
	Cell ShipCell = Self.GetParentCell()
	ObjectReference ShipRef = ShipCell.GetParentRef()
	Debug.trace("------- OnShipTakeoff event fired for: " + ObjRef)
	if ShipRef
		if abComplete == false
			RegisterForAnimationEvent(ShipRef, "StartImpactFX")
			RegisterForAnimationEvent(ShipRef, "StopImpactFX")
		Else
			bPlayImpactEffects = False
			UnRegisterForAnimationEvent(ShipRef, "StartImpactFX")
			UnRegisterForAnimationEvent(ShipRef, "StopImpactFX")
		EndIf
	endif
EndEvent

; Event OnUnLoad()
; 	bPlayImpactEffects = False
;     UnRegisterForAnimationEvent(ObjRef, "StartImpactFX")
;     UnRegisterForAnimationEvent(ObjRef, "StopImpactFX")
; EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.Trace("SourceRef is " + akSource + " and Event is " + asEventName)
	if asEventName == "StartImpactFX"
		bPlayImpactEffects = true
		debug.trace("Starting Timer for ImpactFX Animation")
		StartTimer(ImpactRecastDelay, ImpactTimer)
	EndIf

	if asEventName == "StopImpactFX"
		debug.trace("Finished ImpactFX Sequence")
		bPlayImpactEffects = False
	EndIf
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == ImpactTimer
		if bPlayImpactEffects == True
			if ObjRef
				ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0, 0, -1, ImpactRange, true, false)
				ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0, 0, -1, ImpactCloseRange, true, false)
				ObjRef.PlayImpactEffect(ThrusterFireMidRangeKickupImpacts, "ThrusterRayCaster01", 0, 0, -1, ImpactMidRange, true, false)
			endif
			StartTimer(ImpactRecastDelay, ImpactTimer)
		endif
	endif
EndEvent
