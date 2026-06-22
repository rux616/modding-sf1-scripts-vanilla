Scriptname SE_FAB09_SpawnScript extends Quest Const

Int Property SE_Stage = 11 Auto Const
Quest Property SE_FAB09 Auto Const Mandatory
GlobalVariable Property SE_FAB09_SpawnChance Auto Const Mandatory

Event OnQuestInit()
    ; First let's roll some dice to see if FAB09 spawns
    int nChance = SE_FAB09_SpawnChance.GetValue() as int
    int nRoll = Utility.RandomInt(0, 100)
    Debug.Trace("Rolling for SE_FAB09: " + nRoll + " and the number to beat is " + nChance )
    if ( Utility.RandomInt(0, 100) <= nChance && !SE_FAB09.IsRunning() )
        Debug.Trace("SE_FAB09 will try to spin up.")
        ; If it's rolled well then SE_FAB09 will spawn on the player's ship location
        ;SE_FAB09.Start()
        SE_FAB09.SetStage(SE_Stage)     ; The specific stage that is set let's FAB09 know which POI SE it's reacting to
    endif
EndEvent
