Scriptname HKDelayInitialHavokActivation extends ObjectReference Const
{Disables havok and then enables again after a delay.  Used for constrained attach refs linked to elevators.}

Float Property fHavokDelayTime = 0.5 Auto Const
{Seconds to wait before starting havok.}

EVENT onLoad()
	if (Self.Is3DLoaded())
		setMotionType(Motion_Keyframed, TRUE)
		utility.wait(fHavokDelayTime)
		setMotionType(Motion_Dynamic, TRUE)
		
		; Call SetPosition to force the physics of the handle to warp to the new position.
		SetPosition(GetPositionX(), GetPositionY(), GetPositionZ())
	endif
endEVENT