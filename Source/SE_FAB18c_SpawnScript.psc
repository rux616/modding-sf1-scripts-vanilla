Scriptname SE_FAB18c_SpawnScript extends Quest

Event OnQuestStarted()
	if ( MS02_GenghisReactivity.GetValue()==3 )     ; 3 is the state where Genghis has a chance to just show up
        ; Now let's do a random roll to see if Genghis is going to show up this time
        Float fRoll = Utility.RandomInt(1,100) as Float
        if ( fRoll <= MS02_GenghisSpawnChance.GetValue() )
            if ShipToCheck.GetRef() != none
                RegisterForDistanceLessThanEvent(PlayerShip, ShipToCheck, 2000.0)
            else
                StartTimer(FallbackTimer, iTimerID)
            endif
        EndIf
    EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    SpawnGenghisShip()
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iTimerID
        SpawnGenghisShip()
    endif    
EndEvent

Function SpawnGenghisShip()
    Utility.Wait(TimeToWait)
    MS02_Genghis_SE_ID.SetValue(SE_ID)  ; This is how FAB18c knows which quest sent it
                                        ; 1 = SE_KMK02
    SE_Player_FAB18c.Start()            ; Then spin up Genghis
EndFunction

Quest Property SE_Player_FAB18c Auto Const Mandatory
GlobalVariable Property MS02_GenghisSpawnChance Auto Const Mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const Mandatory
GlobalVariable Property MS02_Genghis_SE_ID Auto Const Mandatory
Float Property SE_ID Auto Const
Float Property TimeToWait Auto Const
Float Property FallbackTimer = 7.0 Const Auto
ReferenceAlias Property ShipToCheck Auto Const
ReferenceAlias Property PlayerShip Auto Const
int iTimerID = 1 Const
