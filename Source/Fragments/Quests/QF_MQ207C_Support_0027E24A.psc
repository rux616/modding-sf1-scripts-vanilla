;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ207C_Support_0027E24A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Set by: Ethan Speech Challenge Success dialogue.

;Give the player the weapon they won.
Game.GetPlayer().AddItem(MQ207C_LL_Weapon_Cataxi)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set by: MQ207C_Nishina01_SecurityOfficeTerminalMenu_ArchivedFiles, traits entry.

;Give the player a free trait scan for reading the terminal entry.
Actor player = Game.GetPlayer()
SQ_ParentScript:PlanetTraitData traitData = SQ_Parent.FindMatchingPlanetTraitForKeyword(PlanetTrait19PsychotropicBiota, player.GetCurrentPlanet())
SQ_Parent.UpdatePlanetTraitDiscovery(player, traitData, 1)
MQ207C_SurveyDataDownloadedMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set by: Maria's dialogue, Professor option.

;Give the player some credits.
Game.GetPlayer().AddItem(MQ207C_LL_MinorReward_Credits)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
;Set by: Maria's dialogue, Probe Control Unit turn-in.

;Take the Probe Control Unit.
Actor player = Game.GetPlayer()
player.RemoveItem(MQ207C_ProbeControlUnit)

;Give the player some credits.
player.AddItem(MQ207C_LL_MinorReward_Credits)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set by: Doctor's dialogue, intro.

;Give the player some MedPacks.
Game.GetPlayer().AddItem(MQ207C_LL_MedPacks)

;Complete MQ207C's optional objective, if appropriate.
MQ207C.SetStage(572)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Set by: Doctor's dialogue, journal scene.

;Take the journal from the player.
Game.GetPlayer().RemoveItem(MQ207C_Nishina01_DrBarakovaSlate_II)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
;Set by: Doctor's dialogue, journal scene.

;Give the player some extra medical supplies.
Actor player = Game.GetPlayer()
player.AddItem(MQ207C_LL_MedSupplies)

;Give the player a 25% discount on Barakova's prices.
player.AddPerk(MQ207C_BarakovaPriceModPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set by: Trigger in the Nishina Exterior, near the entry door.

;When the player hits the trigger, start the intercom scene.
MQ207C_110_EntranceIntercom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE MQ207CSupportQuestScript
Quest __temp = self as Quest
MQ207CSupportQuestScript kmyQuest = __temp as MQ207CSupportQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Complete MQ207C_110_EntranceIntercom.

;Unregister for activation events on the door.
kMyQuest.UnregisterForExteriorDoorEvents()

;Notify MQ207C to unlock the doors and proceed.
MQ207C.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set by: DefaultOnLocationChange script, PlayerShip alias.
;The player has left Nishina after completing the quest.

;Enable the postquest scientists.
Alias_Nishina02_I_ScientistEnableMarker.TryToEnable()
Alias_Nishina02_I_ScientistDisableMarker.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SQ_parentscript Property SQ_Parent Auto Const Mandatory
Quest Property MQ207C Auto Const Mandatory
Scene Property MQ207C_110_EntranceIntercom Auto Const Mandatory
Perk Property MQ207C_BarakovaPriceModPerk Auto Const Mandatory
Book Property MQ207C_Nishina01_DrBarakovaSlate_II Auto Const Mandatory
Message Property MQ207C_SurveyDataDownloadedMessage Auto Const Mandatory
Keyword Property PlanetTrait19PsychotropicBiota Auto Const Mandatory
LeveledItem Property MQ207C_LL_Weapon_Cataxi Auto Const Mandatory
LeveledItem Property MQ207C_LL_MedPacks Auto Const Mandatory
LeveledItem Property MQ207C_LL_MedSupplies Auto Const Mandatory
LeveledItem Property MQ207C_LL_MinorReward_Credits Auto Const Mandatory
MiscObject Property MQ207C_ProbeControlUnit Auto Const Mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistEnableMarker Auto Const Mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistDisableMarker Auto Const Mandatory
RefCollectionAlias Property Alias_Nishina02_SkillMagazines Auto Const Mandatory
