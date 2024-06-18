;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR02_002C2561 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RIR01.SetStage(300)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RIR01.CompleteQuest()
SetStage(100)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
RIR01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Alias_ConfidentialFiles.GetRef())
PlayerRef.AddItem(Digipick, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)

ObjectReference ContainerRef = Alias_AkilaCityLaredoContainer.GetRef()
ContainerRef.Enable()
ContainerRef.Lock()
ContainerRef.SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Alias_AkilaCityLaredoContainer.GetRef().RemoveItem(Alias_ConfidentialFiles.GetRef())
RIR03_QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

Alias_AkilaCityLaredoContainer.GetRef().Disable()
Alias_AkilaCityLaredoLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property RIR02_ConfidentialFiles Auto Const Mandatory

ReferenceAlias Property Alias_ConfidentialFiles Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneStartMarker Auto Const Mandatory

Quest Property RIR01 Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Keyword Property RIR03_QuestStartKeyword Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_AkilaCityLaredoFilingCabinetEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_AkilaCityLaredoContainer Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

LocationAlias Property Alias_AkilaCityLaredoLocation Auto Const Mandatory

Keyword Property LocTypeRadiantsNotAllowed Auto Const Mandatory
