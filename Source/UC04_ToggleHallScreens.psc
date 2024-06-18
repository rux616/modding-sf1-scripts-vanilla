Scriptname UC04_ToggleHallScreens extends Quest

RefCollectionAlias Property MinisterHall_Screens Mandatory Const Auto
{Collection that contains all the screens in the Minister's Hall}

Function UpdateHallScreens(bool bTurnOn = true)
    int i = 0
    int iCount = MinisterHall_Screens.GetCount()

    While (i < iCount)
        ObjectReference currACT = MinisterHall_Screens.GetAt(i)

        if bTurnOn
            currACT.PlayAnimation("Stage01_Start")
        else
            currACT.PlayAnimation("Stage01_Stop")
        endif
        
        i += 1
    EndWhile
EndFunction