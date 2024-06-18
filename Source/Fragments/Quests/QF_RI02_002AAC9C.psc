;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI02_002AAC9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
RI01_JobAdRadio.Stop()
SetStage(10)
SetStage(100)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
RI01_JobAdRadio.Stop()
RIR03_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR03.SetStage(300)
SetStage(10)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
SetStage(10)
SetStage(100)
SetStage(150)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_AstralLoungeStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
LC044.SetStage(350)
LC044.SetStage(400)
RI01_JobAdRadio.Stop()
SetStage(600)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
RI_LaneUnlockTLs.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
RIR03.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(200)
SetStage(300)
SetStage(400)

ObjectReference MyPlayer = Game.GetPlayer()

MyPlayer.AddItem(Alias_NinaPresentationReplacement.GetRef())
MyPlayer.AddItem(Alias_DossierZolaAdisa.GetRef())
MyPlayer.AddItem(Alias_DossierArthurCruz.GetRef())
MyPlayer.AddItem(Alias_BusinessSuit.GetRef())

; Move NPCs and enable others.
Alias_NinaHart.GetActorRef().MoveTo(Alias_NinaMarker.GetRef())
Alias_AngeloSoldani.GetActorRef().MoveTo(Alias_AngeloMarker.GetRef())
Alias_ZolaAdisa.TryToEnable()
Alias_ArthurCruz.TryToEnable()
Alias_NinaPresentationActivator.GetRef().Enable()

; Add Angelo and Nina to CrimeFactionNeon and set it as their crime faction
Alias_AngeloSoldani.GetActorRef().SetCrimeFaction(CrimeFactionNeon)
Alias_NinaHart.GetActorRef().SetCrimeFaction(CrimeFactionNeon)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
If GetStageDone(250)
     SetObjectiveCompleted(200)
Else
     SetObjectiveFailed(200)
EndIf
SetStage(295)

If GetStageDone(395)
     SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
SetStage(295)

If IsObjectiveDisplayed(200) ; Talk to Zola
     SetObjectiveFailed(200) ; Talk to Zola
     If GetStageDone(395) ; Killed Arthur OR Talked to Arthur
          SetStage(500) ; Switch Nina's presentation
          If IsObjectiveDisplayed(400) ; Read the dossiers
               SetObjectiveDisplayed(400, False, False) ; Read the dossiers
          EndIf
     EndIf
EndIf

RI02_ZolaAdisaDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
If GetStageDone(350)
     SetObjectiveCompleted(300)
Else
     SetObjectiveFailed(300)
EndIf
SetStage(395)

If GetStageDone(295)
     SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
SetStage(395)

If IsObjectiveDisplayed(300) ; Talk to Arthur
     SetObjectiveFailed(300) ; Talk to Arthur
     If GetStageDone(295); Zola Done
          SetStage(500) ; Switch Presentation
          If IsObjectiveDisplayed(400) ; Read the Dossiers
               SetObjectiveDisplayed(400, False, False) ; Read the Dossiers
          EndIf
     EndIf
EndIf

RI02_ArthurCruzDead.SetValue(1)
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

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
If GetStageDone(420)
     SetObjectiveCompleted(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
If GetStageDone(410)
     SetObjectiveCompleted(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(400)
     SetObjectiveDisplayed(400, False)
EndIf

If !GetStageDone(575)
     SetObjectiveDisplayed(500)
Else
     SetStage(600)
EndIf

If GetStageDone(250) && GetStageDone(350)
     RI02_FinalResult.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
RI02_500_NinaAngeloScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(550)
     SetObjectiveCompleted(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
RI02_NinaHartDrunk.SetValue(1)

RI02_PlayerMetNina.SetValue(1)

Alias_NinaHart.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0535_Item_00
Function Fragment_Stage_0535_Item_00()
;BEGIN CODE
RI02_NinaHartDrunk.SetValue(0)
RI02_PlayerMetNina.SetValue(1)
Alias_NinaHart.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
RI02_PlayerMetAngelo.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(500)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_NinaRoomKeyBoone.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0566_Item_00
Function Fragment_Stage_0566_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Large.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0567_Item_00
Function Fragment_Stage_0567_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0568_Item_00
Function Fragment_Stage_0568_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(550)
     SetObjectiveCompleted(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(500)
     SetStage(600)
EndIf

Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveItem(Alias_NinaPresentationReplacement.GetRef(), 99)
PlayerRef.AddItem(RI02_NinaPresentation, 1)
Alias_NinaPresentationActivator.GetRef().Disable()
Alias_NinaPresentationStatic.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0585_Item_00
Function Fragment_Stage_0585_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(550)
     SetObjectiveCompleted(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
RI02_NinaHartDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

If IsObjectiveDisplayed(550)
     SetObjectiveDisplayed(550, False)
EndIf

RIR04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN CODE
RI02_AngeloSoldaniDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

; Remove Angelo and Nina from CrimeFactionNeon and give them back 
; original crime factions. Re-evaluate packages so they go back to
; Infinity LTD.

Actor AngeloRef = Alias_AngeloSoldani.GetActorRef()
Actor NinaRef = Alias_NinaHart.GetActorRef()

AngeloRef.RemoveFromFaction(CrimeFactionNeon)
AngeloRef.SetCrimeFaction(LC051InfinityLTDFaction)
AngeloRef.MoveTo(Alias_InfinityLTDMarker.GetRef())
AngeloRef.EvaluatePackage()
NinaRef.RemoveFromFaction(CrimeFactionNeon)
NinaRef.SetCrimeFaction(LC051InfinityLTDFaction)
NinaRef.MoveTo(Alias_InfinityLTDMarker.GetRef())
NinaRef.EvaluatePackage()

; Remove Nina's presentation and created NPCs.
Alias_NinaPresentationStatic.GetRef().Disable()
Alias_ZolaAdisa.GetRef().Disable()
Alias_ArthurCruz.GetRef().Disable()
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

ReferenceAlias Property Alias_BooneMorgan Auto Const Mandatory

ReferenceAlias Property Alias_DossierZolaAdisa Auto Const Mandatory

ReferenceAlias Property Alias_DossierArthurCruz Auto Const Mandatory

ReferenceAlias Property Alias_BusinessSuit Auto Const Mandatory

ReferenceAlias Property Alias_NinaRoomKeyBoone Auto Const Mandatory

ReferenceAlias Property Alias_NinaPresentationReplacement Auto Const Mandatory

Key Property RI02_NinaRoomKey Auto Const Mandatory

Quest Property RIR04 Auto Const Mandatory

ReferenceAlias Property Alias_NinaMarker Auto Const Mandatory

ReferenceAlias Property Alias_AngeloMarker Auto Const Mandatory

ReferenceAlias Property Alias_NinaHart Auto Const Mandatory

ReferenceAlias Property Alias_AngeloSoldani Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

GlobalVariable Property RI02_ZolaAdisaDead Auto Const Mandatory

GlobalVariable Property RI02_ArthurCruzDead Auto Const Mandatory

GlobalVariable Property RI02_NinaHartDead Auto Const Mandatory

GlobalVariable Property RI02_AngeloSoldaniDead Auto Const Mandatory

ReferenceAlias Property Alias_RyujinTowerStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_AstralLoungeStartMarker Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

Quest Property RIR01 Auto Const Mandatory

Quest Property RIR02 Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

Scene Property RI02_500_NinaAngeloScene Auto Const Mandatory

GlobalVariable Property RI02_NinaHartDrunk Auto Const Mandatory

GlobalVariable Property RI02_FinalResult Auto Const Mandatory

GlobalVariable Property RI02_PlayerMetNina Auto Const Mandatory

GlobalVariable Property RI02_PlayerMetAngelo Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Keyword Property RIR03_QuestStartKeyword Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

GlobalVariable Property RI_LaneUnlockTLs Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

Faction Property LC051InfinityLTDFaction Auto Const Mandatory

ReferenceAlias Property Alias_NinaPresentationActivator Auto Const Mandatory

MiscObject Property RI02_NinaPresentation Auto Const Mandatory

ReferenceAlias Property Alias_NinaPresentationStatic Auto Const Mandatory

ReferenceAlias Property Alias_ZolaAdisa Auto Const Mandatory

ReferenceAlias Property Alias_ArthurCruz Auto Const Mandatory

ReferenceAlias Property Alias_InfinityLTDMarker Auto Const Mandatory
