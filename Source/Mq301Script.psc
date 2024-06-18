Scriptname Mq301Script extends Quest

Int Property MoonLogCountTotal=6 Const Auto
Int MoonLogCountCurrent
Int Property MoonLogsDoneStage=50 Const Auto
Int Property MoonLogObj=12 Const Auto
Int Property MoonLogsFirstStage=25 Const Auto

Function UpdateMoonLogCount()
    MoonLogCountCurrent += 1
    If MoonLogCountCurrent == MoonLogCountTotal
        SetStage(MoonLogsDoneStage)
    EndIf

	If GetStageDone(MoonLogsFirstStage) == False
		SetStage(MoonLogsFirstStage)
	EndIf
    SetObjectiveDisplayed(MoonLogObj)
EndFunction