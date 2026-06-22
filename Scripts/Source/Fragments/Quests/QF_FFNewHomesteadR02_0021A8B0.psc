;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewHomesteadR02_0021A8B0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Giuliana.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_AllOtherTourists.DisableAll()

If FFNewHomesteadR02Misc.IsRunning()
	FFNewHomesteadR02Misc.SetStage(1000)
EndIf

Actor myPlayer = Game.GetPlayer()
myPlayer.AddAliasedItem(Clothes_Monster_Costume, Alias_MonsterCostume, 1, False)	

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE FFNewHomesteadR02QuestScript
Quest __temp = self as Quest
FFNewHomesteadR02QuestScript kmyQuest = __temp as FFNewHomesteadR02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

kmyQuest.CheckDistanceForTourists()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
FFNewHomesteadR02_0400_TouristsScene.Start()
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFNewHomesteadR02QuestScript
Quest __temp = self as Quest
FFNewHomesteadR02QuestScript kmyQuest = __temp as FFNewHomesteadR02QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_AllOtherTourists.EnableAll()
Game.GetPlayer().RemoveItem(Alias_MonsterCostume.GetRef())
kmyQuest.SetCooldown()
FFNewHomesteadR02_NumTimesCompleted.Mod(1)

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Giuliana Auto Const Mandatory

GlobalVariable Property FFNewHomesteadR02_NumTimesCompleted Auto Const Mandatory

Armor Property Clothes_Monster_Costume Auto Const Mandatory

ReferenceAlias Property Alias_MonsterCostume Auto Const Mandatory

Scene Property FFNewHomesteadR02_0400_TouristsScene Auto Const Mandatory

Quest Property FFNewHomesteadR02Misc Auto Const Mandatory

RefCollectionAlias Property Alias_AllOtherTourists Auto Const Mandatory
