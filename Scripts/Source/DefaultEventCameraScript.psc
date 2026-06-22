Scriptname DefaultEventCameraScript extends ObjectReference conditional

GlobalVariable property CameraAngle auto const
{Prefixed with "EC_Angle"}

GlobalVariable property CameraMove auto const
{Prefixed with "EC_Move"}

CameraShot Property CameraShotToPlay Auto Const

float Camera_Angle conditional
float Camera_Move conditional

Event OnInit()
	Camera_Angle = CameraAngle.GetValue()
	Camera_Move = CameraMove.GetValue()
EndEvent

Function Play()
	Game.PlayEventCamera(CameraShotToPlay, self)

EndFunction