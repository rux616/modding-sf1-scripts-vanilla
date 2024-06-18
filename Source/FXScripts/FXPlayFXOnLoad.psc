Scriptname FXScripts:FXPlayFXOnLoad extends ObjectReference 
{Places a activator on death.}

VisualEffect Property VisualEffectToApply Auto Const Mandatory


bool done = False

Event OnLoad()
	if !done
		if Self.IsDisabled() == false
			if Self.Is3DLoaded()
				VisualEffectToApply.Play(Self)
				done = True
				Debug.trace("OnLoad for " + Self + ". Trying to play effect: " + VisualEffectToApply)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnUnLoad()
		VisualEffectToApply.Stop(Self)
EndEvent

