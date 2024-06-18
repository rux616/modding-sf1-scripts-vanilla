;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_PEO_SustenanceQuest_FE000040_2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE PEO:PEO_SustenanceStart
Quest __temp = self as Quest
PEO:PEO_SustenanceStart kmyQuest = __temp as PEO:PEO_SustenanceStart
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

PlayerRef.equipitem(PEO_WellFedPotion, absilent = true)
PEO_WellFed_Msg.show()
PlayerRef.equipitem(NEW_PEO_WellHydratedPotion, absilent = true)
PEO_WellHydrated_Msg.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property PEO_WellFedPotion Auto Const Mandatory

Potion Property NEW_PEO_WellHydratedPotion Auto Const Mandatory

Message Property PEO_WellHydrated_Msg Auto Const Mandatory

Message Property PEO_WellFed_Msg Auto Const Mandatory
