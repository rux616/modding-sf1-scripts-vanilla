Scriptname SFBGS00D:SFBGS00D_HarvestBonusPerk extends Quest
{This script gives the player a 30min boost to their harvesting handled by a Perk once they complete an Exotic Supply Mission}  

Group AutoFill_Properties 
    Quest Property MB_Supply04Exotic Mandatory Auto Const
    Quest Property MB_Supply08Organic_Exotic  Mandatory Const Auto  
    Message Property SFBGS00D_HarvestBonus_StartPerkMessage Mandatory Auto Const
    Message Property SFBGS00D_HarvestBonus_EndPerkMessage Mandatory Auto Const
    Perk Property SFBGS00D_SupplyMissionReward_HarvestingBonus Mandatory Auto Const  
    ConditionForm Property SFBGS00D_HarvestBonus_ConditionForm Mandatory Const Auto
    Spell Property SFBGS00D_HarvestBonus_DurationDisplay Mandatory Const Auto   
EndGroup

int Property CompletedStage = 100 Mandatory Const Auto
int Property PerkDuration = 1800  Mandatory Const Auto 
int PerkTimerID = 1 Const

;We will not be unregistering because supply missions are repeatable quests and this script will always be running to listen for these two quests. 
Event OnInit()
    RegisterForRemoteEvent(MB_Supply04Exotic, "OnStageSet")
    RegisterForRemoteEvent(MB_Supply08Organic_Exotic , "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    If ((SFBGS00D_HarvestBonus_ConditionForm == true) &&  (auiStageID == CompletedStage))
        Game.GetPlayer().AddPerk(SFBGS00D_SupplyMissionReward_HarvestingBonus)
        StartTimer(PerkTimerID)
        SFBGS00D_HarvestBonus_StartPerkMessage.Show()
        SFBGS00D_HarvestBonus_DurationDisplay.Cast(Game.GetPlayer())
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == PerkTimerID 
        Game.GetPlayer().RemovePerk(SFBGS00D_SupplyMissionReward_HarvestingBonus)
        SFBGS00D_HarvestBonus_EndPerkMessage.Show()
    EndIf
EndEvent