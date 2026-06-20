Scriptname SFBGS00D:EquipmentModuleManagerScript extends Quest
{A script that manages the perks added to the player in order for Equipment Modules to work.}

Perk[] Property PerksToApply Mandatory Const Auto

Event OnQuestInit()
    actor Player = Game.GetPlayer()
    int i = 0

    While (i < PerksToApply.Length)
        Player.AddPerk(PerksToApply[i])
        i += 1
    EndWhile

EndEvent