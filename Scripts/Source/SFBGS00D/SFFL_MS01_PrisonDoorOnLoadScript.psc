Scriptname SFBGS00D:SFFL_MS01_PrisonDoorOnLoadScript extends ObjectReference Const

GlobalVariable Property SFFL_MS01_PrisonDoorUnlocked Mandatory Const Auto

Event OnLoad()
    If SFFL_MS01_PrisonDoorUnlocked.GetValue() == 1
        SetLockLevel(0)
        Lock(false)
    EndIf
EndEvent