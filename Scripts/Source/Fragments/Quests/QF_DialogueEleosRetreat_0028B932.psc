;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueEleosRetreat_0028B932 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
Game.GetPlayer().AddPerk(Persuasion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(25)
Utility.Wait(1.0)
DialogueEleosRetreat_OpeningScene.Stop()
SetStage(40)
SetStage(50)
SetStage(2000)
Utility.Wait(2.0)
Game.GetPlayer().MoveTo(ER_Dead_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
DialogueEleosRetreat_OpeningScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_DukeHalftown.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Give the player the misc pointer to Sloan
if !City_ER_Dead.GetStageDone(100)
  City_ER_Dead_Misc.Start()
  SetStage(2000)
endif

Alias_NevanBohn.GetActorRef().EvaluatePackage()
Alias_SloanTemitope.GetActorRef().EvaluatePackage()
Alias_DukeHalftown.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, NPCDemandMoney_Medium.GetValueInt())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0116_Item_00
Function Fragment_Stage_0116_Item_00()
;BEGIN CODE
SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
PlayerKnows_EleosRetreat.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
SetStage(900)
SetStage(910)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
;Close out misc pointer
City_ER_Peace_Misc.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
City_ER_Dead.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN CODE
Alias_EnableMarkers.EnableAll()

;Give Greg a weapon 
Actor GregACT = Alias_GregDAngelo.GetActorRef()
GregAct.AddItem(LLW_Ammo_Eon, 1)
GregAct.AddItem(LL_Weapon_Eon_Simple, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueEleosRetreat_OpeningScene Auto Const Mandatory

ReferenceAlias Property Alias_AkachiBlum Auto Const Mandatory

ReferenceAlias Property Alias_DukeHalftown Auto Const Mandatory

Message Property ER_DEBUG_MiscPointerToSloan Auto Const Mandatory

Message Property ER_DEBUG_StartsUpQuest Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Perk Property Persuasion Auto Const Mandatory

Quest Property City_ER_Dead_Misc Auto Const Mandatory

Quest Property City_ER_Dead Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker01 Auto Const Mandatory

RefCollectionAlias Property Alias_EnableMarkers Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property PlayerKnows_EleosRetreat Auto Const Mandatory

Quest Property City_ER_Peace_Misc Auto Const Mandatory

ReferenceAlias Property Alias_NevanBohn Auto Const Mandatory

ReferenceAlias Property Alias_SloanTemitope Auto Const Mandatory

LeveledItem Property LLW_Ammo_Eon Auto Const Mandatory

ReferenceAlias Property Alias_GregDAngelo Auto Const Mandatory

LeveledItem Property LL_Weapon_Eon_Simple Auto Const Mandatory
