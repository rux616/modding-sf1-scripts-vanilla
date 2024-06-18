;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFParadisoZ01_001C7689 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Akachi.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Emilian.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest if it's still running.
If FFParadisoZ01Misc.IsRunning()
	FFParadisoZ01Misc.SetStage(1000)
EndIf

SetObjectiveDisplayed(100)

Game.GetPlayer().AddAliasedItem(FFParadisoZ01_Claim, Alias_Claim, 1, False )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE FFParadisoZ01QuestScript
Quest __temp = self as Quest
FFParadisoZ01QuestScript kmyQuest = __temp as FFParadisoZ01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

kmyQuest.StartWaitTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE FFParadisoZ01QuestScript
Quest __temp = self as Quest
FFParadisoZ01QuestScript kmyQuest = __temp as FFParadisoZ01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(300)

kmyQuest.ComputerAllowActivate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN AUTOCAST TYPE FFParadisoZ01QuestScript
Quest __temp = self as Quest
FFParadisoZ01QuestScript kmyQuest = __temp as FFParadisoZ01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ComputerNoActivate()

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE FFParadisoZ01QuestScript
Quest __temp = self as Quest
FFParadisoZ01QuestScript kmyQuest = __temp as FFParadisoZ01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopWaitTimer()
SetObjectiveCompleted(200)
If IsObjectiveDisplayed(300)
	SetObjectiveCompleted(300)
EndIf
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(Alias_Claim.GetRef())
myPlayer.AddItem(Alias_Parts.GetRef())

SetObjectiveCompleted(200)
If IsObjectiveDisplayed(300)
	SetObjectiveCompleted(300)
EndIf
SetObjectiveCompleted(400)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.SetValue(FFParadisoZ01_Foreknowledge_AV, 1)

myPlayer.RemoveItem(Alias_Parts.GetRef())

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFParadisoZ01Misc Auto Const Mandatory

Book Property FFParadisoZ01_Claim Auto Const Mandatory

ReferenceAlias Property Alias_Claim Auto Const Mandatory

ReferenceAlias Property Alias_Akachi Auto Const Mandatory

ReferenceAlias Property Alias_Emilian Auto Const Mandatory

ReferenceAlias Property Alias_Parts Auto Const Mandatory

ActorValue Property FFParadisoZ01_Foreknowledge_AV Auto Const Mandatory
