Scriptname FXScripts:DebugImpactEffectRaycaster extends ObjectReference
{Test script for ImpactEffect Object.}

ImpactDataSet Property ImpactEffectRef01 Auto Const Mandatory
{The impact set that will be spawned from the ship thrusters.}
ImpactDataSet Property ImpactEffectRef02 Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}
ImpactDataSet Property ImpactEffectRef03 Auto Const Mandatory
{The impact set that will be spawned very close from the ship thrusters.}

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property Impact01Range = 50.0 Auto Const 
float Property Impact02Range = 15.0 Auto Const 
float Property Impact03Range = 20.0 Auto Const 

bool bPlayImpactEffects = false
int ImpactTimer = 10
ObjectReference ObjRef



; Event OnInit()
; 	ObjRef = Self as ObjectReference
; EndEvent

Event OnLoad()
  if !IsDisabled()
  		bPlayImpactEffects = True
		StartTimer(ImpactRecastDelay, ImpactTimer)
  endif
endEvent

Event OnUnLoad()
	bPlayImpactEffects = False
EndEvent

Event OnTimer(int aiTimerID)
	if IsDisabled()
		bPlayImpactEffects = False
	endif
	if aiTimerID == ImpactTimer
		if bPlayImpactEffects == True
			Self.PlayImpactEffect(ImpactEffectRef01, "", 0, 0, -1, Impact01Range, true, false)
			Self.PlayImpactEffect(ImpactEffectRef02, "", 0, 0, -1, Impact02Range, true, false)
			Self.PlayImpactEffect(ImpactEffectRef03, "", 0, 0, -1, Impact03Range, true, false)
			StartTimer(ImpactRecastDelay, ImpactTimer)
		endif
	endif
EndEvent
