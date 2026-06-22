Scriptname FFNewHomesteadR02QuestScript extends Quest

Int Property CostumeStage = 300 Const Auto
Int Property ReturnStage = 400 Const Auto
ReferenceAlias Property Tourist01 Mandatory Const Auto
Armor Property Clothes_Monster_Costume Mandatory Const Auto
Float Property CooldownTimerDays = 3.0 Const Auto
GlobalVariable Property FFNewHomesteadR02_CooldownTime Mandatory Const Auto

Function CheckDistanceForTourists()
    RegisterForDistanceLessThanEvent(Game.GetPlayer(), Tourist01.GetRef(), 20.0)
EndFunction

;Sets the cooldown time for this quest to the current game time, plus a number of days. 
;This will be checked via condition on the NPC's dialogue so they won't offer the quest until the GameDaysPassed Global exceeds this Global value.
Function SetCooldown()
    FFNewHomesteadR02_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CooldownTimerDays)
EndFunction


Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    If Game.GetPlayer().IsEquipped(Clothes_Monster_Costume) && GetStageDone(CostumeStage) && !GetStageDone(ReturnStage)
        SetStage(ReturnStage)
        UnregisterForDistanceEvents(Game.GetPlayer(), Tourist01.GetRef())
    Else 
        CheckDistanceForTourists()
    EndIf
EndEvent