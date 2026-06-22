Scriptname SFBGS00D:SFBGS00DDR01ConveyorBeltScript extends ObjectReference 
{Initializes conveyor belt}

bool Property bStartsOn = true auto const
bool Property bStartsReversed = false auto const
Float Property fConveyorSpeedX = 0.0 auto const
Float Property fConveyorSpeedY = 1.0 auto const
Float Property fConveyorSpeedZ = 0.0 auto const

;initializes conveyor belt functionality
Event OnLoad()
    ApplyConveyorBelt("ConveyorBeltsNode", fConveyorSpeedX, fConveyorSpeedY, fConveyorSpeedZ, bStartsOn, bStartsReversed)
EndEvent
