Scriptname DefaultTopicInfoStopDialogueCamera extends TopicInfo Const default
{Stop Dialogue Cameras when this Info begins or ends}

Bool Property StopCameraOnBegin = True Const Auto
{If True (default), stop camera when the Info begins. If False then stop camera when the info ends.}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if StopCameraOnBegin == True
 		debug.trace(self + "stopping Dialogue Camera during Info OnBegin.")
  		Game.StopDialogueCamera()
  	endif
endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if StopCameraOnBegin == False
 		debug.trace(self + "stopping Dialogue Camera during Info OnEnd.")
  		Game.StopDialogueCamera()
  	endif
endEvent