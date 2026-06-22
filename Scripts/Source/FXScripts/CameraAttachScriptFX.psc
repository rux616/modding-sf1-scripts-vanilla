Scriptname FXScripts:CameraAttachScriptFX extends ObjectReference  
{Attaches a camera attach fx based on the property set in the reference.}
;===============================================

;import debug				; import debug.psc for acces to trace()
import game				; game.psc for access to getPlayer()
;import utility			; utility.psc for access to wait()

VisualEffect Property CameraAttachFX Const Auto 
{Particle art to attach to camera, fog by default}
VisualEffect Property CameraAttachFX2 Const Auto 
{2nd Particle art to attach to camera, not used by default}
WwiseEvent property LoopSoundEvent Const auto
{specify sound fx to play, set on reference, none by default}
int instanceID ;used to store sound ref
int Property timeLimit = 180 Const Auto

int TriggerCounter = 0
actor Player
;===============================================

Event OnLoad()
	debug.trace("========EVENT CAMERAFX OnLoad: "+self+" ===========")
	Player = getPlayer()
endEvent

EVENT OnTriggerEnter(ObjectReference akActionRef)
	debug.trace("Testing trace just to see if it works.")
	debug.trace("========EVENT CAMERAFX OnTriggerEnter: "+akActionRef+" ===========")
	IF (akActionRef == Player as ObjectReference)
		TriggerCounter += 1
		if TriggerCounter > 0
			CameraAttachFX.Play(Player, timeLimit)	
			;debug.trace("Triggered by player")
			if (CameraAttachFX2)
				CameraAttachFX2.Play(Player, timeLimit)
			endif
			if (LoopSoundEvent)
				instanceID = LoopSoundEvent.Play(Self)
			endif
		endif
	endif
endEvent

EVENT OnTriggerLeave(ObjectReference akActionRef)
	IF (akActionRef == Player as ObjectReference)
		TriggerCounter -= 1
		CameraAttachFX.Stop(Player)
		if (CameraAttachFX2)
			CameraAttachFX2.Stop(Player)
		endif
		if (LoopSoundEvent)
			WwiseEvent.StopInstance(instanceID)
		endif
		;goToState ("waiting")
	ENDIF
ENDEVENT

Event OnCellDetach()
	TriggerCounter = 0
	CameraAttachFX.Stop(Player)
	if (CameraAttachFX2)
		CameraAttachFX2.Stop(Player)
	endif
	if (LoopSoundEvent)
		WwiseEvent.StopInstance(instanceID)
	endif
ENDEVENT

EVENT OnUnLoad()
	TriggerCounter = 0
	CameraAttachFX.Stop(Player)
	if (CameraAttachFX2)
		CameraAttachFX2.Stop(Player)
	endif
	if (LoopSoundEvent)
		WwiseEvent.StopInstance(instanceID)
	endif
	Player = none
	;;goToState ("waiting")
ENDEVENT
	
	