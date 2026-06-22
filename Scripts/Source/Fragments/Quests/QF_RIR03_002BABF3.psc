;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR03_002BABF3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RIR01.CompleteQuest()
RIR02.SetStage(100)
RIR02.SetStage(150)
RIR02.SetStage(200)
RIR02.SetStage(300)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddItem(Clothes_UCPolice, 1)
PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
RIR01.CompleteQuest()
RIR02.CompleteQuest()
SetStage(100)
LC044.SetStage(350)
LC044.SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_ImogeneQS.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddItem(Clothes_UCPolice, 1)
PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
Alias_QuestGiver.Clear()
Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
RIR03_RadiantCount.SetValue(1)
SetStage(100)
LC044.SetStage(1000)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_MasakoQS.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddItem(Clothes_UCPolice, 1)
PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01, 1)
PlayerRef.AddPerk(Manipulation)

RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
RI01.CompleteQuest()
RI01_JobAdRadio.Stop()
Alias_QuestGiver.Clear()
Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
RIR03_RadiantCount.SetValue(1)
SetStage(100)
LC044.SetStage(1000)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_UlaruQS.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddItem(Clothes_UCPolice, 1)
PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01, 1)
Playerref.AddPerk(Manipulation)

RI07_PlayerHasInternalNeuroamp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
ObjectReference PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Clothes_UCPolice, 1)
PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Check who the current quest giver is and force them into 
; the QuestGiver alias.
; 0 - Imogene / 1 - Masako / 2 - Ularu

Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
Debug.Trace(Self + "Stage 10: fQuestGiver = " + fQuestGiver)

If fQuestGiver == 0
     Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
ElseIf fQuestGiver == 1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
ElseIf fQuestGiver == 2
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)

If RIR03_RadiantCount.GetValueInt() == 0
     RIR02.Stop()
Else
     RI_RadiantPointerQuest.SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE RIR03_QuestScript
Quest __temp = self as Quest
RIR03_QuestScript kmyQuest = __temp as RIR03_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)

Location ChosenLocation = Alias_ChosenLocation.GetLocation()

If (ChosenLocation != CityNeonLocation) && !(CityNeonLocation.IsChild(ChosenLocation))
     SetObjectiveDisplayed(150)     
     If ChosenLocation.HasKeyword(LocTypeStarstationInterior)
          SetStage(155)
     EndIf
     Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap()
     Alias_ChosenMapMarker.GetRef().AddToMapScanned()
Else
     SetStage(200)
EndIf

SetObjectiveDisplayed(110)
kmyQuest.CheckPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveDisplayedAtTop(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Keycard.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

If IsObjectiveDisplayed(110)
     SetObjectiveDisplayed(110, False, False)
EndIf
RI02.Start()

Actor PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_Keycard.GetRef(), abSilent = True)
PlayerRef.AddItem(Alias_KeycardSafe.GetRef(), abSilent = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_KeycardSafe.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

Float fCurrentRadiantCount = RIR03_RadiantCount.GetValue()

; If this is the real radiant version given by Masako/Ularu, reset the
; Mission Board count, set this quest as the last completed, 
; and shut it down.
If fCurrentRadiantCount >= 1
     (RI_RadiantSupport as RI_RadiantSupportQuestScript).ResetMBCount()
     RI_LastChosenRadiant.SetValue(1)
     RIR03_RadiantCount.SetValue(fCurrentRadiantCount + 1)
     Stop()
EndIf

; If it's the first time this radiant is being done, start RI02.
If fCurrentRadiantCount == 0 
     RI02.SetStage(100)
     RIR03_RadiantCount.SetValue(1)
EndIf
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

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

MiscObject Property RIR03_Keycard Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_Keycard Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

Quest Property RIR01 Auto Const Mandatory

Quest Property RIR02 Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

GlobalVariable Property RIR03_RadiantCount Auto Const Mandatory

Armor Property Clothes_UCPolice Auto Const Mandatory

Armor Property Clothes_BusinessFashionable_Male_01 Auto Const Mandatory

Quest Property RI02 Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

Quest Property RI_RadiantSupport Auto Const Mandatory

GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory

GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

ReferenceAlias Property Alias_UlaruQS Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneQS Auto Const Mandatory

ReferenceAlias Property Alias_MasakoQS Auto Const Mandatory

ReferenceAlias Property Alias_KeyCardSafe Auto Const Mandatory

ReferenceAlias Property Alias_ChosenMapMarker Auto Const Mandatory

Keyword Property LocTypeStarstationInterior Auto Const Mandatory
