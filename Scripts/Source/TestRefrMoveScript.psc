Scriptname TestRefrMoveScript extends ObjectReference

ObjectReference Property MoveToRef Auto Const

Event OnLoad()
SplineTranslateToRef(MoveToRef, 100.0, 500.0, 10.0)
EndEvent

