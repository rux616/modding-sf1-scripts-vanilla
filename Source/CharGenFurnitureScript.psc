Scriptname CharGenFurnitureScript extends ObjectReference Const

Event OnLoad()
	RegisterForAnimationEvent(Game.GetPlayer(), "CharacterGenStart")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	UnRegisterForAnimationEvent(Game.GetPlayer(), "CharacterGenStart")
	Game.ShowRaceMenu()
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
	;register for animation again
	If akActionRef == Game.GetPlayer()
		RegisterForAnimationEvent(Game.GetPlayer(), "CharacterGenStart")
	EndIf
EndEvent