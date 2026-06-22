Scriptname City_NA_Well01_LightScript extends ReferenceAlias

ObjectReference Property Myself Auto

Function SwapState()

Myself = Self.GetReference()

if MyGlobal.GetValueInt()== 0
	MyGlobal.SetValue(1)
;	Myself.SetOpen(True)
	Myself.PlayAnimation("Play01")
else
	MyGlobal.SetValue(0)
;	Myself.SetOpen(False)
	Myself.PlayAnimation("Play02")
endif


EndFunction
Quest Property City_NA_Well01 Auto Const Mandatory

GlobalVariable Property MyGlobal Auto
