Scriptname SFBGS00D:SSFL_SE_EC06_QuestScript extends Quest
{Quest script for EC06, used to keep track of dead pirate ships}

RefCollectionAlias Property PirateShips Auto Const Mandatory

ReferenceAlias[] Property PirateShipArray Auto Const Mandatory

Int Property PirateShipCount = 0 Auto

Function FillPirateShipsAlias()
    ;Copy content of PirateShipArray into PirateShips
    PirateShips.RemoveAll()
    int icount = PirateShipArray.Length
    while (icount > 0)
        icount -= 1
        PirateShips.AddRef(PirateShipArray[icount].GetRef())
    EndWhile
EndFunction

Function CheckPirateDeaths()

    Debug.Trace("EC06: Checking to see if all priate ships are dead.")

    if (PirateShips.GetCountDead() >= PirateShipCount)
        ;Stopping quest as all pirates are dead
        Stop()
    EndIf
    
EndFunction
