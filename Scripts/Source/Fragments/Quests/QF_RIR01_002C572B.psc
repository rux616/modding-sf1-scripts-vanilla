;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR01_002C572B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
RI01.Start()
RI01.SetObjectiveCompleted(100)
RI01_JobAdRadio.Stop()
RI01.SetStage(1300)
LC044.SetStage(350)
LC044.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
SetStage(100)
LC044.SetStage(350)
LC044.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer() as Actor
;PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
SetStage(100)
SetStage(200)
LC044.SetStage(350)
LC044.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(200)
SetStage(300)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference TerminalRef = Alias_NeonCeltCorpTerminal.GetRef()
TerminalRef.Lock()
TerminalRef.SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
RI01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Alias_DataDisk.GetRef())
PlayerRef.AddItem(Digipick, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

RIR02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RIR01_DataDisk, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE RI_CrimeTrackingQuestScript
Quest __temp = self as Quest
RI_CrimeTrackingQuestScript kmyQuest = __temp as RI_CrimeTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property RIR01_DataDisk Auto Const Mandatory

Quest Property RIR02 Auto Const Mandatory

ReferenceAlias Property Alias_DataDisk Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneSalzo Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneStartMarker Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_NeonCeltCorpTerminal Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory
