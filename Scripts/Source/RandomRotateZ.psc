Scriptname RandomRotateZ extends ObjectReference Const

float Property RotationIncrement = 0.0 auto const
{Set to 0 to have a random rotation}

float Property TimeBetweenRotations = 10.0 auto const
{Time in seconds between updates to the rotation}

Event OnLoad()
    StartTimer(TimeBetweenRotations, 1)
EndEvent


Event OnTimer(int aiTimerID)
    if (RotationIncrement == 0)
        self.SetAngle(0, 0, Utility.RandomInt(0, 360))
    else
        self.SetAngle(0, 0, GetAngleZ() + RotationIncrement)
    endif
    StartTimer(TimeBetweenRotations, 1)
EndEvent