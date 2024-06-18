Scriptname DialogueCydoniaQuestScript extends Quest

GlobalVariable Property DialogueCydonia_HorusAid_CooldownTime Mandatory Const Auto
LeveledItem Property LL_CY_HorusGift Mandatory Const Auto
Float Property CooldownTimerDays = 7.0 Const Auto
RefCollectionAlias Property AllMiners Mandatory Const Auto
Weapon Property Cutter Mandatory Const Auto

Function HorusAid()
    Game.GetPlayer().AddItem(LL_CY_HorusGift, 1)
    SetCooldown()
EndFunction

;Sets the cooldown time for Horus's aid to the current game time, plus a number of days (per the local planet). 
;This will be checked via condition on the NPC's dialogue so they won't offer the quest until the GameDaysPassed Global exceeds this Global value.
Function SetCooldown()
    Float fDayLength = (Game.GetPlayer().GetCurrentPlanet()).GetDayLength()
    DialogueCydonia_HorusAid_CooldownTime.SetValue(Utility.GetCurrentGameTime() + (fDayLength * CooldownTimerDays))
EndFunction


;Miners start with a "worn" version of the cutter. If the miner has a cutter in their inventory, remove it. 
;Then, give them another standard cutter and if the previous cutter was equipped, have them equip it. Otherwise, just give them a new one in their inventory.
Function SwapCutters()
    Bool bCutterEquipped
    Int i
    Int iCount = AllMiners.GetCount()
    While i < iCount
        Actor myMiner = AllMiners.GetAt(i) as Actor
        If myMiner.GetItemCount(Cutter) > 0 && myMiner.IsDead() == 0
            If myMiner.IsEquipped(Cutter)
                bCutterEquipped = 1
            Else
                bCutterEquipped = 0
            EndIf
            myMiner.RemoveItem(Cutter)
            myMiner.AddItem(Cutter)
            If bCutterEquipped == 1
                myMiner.EquipItem(Cutter)
            EndIf
        EndIf
        i += 1
    EndWhile
EndFunction