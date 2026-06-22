Scriptname FXScripts:FXShipDropCollection extends ObjectReference
{This Script applies a Visual Effect.}

EffectShader Property EffectShaderToApply Auto Const Mandatory
{This is the visue effect that will be used.}

bool done = False

Event OnLoad()
	if !done
		if Self.IsDisabled() == false
			if Self.Is3DLoaded()
				EffectShaderToApply.Play(Self)
				done = True
				Debug.trace("OnLoad for " + Self + ". Trying to play effect: " + EffectShaderToApply)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnUnLoad()
		EffectShaderToApply.Stop(Self)
EndEvent