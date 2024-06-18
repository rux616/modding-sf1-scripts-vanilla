Scriptname CF01QuestScript extends Quest

Faction property CrimeFactionUC auto const mandatory
{ UC crime faction for handling jail/bounty/etc. }

function SendPlayerToJail()
    CrimeFactionUC.SendPlayerToJail()
endFunction

function ModCrimeGold(int amount)
    CrimeFactionUC.ModCrimeGold(amount)
endFunction

function RemovePlayerContraband()
    CrimeFactionUC.RemovePlayerContrabandAndStolenItems()
endFunction