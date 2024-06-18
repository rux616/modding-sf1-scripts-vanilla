Scriptname MQ101OutpostHarvesterScript extends ObjectReference Const

Location Property SystemNarionPlanetAnselonMoonNexum Auto Const Mandatory
Quest Property MQ101 Auto Const Mandatory

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	If Game.GetPlayer().IsInLocation(SystemNarionPlanetAnselonMoonNexum) && MQ101.GetStageDone(900) == 0
		MQ101.SetStage(740)
	EndIf
EndEvent

