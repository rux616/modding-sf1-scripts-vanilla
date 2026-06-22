;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_MS03_Support_010357F5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SFFL_MS03.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_FreelancersRename.AddRefCollection(Alias_Freelancers)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
If PlayerRef.GetItemCount(SFFL_MS03_Food) <= 0
   PlayerRef.AddAliasedItem(SFFL_MS03_Food, Alias_MilliwhaleFood, 1, False)
Else
   PlayerRef.RemoveItem(SFFL_MS03_Food, -1, True)
   PlayerRef.AddAliasedItem(SFFL_MS03_Food, Alias_MilliwhaleFood, 1, True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Atka.GetActorRef().EvaluatePackage()
Alias_Yura.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Atka.GetActorRef().EvaluatePackage()
Alias_Yura.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_Support_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_Support_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_Support_QuestScript
;END AUTOCAST
;BEGIN CODE
SFFL_MS03_YuraAndRomanTogether.SetValue(0)
kmyQuest.PostQuestSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_Support_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_Support_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_Support_QuestScript
;END AUTOCAST
;BEGIN CODE
SFFL_MS03_YuraAndRomanTogether.SetValue(1)
kmyQuest.PostQuestSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_Support_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_Support_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_Support_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FailQuestSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_Support_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_Support_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_Support_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetHostileAH()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5500_Item_00
Function Fragment_Stage_5500_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_Support_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_Support_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_Support_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetHostileAPorGarage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFFL_MS03_YuraAndRomanTogether Auto Const Mandatory

Quest Property SFFL_MS03 Auto Const Mandatory

ReferenceAlias Property Alias_Atka Auto Const Mandatory

ReferenceAlias Property Alias_Yura Auto Const Mandatory

RefCollectionAlias Property Alias_Freelancers Auto Const Mandatory

RefCollectionAlias Property Alias_FreelancersRename Auto Const Mandatory

ReferenceAlias Property Alias_MilliwhaleFood Auto Const Mandatory

MiscObject Property SFFL_MS03_Food Auto Const Mandatory
