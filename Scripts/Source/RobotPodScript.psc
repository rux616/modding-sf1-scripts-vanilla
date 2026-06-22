Scriptname RobotPodScript extends Actor 

bool property isInPod = True Auto Conditional
{Set to FALSE to have Robot start on its patrol. TRUE to start inside of pod}

Keyword property DMP_LinkRobotPod Auto Const Mandatory
{Robot Pod Link Keyword}

;If this Robot has a pod, send them to it; otherwise set them unconscious
Function SendRobotToPod()
	debug.trace(self+ " SendRobotToPod")
	if IsDead() == false
		ObjectReference myPod = GetLinkedRef(DMP_LinkRobotPod)
		if myPod
			isInPod = true
			EvaluatePackage()
		Else
			; if no pod, just set unconscious
			SetUnconscious()
		endif
	EndIf
EndFunction

;wake up this robot
Function WakeRobotFromPod()
	debug.trace(self+ " WakeRobotFromPod")
	if IsDead() == false
		; wake me up
		SetUnconscious(false)
		; if I have a pod, get me out of it
		ObjectReference myPod = GetLinkedRef(DMP_LinkRobotPod)
		if myPod
			isInPod = false
			EvaluatePackage()
		EndIf
	EndIf
EndFunction

;Set robot to unconscious once robot returns to his pod.
Event OnSit(ObjectReference akFurniture)
	Debug.Trace("We just sat on " + akFurniture)
	if akFurniture == GetLinkedRef(DMP_LinkRobotPod)
		SetUnconscious()
	endif
endEvent

bool function HasPod()
	return (GetLinkedRef(DMP_LinkRobotPod) != NONE)
EndFunction

