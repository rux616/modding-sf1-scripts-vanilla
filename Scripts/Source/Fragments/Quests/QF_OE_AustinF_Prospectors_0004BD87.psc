;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_Prospectors_0004BD87 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_NPCDialogue01.GetRef().MoveToNearestNavmeshLocation()
Alias_NPCDialogue01.GetActorRef().EquipItem(Cutter, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_NPCDialogue01.GetActorRef().EvaluatePackage()

If !GetStageDone(275)
   SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Alias_NPCDialogue01.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_NPCDialogue01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
Alias_NPCDialogue01.GetActorRef().AddToFaction( PlayerEnemyFaction )
Alias_NPCDialogue01.GetActorRef().StartCombat( Game.GetPlayer() )
Alias_NPCDialogue01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
If GetStageDone(800) 
   SetStage(920)
ElseIf GetStageDone(275)
   SetStage(920)
Else 
   SetStage(910)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
Alias_RockpilePackin.GetRef().AddItem(LL_Quest_Reward_GrabBag_Small)
Alias_RewardMarker.GetRef().AddItem(LL_Quest_Reward_GrabBag_Small)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const

RefCollectionAlias Property Alias_Predators_FactionA_Herd Auto Const Mandatory

Scene Property OE_AustinF_ProspectorScene01 Auto Const

ReferenceAlias Property Alias_NPCDialogue01 Auto Const Mandatory

Weapon Property Cutter Auto Const

Faction Property PlayerEnemyFaction Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_GrabBag_Small Auto Const Mandatory

ReferenceAlias Property Alias_RockpilePackin Auto Const Mandatory

ReferenceAlias Property Alias_RewardMarker Auto Const Mandatory
