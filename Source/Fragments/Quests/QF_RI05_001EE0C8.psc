;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI05_001EE0C8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI_Support.SetStage(1)
Alias_YukoDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI04.SetStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
Game.GetPlayer().MoveTo(Alias_ImogeneOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(105)
SetStage(300)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_ImogeneOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(400)
SetStage(600)

Alias_YukoDoor.GetRef().Lock(False)
Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_DaltonOfficeQS.GetRef())
;Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(600) ; Find Imogene

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_TradeTowerQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(520)
SetStage(550)
SetStage(600)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(503)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(503)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(503)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(911)
SetStage(960)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(540)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_SeokguhQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(700)
SetStage(799)
SetStage(800)
SetStage(900)
SetStage(930)
SetStage(950)
SetStage(990)
SetStage(1100)

Game.GetPlayer().MoveTo(Alias_TradeTowerQS.GetRef())
Game.GetPlayer().AddItem(Alias_KumihoSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(930)
SetStage(950)
SetStage(1000)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)
SetStage(1300)
SetStage(1301)

Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(930)
SetStage(950)
SetStage(1000)
SetStage(1070)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)
Alias_Ularu.GetRef().Disable()


Game.GetPlayer().AddItem(RI05_UlaruKeycard)
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(930)
SetStage(950)
SetStage(1000)
SetStage(1060) ; Player sided with Masako
SetStage(1090)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().MoveTo(Alias_DaltonOfficeQS.GetRef())
Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(930)
SetStage(950)
SetStage(1000)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(915)
SetStage(950)
SetStage(1000)
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(915) ; Imogene dead
SetStage(950)
SetStage(1000) 
SetStage(1060) ; Player sided with Masako
SetStage(1090) ; Player spoke to Ularu
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(915) ; Imogene dead
SetStage(950)
SetStage(1000) 
SetStage(1050) ; Player sided with Ularu
SetStage(1090) ; Player spoke to Ularu
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(510)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)
SetStage(660)
SetStage(800)
SetStage(900)
SetStage(915) ; Imogene dead
SetStage(950)
SetStage(1000) 
SetStage(1060) ; Player sided with Masako
SetStage(1070) ; Ularu dead
SetStage(1090) ; Player spoke to Ularu
SetStage(1100)
SetStage(1110)
SetStage(1150)
SetStage(1200)

Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate)
Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(400)
SetStage(600)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100) ; Talk to Imogene
SetStage(105) ; Activated Imogene's door
SetStage(300) ; Talk to Yuko
SetStage(399) ; Spoke to Yuko
SetStage(400) ; Talk to Dalton
SetStage(450)
SetStage(500) ; Talk to Bayu
SetStage(503)
SetStage(550)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(622)
SetStage(635)

Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef())
Alias_Imogene.GetActorRef().SetEssential(False)
Game.GetPlayer().MoveTo(Alias_SeokguhQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Initial setup.
SetActive()
Actor ImogeneRef = Alias_Imogene.GetActorRef()

ImogeneRef.RemoveFromFaction(RyujinIndustriesFaction)
ImogeneRef.RemoveFromFaction(CrimeFactionNeon)
ImogeneRef.MoveTo(Alias_ImogeneMarker.GetRef())
ImogeneRef.SetEssential(False)
Alias_Yuko.GetRef().Enable()
Alias_YukoDoor.GetRef().Lock(False)
Alias_YukoDoor.GetRef().SetOpen(True)
Alias_Yuko.GetRef().MoveTo(Alias_YukoStartMarker.GetRef())
Alias_Yuko.GetActorRef().EvaluatePackage()
Alias_ImogeneOfficeDoor.GetRef().SetOpen(False)
Alias_Frankie.GetActorRef().SetEssential(False)

SetObjectiveDisplayed(100) ; Talk to Imogene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
Alias_YukoDoor.GetRef().Lock(False)
Alias_Yuko.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
If !GetStageDone(300)
     Alias_Yuko.GetActorRef().EvaluatePackage()
     RI05_0100_Yuko_PlayerAddressScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
If !GetStageDone(105) && !GetStageDone(300)
     Alias_Yuko.GetActorRef().EvaluatePackage()
     RI05_0100_Yuko_PlayerAddressScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, False, False) ; Hide Talk to Imogene
SetObjectiveDisplayed(300) ; Talk to Yuko
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300) ; Talk to Yuko

If !GetStageDone(350)
     SetStage(400)
Else
     SetStage(500)
EndIf

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400) ; Talk to Dalton
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetStage(500)
SetObjectiveCompleted(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300) ; Talk to Yuko
SetObjectiveDisplayed(500) ; Talk to Benjamin Bayu

If IsObjectiveDisplayed(400)
     SetObjectiveDisplayed(400, False, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
SetObjectiveCompleted(300) ; Talk to Yuko
SetObjectiveDisplayed(500) ; Talk to Benjamin Bayu
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN CODE
SetStage(540)
RI05_Track_BayuDispleased.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0504_Item_00
Function Fragment_Stage_0504_Item_00()
;BEGIN CODE
SetStage(540)
RI05_Track_BayuDispleased.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
SetStage(540)
RI05_Track_BayuDispleased.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetStage(540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
RI05_Track_BayuFavorRefused.SetValue(1)
RI05_Track_BayuDispleased.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
RI05_Track_BayuDispleased.SetValue(1)
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
RI05_Track_BayuBypassed.SetValue(1)
RI05_Track_BayuDispleased.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
; Set the Seokguh Syndicate NPCs in the hideout to be friendly.
LC115.SetStage(20)
Alias_EnableFriendlyAddsMarker.GetRef().Enable()

; Start up their dialogue quest so they have things to say.
DialogueFCSeokguhSyndicateHideout_RI05.Start()

; Set up forcegreet guards to be initially non-aggressive.
Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 0)
Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 0)
SetStage(550)
SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
If GetStageDone(510) ; Agreed to get slate
     SetStage(610)
     RI05_0550_Compantion_ReactToDoingBayuFavorScene.Start()
ElseIf GetStageDone(520)
     RI05_0550_Companion_ReactToRejectingBayuScene.Start()
EndIf
SetObjectiveCompleted(500)
If IsObjectiveDisplayed(400) ; Talk to Dalton
     SetObjectiveDisplayed(400, False, False)
EndIf
If GetStageDone(505) || GetStageDone(504) || GetStageDone(503) ; Player got permission with SC or skills
     SetStage(610)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(600) ; Find Imogene

LC115SeokguhHideout.Reset()
LC115Location.Reset()
LC115.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
SetObjectiveCompleted(610)
SetObjectiveDisplayed(620)
Alias_Frankie.GetActorRef().SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0622_Item_00
Function Fragment_Stage_0622_Item_00()
;BEGIN CODE
SetStage(635)
SetObjectiveCompleted(620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
If Game.GetPlayer().GetItemCount(RI05_SeokguhSyndicateHideoutKey) == 0
     RI05_0600_Frankie_ForceGreetScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
SetStage(650)
SetObjectiveCompleted(610)
SetObjectiveCompleted(620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0635_Item_00
Function Fragment_Stage_0635_Item_00()
;BEGIN CODE
Alias_FrankiesDoor.GetRef().Lock(False)
SetObjectiveCompleted(610)
SetObjectiveCompleted(620)
Alias_Frankie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI05_Frankie_LargeCredits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0651_Item_00
Function Fragment_Stage_0651_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(620)
     SetObjectiveDisplayed(620, False, False)
EndIf
If IsObjectiveDisplayed(650)
     SetObjectiveCompleted(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(620, False, False)
Alias_Frankie.Clear()
DialogueFCNeon.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
; If the player has NOT spoken to Benjamin Bayu, set tracking value.
If !GetStageDone(550)
     RI05_Track_BayuBypassed.SetValue(1)
EndIf

; If the player has spoken to Yuko, and stage 600 is not set yet,
; display objective to find Imogene.
If GetStageDone(300)
     SetObjectiveDisplayedAtTop(660) 
EndIf
If GetStageDone(510)
     SetStage(700)
EndIf

; If the objectives to talk to Dalton or Bayu are displayed, hide them.
If IsObjectiveDisplayed(400)
     SetObjectiveDisplayed(400, False, False)
EndIf
If IsObjectiveDisplayed(500)
     SetObjectiveDisplayed(500, False, False)
EndIf

; If the optional objective to find an alternate path inside is 
; displayed, complete it.
If IsObjectiveDisplayed(650)
     SetObjectiveCompleted(650)
EndIf

SetObjectiveDisplayed(600, False, False)
SetObjectiveDisplayed(660)

SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
RI05_0800_Imogene_PlayerAddressScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
Alias_SyndicateGuard01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0686_Item_00
Function Fragment_Stage_0686_Item_00()
;BEGIN CODE
Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 1)
LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
Alias_SyndicateGuard02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0696_Item_00
Function Fragment_Stage_0696_Item_00()
;BEGIN CODE
Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 1)
LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN CODE
LC115.SetStage(10)
Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 1)
Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 1)
LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700) ; Find Kumiho's Slate

; Enable Kumiho
Alias_Kumiho.GetRef().Enable()
Alias_KumihoSlate.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Alias_Kumiho.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0799_Item_00
Function Fragment_Stage_0799_Item_00()
;BEGIN CODE
If GetStageDone(925) || GetStageDone(950)
     SetStage(1100)
EndIf

SetObjectiveCompleted(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Check displayed objectives and complete/hide where appropriate
If IsObjectiveDisplayed(100) ; Talk to Imogene
     SetObjectiveDisplayed(100, False, False)
EndIf
If IsObjectiveDisplayed(300) ; Talk to Yuko
     SetObjectiveDisplayed(300, False, False)
EndIf
If IsObjectiveDisplayed(400) ; Talk to Dalton
     SetObjectiveDisplayed(400, False, False)
EndIf
If IsObjectiveDisplayed(500) ; Talk to Bayu
     SetObjectiveDisplayed(500, False, False)
EndIf
If IsObjectiveDisplayed(660) ; Find Imogene in the Seokguh Hideout
     SetObjectiveCompleted(660)
EndIf

SetObjectiveDisplayedAtTop(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_01
Function Fragment_Stage_0800_Item_01()
;BEGIN CODE
; Check displayed objectives and complete/hide where appropriate
If IsObjectiveDisplayed(100) ; Talk to Imogene
     SetObjectiveDisplayed(100, False, False)
EndIf
If IsObjectiveDisplayed(300) ; Talk to Yuko
     SetObjectiveDisplayed(300, False, False)
EndIf
If IsObjectiveDisplayed(400) ; Talk to Dalton
     SetObjectiveDisplayed(400, False, False)
EndIf
If IsObjectiveDisplayed(500) ; Talk to Bayu
     SetObjectiveDisplayed(500, False, False)
EndIf
If IsObjectiveDisplayed(660) ; Find Imogene in the Seokguh Hideout
     SetObjectiveCompleted(660)
EndIf

SetObjectiveDisplayedAtTop(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800) ; Confront Imogene
SetObjectiveDisplayedAtTop(900) ; Decide Imogene's Fate
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
SetObjectiveCompleted(800) ; Confront Imogene
SetObjectiveDisplayedAtTop(900) ; Decide Imogene's Fate
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
If !GetStageDone(805)
     SetStage(810)
EndIf

SetStage(911)
SetStage(960)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0911_Item_00
Function Fragment_Stage_0911_Item_00()
;BEGIN CODE
; Set up Imogene to be hostile and attack.
Actor ImogeneRef = Alias_Imogene.GetActorRef()

ImogeneRef.RemoveFromFaction(RyujinIndustriesFaction)
ImogeneRef.RemoveFromFaction(CrimeFactionNeon)
ImogeneRef.AddToFaction(PlayerEnemyFaction)
ImogeneRef.SetValue(Aggression, 2)
ImogeneRef.StartCombat(Game.GetPlayer())

If !GetStageDone(950)
     SetStage(960) ; Kill Imogene
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(660) ; Find Imogene
     SetObjectiveCompleted(660)
EndIf
If IsObjectiveDisplayed(960) ; Kill Imogene
     SetObjectiveCompleted(960)
EndIf
If IsObjectiveDisplayed(900) ; Decide Imogene's Fate
     SetObjectiveCompleted(900)
     
EndIf
If IsObjectiveDisplayed(800) ; Confront Imogene
     SetObjectiveCompleted(800)
EndIf

RI05_ImogeneDead.SetValue(1)

If GetStageDone(930) ; Player said they'd deliver evidence.
     SetStage(970)
Else 
     SetStage(965) ; Stage to search Imogene's body.
EndIf

Utility.Wait(3)
RI05_0915_Companion_PlayerKilledImogeneScene.Start()
Alias_Imogene.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
RI05_Track_ImogeneSpared.SetValue(1)
Game.GetPlayer().AddItem(Credits, RI05_Imogene_Credits.GetValueInt())
SetStage(950)

Utility.Wait(3)
RI05_930_Companion_PlayerLetImogeneLiveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(965) ; Search Imogene
     SetObjectiveCompleted(965)
EndIf

If !GetStageDone(700)
     SetStage(1200)
EndIf

If GetStageDone(799)
     SetStage(1100)
Else 
     SetStage(990)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
RI05_Track_ImogeneSpared.SetValue(1)
SetStage(950)

RI05_930_Companion_PlayerLetImogeneLiveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_ImogeneEvidenceSlate.GetRef())
SetObjectiveCompleted(800)
SetObjectiveCompleted(900) ; Decide Imogene's Fate

If !GetStageDone(700)
     SetStage(1200)
EndIf

If GetStageDone(799)
     SetStage(1100)
Else 
     SetStage(990)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(900)
     SetObjectiveCompleted(900) ; Decide Imogene's Fate
EndIf
SetObjectiveDisplayedAtTop(960) ; Kill Imogene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_01
Function Fragment_Stage_0960_Item_01()
;BEGIN CODE
If IsObjectiveDisplayed(900)
     SetObjectiveCompleted(900) ; Decide Imogene's Fate
EndIf
SetObjectiveDisplayedAtTop(960) ; Kill Imogene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0965_Item_00
Function Fragment_Stage_0965_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(965)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
If IsObjectiveDisplayed(1000)
     SetObjectiveDisplayed(1000, False, False)
EndIf
If IsObjectiveDisplayed(1300)
     SetObjectiveDisplayed(1300, False, False)
EndIf
; Set the Seokguh Syndicate hideout members back to Hostile.
LC115.SetStage(10)
Alias_EnableFriendlyAddsMarker.GetRef().Disable()

; TEMP Until LC115 setup is complete
Game.GetPlayer().RemoveFromFaction(LC115SeokguhFaction)

RI06.SetStage(100)

;Achievement Unlocked
Game.AddAchievement(18)

If RI05_Track_PlayerSidedWithUlaru.GetValue() == 0 && RI05_Track_PlayerSidedWithMasako.GetValue() == 0
      RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

Alias_Imogene.GetRef().Disable()
Alias_UlaruChairSwapEnableMarker.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_UlaruChairSwapEnableMarker.GetRef().Enable()
Alias_Ularu.GetActorRef().EvaluatePackage()
Alias_Ularu.GetRef().AddKeyword(Artifact_GravImmune)
SetObjectiveDisplayed(1000)

;make sure we can open her door GEN-528630
Alias_UlaruDoor.GetRef().Lock(False)
Alias_UlaruDoor.GetRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
ObjectReference UlaruDoorRef = Alias_UlaruDoor.GetRef()

UlaruDoorRef.SetOpen(False)
Utility.Wait(2)
UlaruDoorRef.Lock()
UlaruDoorRef.SetLockLevel(255)
UlaruDoorRef.BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1006_Item_00
Function Fragment_Stage_1006_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1040_Item_00
Function Fragment_Stage_1040_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(RI07_Foreknowledge_ImogeneInnocentAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
RI05_Track_PlayerSidedWithUlaru.SetValue(1)
SetStage(1090)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1055_Item_00
Function Fragment_Stage_1055_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI05_ImogeneEvidenceSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1060_Item_00
Function Fragment_Stage_1060_Item_00()
;BEGIN CODE
RI05_Track_PlayerSidedWithMasako.SetValue(1)
SetStage(1090)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1065_Item_00
Function Fragment_Stage_1065_Item_00()
;BEGIN CODE
Actor UlaruRef = Alias_Ularu.GetActorRef()

UlaruRef.RemoveFromFaction(CrimeFactionNeon)
UlaruRef.RemoveFromFaction(RyujinIndustriesFaction)
UlaruRef.RemoveFromFaction(LC044RyujinGuardCrimeFaction)
UlaruRef.AddToFaction(PlayerEnemyFaction)
UlaruRef.SetEssential(False)
UlaruRef.SetValue(Aggression, 2)
UlaruRef.StartCombat(Game.GetPlayer())
UlaruRef.RemoveKeyword(Artifact_GravImmune)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN CODE
RI05_UlaruDead.SetValue(1)
Alias_Maeve.GetRef().MoveTo(Alias_MaeveSceneMarker.GetRef())
Alias_MaeveGuard.GetRef().MoveTo(Alias_MaeveGuardFurniture.GetRef())
SetObjectiveCompleted(1000)
Alias_Ularu.Clear()
Alias_UlaruDoor.GetRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1081_Item_00
Function Fragment_Stage_1081_Item_00()
;BEGIN CODE
Alias_Maeve.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1090_Item_00
Function Fragment_Stage_1090_Item_00()
;BEGIN CODE
If !GetStageDone(1065)
     Alias_UlaruDoor.GetRef().Lock(False)
     Alias_UlaruDoor.GetRef().BlockActivation(False)
     SetObjectiveCompleted(1000)
EndIf

Alias_Ularu.GetActorRef().EvaluatePackage()
Alias_Ularu.GetRef().RemoveKeyword(Artifact_GravImmune)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700) ; Find Kumiho's Slate
SetObjectiveDisplayedAtTop(1100) ; Deliver Kumiho's Slate to Benjamin Bayu
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI05_KumihoSlate)
SetStage(1150)
RI05_Track_BayuDispleased.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
SetStage(1150)
RI05_Track_BayuPlayerKeptSlate.SetValue(1)
RI05_Track_BayuDispleased.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN CODE
Actor PlayerActor = Game.GetPlayer() as Actor

PlayerActor.RemoveItem(RI05_KumihoSlate)
PlayerActor.AddItem(Credits, RI05_Bayu_Credits.GetValueInt())

RI05_Track_BayuDispleased.SetValue(0)
SetStage(1150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100) ; Deliver Kumiho's Slate to Bayu
SetStage(1200)

RI05_1150_Companion_RespondToBayuDecisionScene.Start()
If RI05_Track_BayuDispleased.GetValue() == -1
     RI05_Track_BayuDispleased.SetValue(0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1200) ; Return to Dalton
SetStage(1000)
Actor YukoRef = Alias_Yuko.GetActorRef()
YukoRef.MoveTo(Alias_YukoReturnStartMarker.GetRef())
YukoRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI05_ImogeneEvidenceSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
SetStage(1300) ; Intentional redundancy in case player interacts before Yuko forcegreets
Alias_Yuko.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
SetStage(1390)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1390_Item_00
Function Fragment_Stage_1390_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
Alias_Yuko.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RI05_Track_BayuBypassed Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneMarker Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_YukoTravelMarker Auto Const Mandatory

Scene Property RI05_0100_Yuko_PlayerAddressScene Auto Const Mandatory

ReferenceAlias Property Alias_Kumiho Auto Const Mandatory

Book Property RI05_KumihoSlate Auto Const Mandatory

Scene Property RI05_0800_Imogene_PlayerAddressScene Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_TradeTowerQS Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_SeokguhQS Auto Const Mandatory

ReferenceAlias Property Alias_KumihoSlate Auto Const Mandatory

ReferenceAlias Property Alias_DaltonOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneSeokguhQS Auto Const Mandatory

Quest Property LC115 Auto Const Mandatory

Faction Property LC115SeokguhFaction Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Book Property RI05_ImogeneEvidenceSlate Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneEvidenceSlate Auto Const Mandatory

GlobalVariable Property RI05_Track_BayuFavorRefused Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

GlobalVariable Property RI05_Track_ImogeneSpared Auto Const Mandatory

Scene Property RI05_0550_Companion_ReactToRejectingBayuScene Auto Const Mandatory

Scene Property RI05_0550_Compantion_ReactToDoingBayuFavorScene Auto Const Mandatory

Scene Property RI05_0915_Companion_PlayerKilledImogeneScene Auto Const Mandatory

Scene Property RI05_930_Companion_PlayerLetImogeneLiveScene Auto Const Mandatory

Scene Property RI05_1150_Companion_RespondToBayuDecisionScene Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

Quest Property DialogueFCSeokguhSyndicateHideout_RI05 Auto Const Mandatory

GlobalVariable Property RI05_Imogene_Credits Auto Const Mandatory

GlobalVariable Property RI05_Bayu_Credits Auto Const Mandatory

Faction Property LC044RyujinGuardCrimeFaction Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

GlobalVariable Property RI05_Frankie_LargeCredits Auto Const Mandatory

ReferenceAlias Property Alias_FrankiesDoor Auto Const Mandatory

ReferenceAlias Property Alias_UlaruDoor Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

ReferenceAlias Property Alias_FrankiesQS Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeQS Auto Const Mandatory

Key Property RI05_UlaruKeycard Auto Const Mandatory

GlobalVariable Property RI05_UlaruDead Auto Const Mandatory

ReferenceAlias Property Alias_Maeve Auto Const Mandatory

ReferenceAlias Property Alias_MaeveSceneMarker Auto Const Mandatory

GlobalVariable Property RI05_Track_BayuDispleased Auto Const Mandatory

GlobalVariable Property RI05_Track_BayuPlayerKeptSlate Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_Frankie Auto Const Mandatory

Scene Property RI05_0600_Frankie_ForceGreetScene Auto Const Mandatory

ReferenceAlias Property Alias_SyndicateGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_SyndicateGuard02 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property LC115SeokguhTrespassFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_YukoReturnStartMarker Auto Const Mandatory

Location Property LC115Location Auto Const Mandatory

GlobalVariable Property RI05_LC115PreviouslyExplored Auto Const Mandatory

Cell Property LC115SeokguhHideout Auto Const Mandatory

ReferenceAlias Property Alias_MaeveGuardFurniture Auto Const Mandatory

ReferenceAlias Property Alias_MaeveGuard Auto Const Mandatory

ReferenceAlias Property Alias_YukoReturnQS Auto Const Mandatory

ActorValue Property RI07_Foreknowledge_ImogeneInnocentAV Auto Const Mandatory

ReferenceAlias Property Alias_YukoDoor Auto Const Mandatory

ReferenceAlias Property Alias_YukoStartMarker Auto Const Mandatory

Quest Property RI04 Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory

ReferenceAlias Property Alias_EnableFriendlyAddsMarker Auto Const Mandatory

Key Property RI05_SeokguhSyndicateHideoutKey Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairSwapEnableMarker Auto Const Mandatory

Scene Property RI05_1000_Ularu_ConfrontationPartIIScene Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

Keyword Property Artifact_GravImmune Auto Const Mandatory
