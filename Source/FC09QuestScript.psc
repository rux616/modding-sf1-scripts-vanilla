Scriptname FC09QuestScript extends Quest

LocationAlias Property akilacity Mandatory Const Auto
ReferenceAlias Property RewardShip Mandatory Const Auto

Function RefillCriticalAliases()
    akilacity.RefillAlias()
    RewardShip.RefillAlias()
EndFunction