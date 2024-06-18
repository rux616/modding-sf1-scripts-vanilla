Scriptname ElevatorMeterScript extends ObjectReference Hidden Const

Bool Property StartOn = FALSE Auto Const
{ONLY FOR LOAD ELEVATORS!  If this meter is above the EXTERIOR door then this should be set to TRUE}

Bool Property StartMoving = FALSE Auto Const
{ONLY FOR LOAD ELEVATORS!  If this meter is above the INTERIOR door then this should be set to TRUE}


Event OnCellLoad()

	if StartOn
		self.WaitFor3DLoad()
    	PlayAnimation("StartOn")
    endif

    if StartMoving
		self.WaitFor3DLoad()
    	PlayAnimation("Play01")
    endif

EndEvent