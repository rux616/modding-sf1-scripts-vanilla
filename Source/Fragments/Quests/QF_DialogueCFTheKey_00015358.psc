;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCFTheKey_00015358 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef())
CF03.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
CF_Main.SetStage(0)
Game.GetPlayer().MoveTo(Alias_FFKeyZ02_Samina_StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef())
Alias_DisableGenerics.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(103)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(900)
Alias_IntroScene_Reaver.GetRef().Disable()
Alias_CommentTriggers.EnableAll()

ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()

MainMarkerRef.DisableNoWait()
ReaverMarkerRef.DisableNoWait()
Alias_IntroScene_Marker.Clear()
Alias_IntroScene_ReaverMarker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
SetStage(4)
Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
CF_Main.SetStage(0)
Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef())
CF02.CompleteQuest()
SetStage(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(WorkshopRef)
Game.GetPlayer().AddItem(LC088_PlayerHomeKey)
CF02.CompleteQuest()
SetStage(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef())
Game.GetPlayer().AddItem(Credits, 1000)
CrimsonFleetFaction.SetCrimeGold(9999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CommentTriggers.EnableAll()
Alias_IntroScene_Reaver.GetRef().DisableNoWait()
Alias_IntroScene_Reaver.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_IntroScene_Reaver.GetRef().Disable()

ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()

MainMarkerRef.DisableNoWait()
ReaverMarkerRef.DisableNoWait()
Alias_IntroScene_Marker.Clear()
Alias_IntroScene_ReaverMarker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
;Backup Stop Scene
Alias_IntroScene_NovaPatron01.GetActorRef().EvaluatePackage()
Alias_IntroScene_NovaPatron02.GetActorRef().EvaluatePackage()
SetStage(98)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
;Pause and then cleanup scene stuff

Utility.Wait(2)
DialogueCFTheKey_LastNova_IntroScene.Stop()
Alias_IntroScene_CFNovaMarker02.GetRef().DisableNoWait()

;Clearing these aliases since the intro scene is over
int i = 0
While i < FinishedAliases.Length
    FinishedAliases[i].Clear()
    i += 1
endWhile

;Clear owner on furniture that is in scene
Alias_Intro_BogSceneChair01.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
DialogueCFTheKey_LastNova_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
ObjectReference ReaverRef = Alias_IntroScene_Reaver.GetRef()

ReaverRef.EnableNoWait()
ReaverRef.BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
DialogueCFTheKey_EstablishingScene.Start()

Alias_CF_Naeva.GetActorRef().SetGhost(true)
Alias_IntroScene_Reaver.GetActorRef().SetGhost(true)
Alias_IntroScene_Marauder.GetActorRef().SetGhost(true)
CF02.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
Alias_IntroScene_Reaver.GetRef().RemoveKeyword(BlockPlayerActivation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
Alias_IntroScene_Marauder.GetActorRef().EvaluatePackage()
Alias_IntroScene_Reaver.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
SetStage(102)
Alias_IntroScene_Marauder.GetActorRef().EvaluatePackage()
Alias_IntroScene_Reaver.GetActorRef().Kill()
DialogueCFTheKey_EstablishingScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN CODE
Actor FleetMarauder = Alias_IntroScene_Marauder.GetActorRef()

FleetMarauder.AddToFaction(CrimsonFleetFaction)
FleetMarauder.SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
DialogueCFTheKey_EstablishingScene.Stop()
if Game.GetPlayer().GetDistance(Alias_CF_Naeva.GetRef()) < 3
    CF02_1700_Naeva_KeyIntroScene.Start()
endif

Utility.Wait(0.5)

ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()

MainMarkerRef.DisableNoWait()
ReaverMarkerRef.DisableNoWait()
Alias_IntroScene_Marker.Clear()
Alias_IntroScene_ReaverMarker.Clear()

SetStage(106)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN CODE
Alias_CF_Naeva.GetActorRef().SetGhost(false)
Alias_IntroScene_Reaver.GetActorRef().SetGhost(false)
Alias_IntroScene_Marauder.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
FFKeyZ01MiscObjective.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
FFKeyZ02.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Purchase the house (for free)
PlayerHouseSystem.PurchaseHouse(houseKey = LC088_PlayerHomeKey)

;Pointing the player towards their home in the Key
CF_Key_Home_CaptainsQuarters_Misc.Start()
Game.GetPlayer().AddItem(Clothes_CrimsonFleet_Captain_01_C_RedCoat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
Alias_IntroScene_Reaver.GetRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LC082 Auto Const Mandatory

ReferenceAlias Property Alias_TheKeyStartMarker Auto Const Mandatory

Scene Property DialogueCFTheKey_EstablishingScene Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_Marauder Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_Reaver Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

Quest Property FFKeyZ01 Auto Const Mandatory

Quest Property FFKeyZ01MiscObjective Auto Const Mandatory

Quest Property FFKeyZ02 Auto Const Mandatory

ReferenceAlias Property Alias_CFMissionBoards_Shinya_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_FFKeyZ02_Samina_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_DisableGenerics Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

Quest Property CF03 Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

Scene Property DialogueCFTheKey_LastNova_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_NovaPatron01 Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_CFNovaMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_NovaPatron02 Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_NovaPatron04 Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_CFNovaMarker03 Auto Const Mandatory

ReferenceAlias[] Property FinishedAliases Auto Const Mandatory

ReferenceAlias Property Alias_Intro_BogSceneChair01 Auto Const Mandatory

Key Property LC088_PlayerHomeKey Auto Const Mandatory

ObjectReference Property workshopRef Auto Const Mandatory

ReferenceAlias Property Alias_CF_Naeva Auto Const Mandatory

Scene Property CF02_1700_Naeva_KeyIntroScene Auto Const Mandatory

Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_Marker Auto Const Mandatory

ReferenceAlias Property Alias_IntroScene_ReaverMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF_Huan Auto Const Mandatory

RefCollectionAlias Property Alias_CommentTriggers Auto Const Mandatory

Armor Property Clothes_CrimsonFleet_Captain_01_C_RedCoat Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory

Keyword Property BlockPlayerActivation Auto Const Mandatory

Potion Property NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog Auto Const Mandatory
