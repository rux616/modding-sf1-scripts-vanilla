Scriptname QATests extends Quest

string sDisableVanity = "setIni \"bDisableAutoVanityMode:camera\" 1" const
string sScreenshot = "Screenshot" const


;some functionality required Debug.psc compiled locally or using Debug archives/
Function TestEquip(Actor ActorToEquip, Formlist FormlistToTest, float PauseDuration, bool RemoveAllFirst, bool TakeScreenshot)

    if RemoveAllFirst
        ActorToEquip.RemoveAllItems()
    endif

    if TakeScreenshot
        Debug.ExecuteConsole(sDisableVanity)
    endif

   int i = 0
   int iMax = FormlistToTest.GetSize()
   While (i < iMax)
       Form currentForm = FormlistToTest.GetAt(i) as Form
    
        ActorToEquip.EquipItem(currentForm, abPreventRemoval = false, abSilent = true)

        if TakeScreenshot
            Debug.ExecuteConsole(sScreenshot)
        endif

        Utility.Wait(PauseDuration)

       i += 1
   EndWhile
EndFunction