;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR06_0024FB39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
RI05_Track_BayuDispleased.SetValue(1)
RI06.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI05_Track_BayuDispleased.SetValue(1)
Game.GetPlayer().MoveTo(Alias_VeenaOfficeQS.GetRef())
Alias_Masako.GetRef().MoveTo(Alias_MasakoRI06Marker.GetRef())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
Alias_QuestGiver.Clear()
Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
Alias_QuestGiver.Clear()
Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Float fCheckTomo = RIR06_PlayerLetTomoLive.GetValue()
Float fCheckImogene = RIR06_PlayerLetImogeneLive.GetValue()
Float fCheckOperative = RIR06_PlayerLetOperativeLive.GetValue()

If RIR06_RadiantCount.GetValue() == 0
     If RI01_TomoDead.GetValue() == 0
          SetStage(11)
     Else
          SetStage(13)
     EndIf
EndIf

If RIR06_RadiantCount.GetValue() > 0

     If RI01_TomoDead.GetValue() == 0 && fCheckTomo == -1
          SetStage(11)
     ElseIf RI05_ImogeneDead.GetValue() == 0 && fCheckImogene == -1
          SetStage(12)
     Else
          SetStage(13)
     EndIf

EndIf

; Set the appropriate quest giver.
Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()

If fMasakoCEO == -1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
ElseIf fMasakoCEO == 0
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()

If fMasakoCEO == -1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
ElseIf fMasakoCEO == 0
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
EndIf 

Alias_Operative.ForceRefTo(Alias_Tomo.GetRef())
Alias_Tomo.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())

Actor Imogene = Alias_Imogene.GetActorRef()
Alias_Operative.ForceRefTo(Imogene)
Imogene.Enable()
Imogene.SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Int iOperative = Utility.RandomInt(0, 1)
RIR06_OperativeType.SetValueInt(iOperative)

; If Tomo is dead and this is the first time doing this quest in 
; the faction quest line, specifically spawn a rival operative...
If RI01_TomoDead.GetValue() == 1 && RIR06_RadiantCount.GetValue() == 0
     Alias_RivalOperative.TryToEnable()   
     Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef())
EndIf

; If Ularu is CEO and either:
; Imogene is dead and this is the second time doing this radiant...
; OR
; This is the third or greater time doing this quest, spawn the
; appropriate operative...
If RI08_MasakoRemainedCEO.GetValue() == 0
     If (RI05_ImogeneDead.GetValue() == 1 && RIR06_RadiantCount.GetValue() == 1) || RIR06_RadiantCount.GetValue() >= 2
          If RIR06_OperativeType.GetValueInt() == 0
               Alias_RogueOperative.TryToEnable()
               Alias_Operative.ForceRefTo(Alias_RogueOperative.GetRef())
          Else
               Alias_RivalOperative.TryToEnable()   
               Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef())
          EndIf
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
RI06.Stop()

; If pointer quest is running for radiants, setstage to stop it.
If RI_RadiantPointerQuest.IsRunning()
     RI_RadiantPointerQuest.SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_03
Function Fragment_Stage_0150_Item_03()
;BEGIN CODE
SetObjectiveCompleted(100)

Location ChosenLocation = Alias_ChosenLocation.GetLocation()

If (ChosenLocation != CityNeonLocation) && !(CityNeonLocation.IsChild(ChosenLocation))
     SetObjectiveDisplayed(150)     
     If ChosenLocation.HasKeyword(LocTypeStarstation)
          SetStage(155)
     EndIf
     Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap()
     Alias_ChosenMapMarker.GetRef().AddToMapScanned()
Else
     SetStage(200)
EndIf
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveCompleted(155)
SetObjectiveDisplayed(200)

Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveCompleted(155)
SetObjectiveDisplayed(200)

Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_02
Function Fragment_Stage_0200_Item_02()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveCompleted(155)
SetObjectiveDisplayed(200)

Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Actor OperativeActorRef = Alias_Operative.GetActorRef()

OperativeActorRef.SetEssential(False)
OperativeActorRef.RemoveFromFaction(RyujinIndustriesFaction)
OperativeActorRef.RemoveFromFaction(PlayerFriendFaction)
OperativeActorRef.AddToFaction(PlayerEnemyFaction)
OperativeActorRef.SetValue(Aggression, 2)
OperativeActorRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetStage(300)

If GetStageDone(11)
     RI01_TomoDead.SetValue(1)
EndIf
If GetStageDone(12)
     RI05_ImogeneDead.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, RIR06_Tomo_CreditsSmall.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, RIR06_Tomo_CreditsLarge.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, RIR06_Operative_CreditsSmall.GetValueInt())
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, RIR06_Operative_CreditsLarge.GetValueInt())
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0297_Item_00
Function Fragment_Stage_0297_Item_00()
;BEGIN CODE
; Remove LARGE credits
Int LargeAmount = NPCDemandMoney_Large.GetValue() as Int
Alias_Player.GetActorRef().RemoveItem(Credits, LargeAmount)

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0298_Item_00
Function Fragment_Stage_0298_Item_00()
;BEGIN CODE
; Remove LARGE credits
Int MediumAmount = NPCDemandMoney_Medium.GetValue() as Int
Alias_Player.GetActorRef().RemoveItem(Credits, MediumAmount)

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)

RI07.SetStage(150)
Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)

RI07.SetStage(150)
Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_02
Function Fragment_Stage_0300_Item_02()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

If RIR06_PlayerSpokeToYuko.GetValue() == 0 && RI05_ImogeneDead.GetValue() == 0
     Actor YukoRef = Alias_Yuko.GetActorRef()     
     YukoRef.Enable()
     YukoRef.MoveTo(Alias_YukoFurniture.GetRef())
     YukoRef.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_03
Function Fragment_Stage_0300_Item_03()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

If RIR06_PlayerSpokeToYuko.GetValue() == 0
     Actor YukoRef = Alias_Yuko.GetActorRef()     
     YukoRef.Enable()
     YukoRef.MoveTo(Alias_YukoFurniture.GetRef())
     YukoRef.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_04
Function Fragment_Stage_0300_Item_04()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

If RIR06_PlayerSpokeToYuko.GetValue() == 0 && RI01_TomoDead.GetValue() == 0
     Actor YukoRef = Alias_Yuko.GetActorRef()     
     YukoRef.Enable()
     YukoRef.MoveTo(Alias_YukoFurniture.GetRef())
     YukoRef.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
If RIR06_PlayerSpokeToYuko.GetValue() == 0 && RI08_MasakoRemainedCEO.GetValue() == 0 && !GetStageDone(220)
     SetStage(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(350)
SetObjectiveDisplayed(300, False, False)

RIR06_350_Yuko_CommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(300)
RIR06_PlayerSpokeToYuko.SetValue(1)
Alias_Yuko.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

If GetStageDone(220)
     RIR06_PlayerLetTomoLive.SetValue(0)
Else
     RIR06_PlayerLetTomoLive.SetValue(1)
EndIf

SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
SetObjectivecompleted(300)

SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_02
Function Fragment_Stage_0900_Item_02()
;BEGIN CODE
SetObjectiveCompleted(300)
If IsObjectiveDisplayed(350)
     SetObjectiveDisplayed(350, False, False)
EndIf

If GetStageDone(220)
     RIR06_PlayerLetImogeneLive.SetValue(0)
Else
     RIR06_PlayerLetImogeneLive.SetValue(1)
EndIf

SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_03
Function Fragment_Stage_0900_Item_03()
;BEGIN CODE
SetObjectiveCompleted(300)
If IsObjectiveDisplayed(350)
     SetObjectiveDisplayed(350, False, False)
EndIf

; Add to the count of how many generic operatives the player
; has allowed to live. Unlike Tomo and Imogene, this isn't a true/false
; rather a total count of operatives allowed to live.
Float fOperativeCount = RIR06_PlayerLetOperativeLive.GetValue()

If !GetStageDone(220) && fOperativeCount == -1
     RIR06_PlayerLetOperativeLive.SetValue(1)
ElseIf !GetStageDone(220) && fOperativeCount >= 1
     RIR06_PlayerLetOperativeLive.SetValue(fOperativeCount + 1)
EndIf

SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_04
Function Fragment_Stage_0900_Item_04()
;BEGIN CODE
SetObjectiveCompleted(300)
If IsObjectiveDisplayed(350)
     SetObjectiveDisplayed(350, False, False)
EndIf

If GetStageDone(220)
     RIR06_PlayerLetTomoLive.SetValue(0)
Else
     RIR06_PlayerLetTomoLive.SetValue(1)
EndIf

SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
; If the player did NOT speak to Yuko, start up her Misc quest
If RIR06_PlayerSpokeToYuko.GetValue() == 0 && RI08_MasakoRemainedCEO.GetValue() == 0 && !GetStageDone(220)
     RIR06_YukoFollowUp.SetStage(100)
EndIf
If IsObjectiveDisplayed(350)
     SetObjectiveDisplayed(350, False, False)
EndIf

Float fCurrentRadiantCount = RIR06_RadiantCount.GetValue()

; If this is the real radiant version given by Ularu, reset the
; Mission Board count, set this quest as the last completed, 
; and shut it down.
If RI_RadiantQuestGiver.GetValue() == 2
     (RI_Support as RI_RadiantSupportQuestScript).ResetMBCount()
     RI_LastChosenRadiant.SetValue(2)
     RIR06_RadiantCount.SetValue(fCurrentRadiantCount + 1)
     Stop()
EndIf

; If it's the first time this radiant is being done and RI07 is not complete, start RI07.
If fCurrentRadiantCount == 0 && !RI07.IsCompleted()
     RI07.SetStage(200)
     RIR06_RadiantCount.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_RogueOperative Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

GlobalVariable Property RIR06_OperativeType Auto Const Mandatory

GlobalVariable Property RIR06_RadiantCount Auto Const Mandatory

GlobalVariable Property RI01_TomoDead Auto Const Mandatory

ReferenceAlias Property Alias_OperativeMarker Auto Const Mandatory

ReferenceAlias Property Alias_Tomo Auto Const Mandatory

ReferenceAlias Property Alias_Operative Auto Const Mandatory

ReferenceAlias Property Alias_Dalton Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeQS Auto Const Mandatory

Quest Property RI07 Auto Const Mandatory

GlobalVariable Property RIR06_Tomo_CreditsSmall Auto Const Mandatory

GlobalVariable Property RIR06_Tomo_CreditsLarge Auto Const Mandatory

GlobalVariable Property RIR06_Operative_CreditsSmall Auto Const Mandatory

GlobalVariable Property RIR06_Operative_CreditsLarge Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

ReferenceAlias Property Alias_VeenaOfficeQS Auto Const Mandatory

ReferenceAlias Property Alias_MasakoRI06Marker Auto Const Mandatory

ReferenceAlias Property Alias_RivalOperative Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

ReferenceAlias Property Alias_DaltonRI07Marker Auto Const Mandatory

GlobalVariable Property RI05_Track_BayuDispleased Auto Const Mandatory

LocationAlias Property Alias_ChosenLocation Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

Keyword Property LocTypeStarstation Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

GlobalVariable Property RIR06_PlayerSpokeToYuko Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_YukoFurniture Auto Const Mandatory

Scene Property RIR06_350_Yuko_CommentScene Auto Const Mandatory

Quest Property RIR06_YukoFollowUp Auto Const Mandatory

GlobalVariable Property RIR06_PlayerLetImogeneLive Auto Const Mandatory

GlobalVariable Property RIR06_PlayerLetOperativeLive Auto Const Mandatory

GlobalVariable Property RIR06_PlayerLetTomoLive Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory

ReferenceAlias Property Alias_ChosenMapMarker Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory
