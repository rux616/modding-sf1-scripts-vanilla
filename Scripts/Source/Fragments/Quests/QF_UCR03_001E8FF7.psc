;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UCR03_001E8FF7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
TestGoToSpaceQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Cell ParentCell = Alias_spawnPointObj.GetAt(0).GetParentCell()
string cellHexFormID = Utility.IntToHex(ParentCell.GetFormID())
Debug.ExecuteConsole("coc " + cellHexFormID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_Enemies.KillAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE UCR03QuestScript
Quest __temp = self as Quest
UCR03QuestScript kmyQuest = __temp as UCR03QuestScript
;END AUTOCAST
;BEGIN CODE
;Generate the enemy seed
kmyquest.SelectEnemySeed()

;If we kicked this off from a debug start, mark the quest as active
if DialogueUCNewAtlantisUCFaction.GetStageDone(3)
  SetActive()
endif

SetObjectiveDisplayed(100)

;Close out Tuala's intro scene if we haven't already
if !DialogueUCNewAtlantisUCFaction.GetStageDone(550)
  DialogueUCNewAtlantisUCFaction.SetStage(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
UCR03_SpaceEncounter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE UCR03QuestScript
Quest __temp = self as Quest
UCR03QuestScript kmyQuest = __temp as UCR03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SpawnEnemies()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
UCR03_TimesCompleted.SetValue(UCR03_TimesCompleted.GetValue() + 1.0)
CompleteAllObjectives()
UCR03_SpaceEncounter.Stop()
UCR03_SpaceEncounter.Reset()
Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TestGoToSpaceQuest Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceCell Auto Const Mandatory

RefCollectionAlias Property Alias_spawnPointObj Auto Const Mandatory

Quest Property DialogueUCNewAtlantisUCFaction Auto Const Mandatory

GlobalVariable Property UCR03_TimesCompleted Auto Const Mandatory

RefCollectionAlias Property Alias_Enemies Auto Const Mandatory

Quest Property UCR03_SpaceEncounter Auto Const Mandatory
