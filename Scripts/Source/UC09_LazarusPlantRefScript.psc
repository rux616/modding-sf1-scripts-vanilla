Scriptname UC09_LazarusPlantRefScript extends ObjectReference Const

GlobalVariable Property UC09_CleanUpLazarusPlant Auto Const Mandatory
{Global used to determine if the player decided to destroy all the Lazarus Plant}

Event OnLoad()
    if !IsDisabled() && UC09_CleanUpLazarusPlant.GetValueInt() > 0
        Disable()
    endif
EndEvent