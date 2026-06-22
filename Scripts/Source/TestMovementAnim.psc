scriptName TestMovementAnim extends Actor

import FormList
import Debug
import Utility

float frampTime = 0.25
float fstrafingTime = 3.0
float fcircleStrafeTime = 5.0
float floopingTurnTime = 5.0
float ftestTurningAtSpeed = 5.0

float fslowWalkSpeed = 0.5
float fwalkSpeed = 1.0
float fjogSpeed = 1.5
float frunSpeed = 2.0

;Run all the tests.
Function RunAllTests()
	Notification("Starting Movement Anim Stress Test")
	RunStrafingTest()
	ClearForcedMovement()
	Wait(2.0)
	RunLoopingTurnTest()
	ClearForcedMovement()
	Wait(2.0)
	RunTurningTest()
	ClearForcedMovement()
	Wait(2.0)
	RunMoveAndTurnToTurnInPlaceTests()
	ClearForcedMovement()
	Wait(2.0)
	RunCircleStrafeTest()
	ClearForcedMovement()
	Wait(2.0)
	RunSwervingTest()
	ClearForcedMovement()
	Wait(2.0)
	RunRampingTest()
	ClearForcedMovement()
	Wait(2.0)
	RunBlendTests()
	ClearForcedMovement()
	Wait(2.0)
	RunTurnAroundWhileMovingTest()
	ClearForcedMovement()
	Notification("Movement Anim Stress Test Complete")
EndFunction

Function RunAllTestsNoStrafe()
	Notification("Starting Movement Anim Stress Test")
	RunForwardBackwardTest()
	RunLoopingTurnTest()
	ClearForcedMovement()
	Wait(2.0)
	RunTurningTest()
	ClearForcedMovement()
	Wait(2.0)
	RunMoveAndTurnToTurnInPlaceTests()
	ClearForcedMovement()
	Wait(2.0)
	RunSwervingTest()
	ClearForcedMovement()
	Wait(2.0)
	RunRampingTest()
	ClearForcedMovement()
	Wait(2.0)
	RunBlendTests()
	ClearForcedMovement()
	Notification("Movement Anim Stress Test Complete")
EndFunction

Function RunStrafingTest()
	Notification("Testing Strafing")
	Notification("Testing Strafing at Slow Walk Speed")
	TestStrafingAtSpeed(fslowWalkSpeed)
	Notification("Testing Strafing at Walk Speed")
	TestStrafingAtSpeed(fwalkSpeed)
	Notification("Testing Strafing at Jog Speed")
	TestStrafingAtSpeed(fjogSpeed)
	Notification("Testing Strafing at Run Speed")
	TestStrafingAtSpeed(frunSpeed)
EndFunction

Function RunForwardBackwardTest()
	Notification("Testing Forward / Backward movement")
	Notification("Testing Forward / Backward at Slow Walk Speed")
	TestForwardBackwardAtSpeed(fslowWalkSpeed)
	Notification("Testing Forward / Backward at Walk Speed")
	TestForwardBackwardAtSpeed(fwalkSpeed)
	Notification("Testing Forward / Backward at Jog Speed")
	TestForwardBackwardAtSpeed(fjogSpeed)
	Notification("Testing Forward / Backward at Run Speed")
	TestForwardBackwardAtSpeed(frunSpeed)
EndFunction

Function RunLoopingTurnTest()
	Notification("Testing Looping Turns")
	; Slow Walk Speed
	; Right
	Notification("Testing looping turn right at slow walk speed")
	TestLoopingTurn(fslowWalkSpeed)
	;Left
	Notification("Testing looping turn left at slow walk speed")
	TestLoopingTurn(-fslowWalkSpeed)

	; Walk Speed
	; Right
	Notification("Testing looping turn right at walk speed")
	TestLoopingTurn(fwalkSpeed)
	;Left
	Notification("Testing looping turn left at walk speed")
	TestLoopingTurn(-fwalkSpeed)

	; Jog Speed
	; Right
	Notification("Testing looping turn right at jog speed")
	TestLoopingTurn(fjogSpeed)
	;Left
	Notification("Testing looping turn left at jog speed")
	TestLoopingTurn(-fjogSpeed)

	; Run Speed
	; Right
	Notification("Testing looping turn right at run speed")
	TestLoopingTurn(frunSpeed)
	;Left
	Notification("Testing looping turn left at run speed")
	TestLoopingTurn(-frunSpeed)
	Notification("Testing Looping Turns Complete")
EndFunction

Function RunTurningTest()
	Notification("Testing Turning")
	Notification("Testing Turning while at Slow Walk Speed")
	RunTurningAtSpeedTest(fslowWalkSpeed)
	Notification("Testing Turning while at Walk Speed")
	RunTurningAtSpeedTest(fwalkSpeed)
	Notification("Testing Turning while at Jog Speed")
	RunTurningAtSpeedTest(fjogSpeed)
	Notification("Testing Turning while at Run Speed")
	RunTurningAtSpeedTest(frunSpeed)

	Notification("Testing Turning Complete")
EndFunction

Function RunTurningAtSpeedTest(float afSpeed)
	Notification("Testing Turning at Slow Walk Speed")
	TestTurningAtSpeed(afSpeed, fslowWalkSpeed)
	Notification("Testing Turning at Walk Speed")
	TestTurningAtSpeed(afSpeed, fwalkSpeed)
	Notification("Testing Turning at Jog Speed")
	TestTurningAtSpeed(afSpeed, fjogSpeed)
	Notification("Testing Turning at Run Speed")
	TestTurningAtSpeed(afSpeed, frunSpeed)

	Notification("Testing Turning Complete")
EndFunction

Function RunCircleStrafeTest()
	Notification("Testing Turning while Strafing")
	ForceMovementDirection(afZAngle = 90.0)
	Notification("Testing Turning while Strafing at Slow Walk Speed")
	TestCircleStrafingAtSpeed(fslowWalkSpeed)
	Notification("Testing Turning while Strafing at Walk Speed")
	TestCircleStrafingAtSpeed(fwalkSpeed)
	Notification("Testing Turning while Strafing at at Jog Speed")
	TestCircleStrafingAtSpeed(fjogSpeed)
	Notification("Testing Turning while Strafing at at Run Speed")
	TestCircleStrafingAtSpeed(frunSpeed)

	ForceMovementDirection(afZAngle = 270.0)
	Notification("Testing Turning while Strafing at Slow Walk Speed")
	TestCircleStrafingAtSpeed(fslowWalkSpeed)
	Notification("Testing Turning while Strafing at Walk Speed")
	TestCircleStrafingAtSpeed(fwalkSpeed)
	Notification("Testing Turning while Strafing at at Jog Speed")
	TestCircleStrafingAtSpeed(fjogSpeed)
	Notification("Testing Turning while Strafing at at Run Speed")
	TestCircleStrafingAtSpeed(frunSpeed)
	Notification("Testing Turning Complete")
EndFunction

Function RunTurnAroundWhileMovingTest()
	Notification("Testing Turning around while slow walking")
	TestTurnAroundWhileAtSpeed(fslowWalkSpeed)
	Notification("Testing Turning around while walking")
	TestTurnAroundWhileAtSpeed(fwalkSpeed)
	Notification("Testing Turning around while jogging")
	TestTurnAroundWhileAtSpeed(fjogSpeed)
	Notification("Testing Turning around while running")
	TestTurnAroundWhileAtSpeed(frunSpeed)
EndFunction


Function RunSwervingTest()
	Notification("Testing swerving around while slow walking")
	RunSwervingTestAtMoveSpeed(fslowWalkSpeed)
	Notification("Testing swerving around while walking")
	RunSwervingTestAtMoveSpeed(fwalkSpeed)
	Notification("Testing swerving around while jogging")
	RunSwervingTestAtMoveSpeed(fjogSpeed)
	Notification("Testing swerving around while running")
	RunSwervingTestAtMoveSpeed(frunSpeed)
endFunction

Function RunSwervingTestAtMoveSpeed(float afMoveSpeed)
	Notification("Testing swerving at slowWalk turn speed")
	TestSwervingAtSpeed(afMoveSpeed, fslowWalkSpeed)
	Notification("Testing swerving at Walk turn speed")
	TestSwervingAtSpeed(afMoveSpeed, fwalkSpeed)
	Notification("Testing swerving at jog turn speed")
	TestSwervingAtSpeed(afMoveSpeed, fjogSpeed)
	Notification("Testing swerving at run turn speed")
	TestSwervingAtSpeed(afMoveSpeed, frunSpeed)
endFunction

Function RunRampingTest()
	Notification("Testing ramping between stop and slow walk")
	RunRampingTestBetweenSpeeds(0.0, fslowWalkSpeed)
	Notification("Testing ramping between stop and walk")
	RunRampingTestBetweenSpeeds(0.0, frunSpeed)
	Notification("Testing ramping between stop and walk")
	RunRampingTestBetweenSpeeds(0.0, frunSpeed)
	Notification("Testing ramping between slow walk and walk")
	RunRampingTestBetweenSpeeds(fslowWalkSpeed, fwalkSpeed)
	Notification("Testing ramping between walk and jog")
	RunRampingTestBetweenSpeeds(fwalkSpeed, fjogSpeed)
	Notification("Testing ramping between jog and run")
	RunRampingTestBetweenSpeeds(fjogSpeed, frunSpeed)
	Notification("Testing ramping between walk and run")
	RunRampingTestBetweenSpeeds(fwalkSpeed, frunSpeed)
endFunction

Function RunRampingTestBetweenSpeeds(float afMinSpeed, float afMaxSpeed)
	Notification("Testing 1 second ramp")
	TestRampSpeed(afMinSpeed, afMaxSpeed, 1.0, 3)
	Notification("Testing 0.5 second ramp")
	TestRampSpeed(afMinSpeed, afMaxSpeed, 0.5, 5)
	Notification("Testing 0.25 second ramp")
	TestRampSpeed(afMinSpeed, afMaxSpeed, 0.25, 10)
endFunction

Function RunBlendTests()
	Notification("Testing walk speed blend")
	TestForwardAndTurnBlends(fwalkSpeed - 0.1, 0.0, 0.01)
	Notification("Testing jog speed blend")
	TestForwardAndTurnBlends(fjogSpeed - 0.1, 0.0, 0.01)
	Notification("Testing run speed blend")
	TestForwardAndTurnBlends(frunSpeed - 0.1, 0.0, 0.01)
endFunction


Function RunMoveAndTurnToTurnInPlaceTests()
	Notification("Testing transition from moving while turning to turning")
	Notification("Testing at slow walk speed")
	TestMoveThenTurn(fslowWalkSpeed, fslowWalkSpeed)
	Notification("Testing at walk speed")
	TestMoveThenTurn(fWalkSpeed, fWalkSpeed)
	Notification("Testing at jog speed")
	TestMoveThenTurn(fjogSpeed, fjogSpeed)
	Notification("Testing at run speed")
	TestMoveThenTurn(frunSpeed, frunSpeed)
	Notification("Transition from moving while turning to turning test complete")
endFunction


Function RampSpeed(float afAngle, float afSpeed, float afTime, float afRampUpTime, float afRampDownTime)
	Notification("Testing at " + afAngle + " degrees")
	ForceMovementDirection(afZAngle = afAngle)
	ForceMovementSpeedRamp(afSpeed, afRampUpTime)
	Wait(afTime - afRampDownTime)
	ForceMovementSpeedRamp(0.0, afRampDownTime)
	Wait(afRampDownTime)
EndFunction

Function TestStrafingAtSpeed(float afSpeed)

	; Ramp in 8 directions
	float fangle = 0.0
	float fangleInc = 45.0
	While (fangle < 360)
		RampSpeed(fangle, afSpeed, fstrafingTime, frampTime, frampTime)
		RampSpeed(fangle + 180, afSpeed, fstrafingTime, frampTime, frampTime)
		fangle = fangle + fangleInc
	EndWhile

	; Circle right
	Notification("Testing Circling Right")
	ForceMovementDirection(afZAngle = 0.0)
	ForceMovementSpeedRamp(afSpeed, frampTime)
	Wait(frampTime)
	fangle = 0.0
	fangleInc = 10.0
	float fdeltaTime = fcircleStrafeTime * fangleInc / 360.0
	While (fangle < 360.0)
		ForceMovementDirectionRamp(afZAngle = fangle, afRampTime = fdeltaTime)
		Wait(fdeltaTime)
		fangle = fangle + fangleInc
	EndWhile
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

	; Circle left
	Notification("Testing Circling Left")
	ForceMovementDirection(afZAngle = 0.0)
	ForceMovementSpeedRamp(afSpeed, frampTime)
	Wait(frampTime)
	fangle = 360.0
	While (fangle > 0.0)
		ForceMovementDirectionRamp(afZAngle = fangle, afRampTime = fdeltaTime)
		Wait(fdeltaTime)
		fangle = fangle - fangleInc
	EndWhile
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

EndFunction

Function TestForwardBackwardAtSpeed(float afSpeed)
	RampSpeed(0.0, afSpeed, fstrafingTime, frampTime, frampTime)
	RampSpeed(180.0, afSpeed, fstrafingTime, frampTime, frampTime)
EndFunction

Function TestLoopingTurn(float afSpeed)
	Notification("Testing looping turn right at walk speed")
	ForceMovementRotationSpeedRamp(afZMult = afSpeed, afRampTime = frampTime)
	Wait(floopingTurnTime - frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	Wait(frampTime)
EndFunction


Function TestTurningAtSpeed(float afSpeed, float afTurnSpeed)

	; Right
	Notification("Testing Right Walk Turn Speed")
	ForceMovementSpeedRamp(afSpeed, frampTime)
	ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed, afRampTime = frampTime)
	Wait(ftestTurningAtSpeed - frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

	; Left
	Notification("Testing Left Walk Turn Speed")
	ForceMovementSpeedRamp(afSpeed, frampTime)
	ForceMovementRotationSpeedRamp(afZMult = -afTurnSpeed, afRampTime = frampTime)
	Wait(ftestTurningAtSpeed - frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

EndFunction

Function TestCircleStrafingAtSpeed(float afSpeed)

	; Right
	Notification("Testing Right Walk Turn Speed")
	ForceMovementSpeedRamp(afSpeed, frampTime)
	ForceMovementRotationSpeedRamp(afZMult = fwalkSpeed, afRampTime = frampTime)
	Wait(fcircleStrafeTime - frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

	; Left
	Notification("Testing Left Walk Turn Speed")
	ForceMovementSpeedRamp(afSpeed, frampTime)
	ForceMovementRotationSpeedRamp(afZMult = -fwalkSpeed, afRampTime = frampTime)
	Wait(fcircleStrafeTime - frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

EndFunction

Function TestTurnAroundWhileAtSpeed(float afMoveSpeed)

	ForceMovementSpeedRamp(afMoveSpeed, frampTime)
	ForceMovementDirection(afZAngle = 0.0)
	Wait(2.0)
	ForceMovementRotationSpeedRamp(afZMult = -fwalkSpeed, afRampTime = frampTime)
	float fangle = 0.0
	float fangleInc = 10.0
	float fdeltaTime = 2.0 * fangleInc / 360.0
	While (fangle < 360.0)
		ForceMovementDirectionRamp(afZAngle = fangle, afRampTime = fdeltaTime)
		Wait(fdeltaTime)
		fangle = fangle + fangleInc
	EndWhile
	ForceMovementDirectionRamp(afZAngle = 0.0, afRampTime = frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	Wait(frampTime)
	Wait(2.0)

	ForceMovementRotationSpeedRamp(afZMult = fwalkSpeed, afRampTime = frampTime)
	fangle = 360.0
	fangleInc = 10.0
	fdeltaTime = 2.0 * fangleInc / 360.0
	While (fangle > 0.0)
		ForceMovementDirectionRamp(afZAngle = fangle, afRampTime = fdeltaTime)
		Wait(fdeltaTime)
		fangle = fangle - fangleInc
	EndWhile
	ForceMovementDirectionRamp(afZAngle = 0.0, afRampTime = frampTime)
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	Wait(frampTime)
	Wait(2.0)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

EndFunction

Function TestRampSpeed(float afMinSpeed, float afMaxSpeed, float afRampTime, int icount)

	ForceMovementSpeedRamp(afMinSpeed, frampTime)
	ForceMovementRotationSpeed(afZMult = 0.0)
	ForceMovementDirection(afZAngle = 0.0)
	Wait(frampTime)
	int i = 0
	While(i < icount)
		ForceMovementSpeedRamp(afMaxSpeed, afRampTime)
		Wait(afRampTime)
		ForceMovementSpeedRamp(afMinSpeed, afRampTime)
		Wait(afRampTime)
		i = i + 1
	endWhile
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

endFunction

Function TestSwervingAtSpeed(float afMoveSpeed, float afSwerveSpeed)

	ForceMovementSpeedRamp(afMoveSpeed, frampTime)
	ForceMovementRotationSpeed(afZMult = 0.0)
	ForceMovementDirection(afZAngle = 0.0)
	Wait(frampTime)
	int icount = 0
	While(icount < 10)
		ForceMovementRotationSpeedRamp(afZMult = afSwerveSpeed, afRampTime = frampTime)
		Wait(frampTime)
		ForceMovementRotationSpeedRamp(afZMult = -afSwerveSpeed, afRampTime = frampTime)
		Wait(frampTime)
		icount = icount + 1
	endWhile
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)

endFunction

Function TestForwardAndTurnBlends(float afMoveSpeed, float afTurnSpeed, float afTurnSpeedDelta)

	ForceMovementSpeedRamp(afMoveSpeed, frampTime)
	ForceMovementRotationSpeed(afZMult = afTurnSpeed)
	ForceMovementDirection(afZAngle = 0.0)
	Wait(frampTime)
	int icount = 0
	While(icount < 10)
		ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed - afTurnSpeedDelta, afRampTime = frampTime)
		Wait(RandomFloat(0.1, 0.5))
		ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed, afRampTime = frampTime)
		Wait(RandomFloat(0.1, 0.5))
		ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed + afTurnSpeedDelta, afRampTime = frampTime)
		Wait(RandomFloat(0.1, 0.5))
		ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed, afRampTime = frampTime)
		Wait(RandomFloat(0.1, 0.5))
		icount = icount + 1
	endWhile
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	ForceMovementSpeedRamp(0.0, frampTime)
	Wait(frampTime)
endFunction


Function TestMoveThenTurn(float afMoveSpeed, float afTurnSpeed)
	TestMoveInDirectionThenTurn(0.0, afMoveSpeed, afTurnSpeed)
	TestMoveInDirectionThenTurn(0.0, afMoveSpeed, -afTurnSpeed)
	TestMoveInDirectionThenTurn(180.0, afMoveSpeed, afTurnSpeed)
	TestMoveInDirectionThenTurn(180.0, afMoveSpeed, -afTurnSpeed)
endFunction


Function TestMoveInDirectionThenTurn(float afDirection, float afMoveSpeed, float afTurnSpeed)
	; Start walking forward
	ForceMovementSpeedRamp(afMoveSpeed, frampTime)
	ForceMovementRotationSpeed(afZMult = 0.0)
	ForceMovementDirection(afZAngle = afDirection)

	; Wait to reach full stride
	Wait(1.0)
	
	; Start turning
	ForceMovementRotationSpeedRamp(afZMult = afTurnSpeed, afRampTime = frampTime)
	Wait(1.0)

	; Ramp speed back down
	ForceMovementSpeedRamp(0.0, frampTime)

	; Keep turning in place for a while
	Wait(2.0)

	; Stop Turning
	ForceMovementRotationSpeedRamp(afZMult = 0.0, afRampTime = frampTime)
	Wait(frampTime)
endFunction

Function RunDirectionSmoothingTest()
	Game.SetCameraTarget(self)
	wait(5.0)
	Notification("Testing Direction Smoothing")
	Notification("Testing Strafing at Slow Walk Speed")
	TestDirectionSmoothingAtSpeed(fslowWalkSpeed)
	Notification("Testing Strafing at Walk Speed")
	TestDirectionSmoothingAtSpeed(fwalkSpeed)
	Notification("Testing Strafing at Jog Speed")
	TestDirectionSmoothingAtSpeed(fjogSpeed)
	Notification("Testing Strafing at Run Speed")
	TestDirectionSmoothingAtSpeed(frunSpeed)
EndFunction

Function TestDirectionSmoothingAtSpeed(float afSpeed)
	; Ramp in 8 directions
	float fangle = 0.0
	float fangleInc = 45.0
	While (fangle < 360)
		ForceTargetSpeed(afSpeed)
		ForceTargetDirection(afZAngle = fangle)
		wait(3.0)
		ForceTargetDirection(afZAngle = fangle + 180.0)
		wait(3.0)
		fangle = fangle + fangleInc
	EndWhile
	ForceTargetSpeed(0.0)
	wait(1.0)
endFunction

