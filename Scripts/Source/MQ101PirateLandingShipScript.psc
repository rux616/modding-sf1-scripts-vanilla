Scriptname MQ101PirateLandingShipScript extends ReferenceAlias

Quest Property MQ101LandingEncounter01 Auto Const

Auto State WaitingToTrigger
	Event OnShipLanding(bool abComplete)
		If MQ101LandingEncounter01.IsRunning() == False
			GotoState("hasbeentriggered")
			MQ101LandingEncounter01.Start()
		EndIf
	EndEvent
EndState

State HasBeenTriggered
	;empty state
EndState