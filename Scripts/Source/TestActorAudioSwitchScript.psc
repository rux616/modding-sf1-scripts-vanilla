Scriptname TestActorAudioSwitchScript extends ObjectReference Const

Scene Property SceneToStop Auto Const

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		SceneToStop.Stop()
	EndIf
EndEvent