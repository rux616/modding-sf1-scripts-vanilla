;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR07_0017AA9A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Unlock elevator doors
LC044.SetStage(1000)

; Add player to faction and add perks
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddToFaction(RyujinIndustriesFaction)
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Crippling)
PlayerRef.AddPerk(Intimidation)
PlayerRef.AddPerk(SniperCertification)

; Add credits for bribe options
PlayerRef.AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef())
SetStage(0)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(0)
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
SetStage(0)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(200)
Utility.Wait(10)
Debug.ExecuteConsole("MoveToQT RIR07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef())
SetStage(0)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(0)
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
SetStage(0)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If RI08_MasakoRemainedCEO.GetValue() == 0
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
Else
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
     RI08_MasakoRemainedCEO.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)

; If pointer quest is running for radiants, setstage to stop it.
If RI_RadiantPointerQuest.IsRunning()
     RI_RadiantPointerQuest.SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

Location ChosenLocation = Alias_ChosenLocation.GetLocation()

If (ChosenLocation != CityNeonLocation) && !(CityNeonLocation.IsChild(ChosenLocation))
     SetObjectiveDisplayed(150)     
     If ChosenLocation.HasKeyword(LocTypeStarstation)
          SetStage(155)
     EndIf
     Alias_ChosenLocation_MapMarker.GetRef().SetMarkerVisibleOnStarMap()
     Alias_ChosenLocation_MapMarker.GetRef().AddToMapScanned()
Else
     SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(150)
     SetObjectiveCompleted(150)
EndIf
SetObjectiveDisplayed(200)

Alias_RivalExecutive.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RIR07_Bribe.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
If RI08_MasakoRemainedCEO.GetValue() == 1
     SetObjectiveFailed(200)
Else
     SetObjectiveCompleted(200)
EndIf

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

(RI_Support as RI_RadiantSupportQuestScript).ResetMBCount()
RI_LastChosenRadiant.SetValue(3)
RIR07_RadiantCount.SetValue(RIR07_RadiantCount.GetValue() + 1)

Stop()
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

GlobalVariable Property RIR07_Bribe Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_RivalExecutive Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeQS Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

Perk Property Crippling Auto Const Mandatory

Perk Property Intimidation Auto Const Mandatory

Perk Property SniperCertification Auto Const Mandatory

GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeQS Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation Auto Const Mandatory

Keyword Property LocTypeStarStation Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_ChosenLocation_MapMarker Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory

GlobalVariable Property RIR07_RadiantCount Auto Const Mandatory
