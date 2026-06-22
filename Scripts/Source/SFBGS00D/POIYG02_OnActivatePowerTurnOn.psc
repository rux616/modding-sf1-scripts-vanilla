Scriptname SFBGS00D:POIYG02_OnActivatePowerTurnOn extends ObjectReference
{Turn the elevator on}

Keyword Property LinkCustom01 auto const mandatory
Keyword Property LinkCustom02 auto const mandatory

Auto State Waiting
    Event OnActivate(ObjectReference akActionRef)
        LoadElevatorManagerScript manager = GetLinkedRef() as LoadElevatorManagerScript
        manager.SetElevatorOperational(true)
        BlockActivation()

	GetLinkedRef(LinkCustom01).BlockActivation(false)
	;For the storage door
	GetLinkedRef(LinkCustom02).Disable()
	;For the light

        GotoState("Done")
    EndEvent
EndState

State Done 
EndState