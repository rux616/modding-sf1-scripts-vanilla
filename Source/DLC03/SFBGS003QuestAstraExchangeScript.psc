Scriptname DLC03:SFBGS003QuestAstraExchangeScript extends Quest

GlobalVariable Property SFBGS003_Astras_SmallAmount Mandatory Const Auto
GlobalVariable Property SFBGS003_Astras_MedAmount Mandatory Const Auto
GlobalVariable Property SFBGS003_Astras_LargeAmount Mandatory Const Auto
Message Property SFBGS003_AstrasErrorMSG Mandatory Const Auto
MiscObject Property Astra Mandatory Const Auto
LeveledItem Property SFBGS003_LL_Astras_1Star Mandatory Const Auto
LeveledItem Property SFBGS003_LL_Astras_2Star Mandatory Const Auto
LeveledItem Property SFBGS003_LL_Astras_3Star Mandatory Const Auto

Guard AstraExchangeDataGuard ProtectsFunctionLogic

;When called, checks to make sure the player has the required number of Astras, then gives the appropriate level of of item.
Function AstraExchange(Int aiAstras)
    LockGuard AstraExchangeDataGuard
        Actor myPlayer = Game.GetPlayer()
        If myPlayer.GetItemCount(Astra) >= aiAstras
            If aiAstras == SFBGS003_Astras_SmallAmount.GetValue()
                myPlayer.RemoveItem(Astra, aiAstras)
                myPlayer.AddItem(SFBGS003_LL_Astras_1Star)
            ElseIf aiAstras == SFBGS003_Astras_MedAmount.GetValue()
                myPlayer.RemoveItem(Astra, aiAstras)
                myPlayer.AddItem(SFBGS003_LL_Astras_2Star)
            ElseIf aiAstras == SFBGS003_Astras_LargeAmount.GetValue()
                myPlayer.RemoveItem(Astra, aiAstras)
                myPlayer.AddItem(SFBGS003_LL_Astras_3Star)
            EndIf
        Else
            SFBGS003_AstrasErrorMSG.Show()
        EndIf
    EndLockGuard
EndFunction