Scriptname SFBGS00D:SFBGS00D_ApplyPerkTimer extends Quest
;This script gives the player a boost to harvesting handled by a Perk for 30 minutes once they complete an Exotic Supply Mission.  

Perk Property SFBGS00D_SupplyMissionReward_HarvestingBonus Mandatory Auto   
float Property PerkEndTime Mandatory Auto  
Quest Property MB_Supply04Exotic Auto
int Property CompletedStage = 100 Mandatory Auto
Message Property SFBGS00D_PerkMessage Mandatory Auto 
Message Property SFBGS00D_EndPerkMessage Mandatory Auto

Event OnInit()
  RegisterForRemoteEvent(MB_Supply04Exotic, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
    if ((akSender == MB_Supply04Exotic) && (auiStageID == 100))
        Game.GetPlayer().AddPerk(SFBGS00D_SupplyMissionReward_HarvestingBonus)
        StartTimer(PerkEndTime,1)
        SFBGS00D_PerkMessage.Show()
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == 1 
        Game.GetPlayer().RemovePerk(SFBGS00D_SupplyMissionReward_HarvestingBonus)
        SFBGS00D_EndPerkMessage.Show()
    EndIf
EndEvent