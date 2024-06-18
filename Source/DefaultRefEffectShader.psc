Scriptname DefaultRefEffectShader extends ObjectReference Const default
{Default script used for applying an effect shader on the reference when it loads loads into a cell, or when the cell loads around it.}

EffectShader Property FXS Auto Const
Bool Property ApplyOnLoad Auto Const

Event OnLoad()
	if (ApplyOnLoad)
	FXS.Play(Self)
	EndIf
EndEvent


