;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI_Support_002A8318 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)
RI01_JobAdRadio.Stop()
RI01.SetStage(10000)
RI_LaneUnlockTLs.SetValue(1)
DialogueFCRyujinTower.SetStage(110)
LC044.SetStage(200)
LC044.SetStage(300)
LC044.SetStage(400)
RI01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)

; Stop the ad from running and Jupiter's forcegreet
RI01_JobAdRadio.Stop()
DialogueFCRyujinTower.SetStage(110)

; Set up Ryujin Tower states
LC044.SetStage(1000) ; Unlock all elevator floors
Alias_MasakoOfficeDoor.GetRef().Lock(False)
Alias_YukoOfficeDoor.GetRef().Lock(False)
RI01.SetStage(10000) ; Allow Lane's scene greetings
RI01.Stop()
RI_LaneUnlockTLs.SetValue(1) ; Allow Lane's Top Levels

; Various character handling
If RI05_UlaruDead.GetValue() == 0
     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()
Else
     Alias_Ularu.GetRef().Disable()
EndIf

Alias_Yuko.GetRef().Enable()

If RI02_NinaHartDead.GetValue() == 1
     Alias_Nina.GetRef().Disable()
     Alias_Harper.GetRef().Enable()
EndIf


If RI02_AngeloSoldaniDead.GetValue() == 1
     Alias_Angelo.GetRef().Disable()
EndIf


If RI03_StanleyDead.GetValue() == 1
     Alias_Stanley.GetRef().Disable()
EndIf

; Set radiant globals
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)

; Stop the ad from running and Jupiter's forcegreet
RI01_JobAdRadio.Stop()
DialogueFCRyujinTower.SetStage(110)

; Set up Ryujin Tower states
LC044.SetStage(1000) ; Unlock all elevator floors
Alias_MasakoOfficeDoor.GetRef().Lock(False)
Alias_YukoOfficeDoor.GetRef().Lock(False)
RI01.SetStage(10000) ; Allow Lane's scene greetings
RI01.Stop()
RI_LaneUnlockTLs.SetValue(1) ; Allow Lane's Top Levels

; Various character handling
If RI05_UlaruDead.GetValue() == 0
     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()
Else
     Alias_Ularu.GetRef().Disable()
EndIf

If RI05_ImogeneDead.GetValue() == 1
     Alias_Imogene.GetRef().Disable()
EndIf

If RI08_MasakoRemainedCEO.GetValue() == 1 && RI08_UlaruRemainedCFO.GetValue() != 1
     Alias_Ularu.GetRef().Disable()
EndIf

Alias_Yuko.GetRef().Enable()

If RI02_NinaHartDead.GetValue() == 1
     Alias_Nina.GetRef().Disable()
     Alias_Harper.GetRef().Enable()
EndIf


If RI02_AngeloSoldaniDead.GetValue() == 1
     Alias_Angelo.GetRef().Disable()
EndIf


If RI03_StanleyDead.GetValue() == 1
     Alias_Stanley.GetRef().Disable()
EndIf

If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

; Set radiant globals
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
SetStage(5010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)

; Stop the ad from running and Jupiter's forcegreet
RI01_JobAdRadio.Stop()
DialogueFCRyujinTower.SetStage(110)

; Set up Ryujin Tower states
LC044.SetStage(1000) ; Unlock all elevator floors
Alias_MasakoOfficeDoor.GetRef().Lock(False)
Alias_MasakoOfficeDoor.GetRef().SetOpen()
Alias_UlaruOfficeDoor.GetRef().Lock(False)
Alias_UlaruOfficeDoor.GetRef().SetOpen()
Alias_YukoOfficeDoor.GetRef().Lock(False)
Alias_YukoOfficeDoor.GetRef().SetOpen()
RI01.SetStage(10000) ; Allow Lane's scene greetings
RI01.Stop()
RI_LaneUnlockTLs.SetValue(1) ; Allow Lane's Top Levels

; Various character handling
If RI05_UlaruDead.GetValue() == 0
     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()
Else
     Alias_Ularu.GetRef().Disable()
EndIf

If RI05_ImogeneDead.GetValue() == 1
     Alias_Imogene.GetRef().Disable()
EndIf


Alias_Yuko.GetRef().Enable()

If RI02_NinaHartDead.GetValue() == 1
     Alias_Nina.GetRef().Disable()
     Alias_Harper.GetRef().Enable()
EndIf


If RI02_AngeloSoldaniDead.GetValue() == 1
     Alias_Angelo.GetRef().Disable()
EndIf


If RI03_StanleyDead.GetValue() == 1
     Alias_Stanley.GetRef().Disable()
EndIf

If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

; Set radiant globals
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.AddPerk(Manipulation)
PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus)
PlayerJoined_Ryujin.SetValue(1)
PlayerFaction.SetAlly(RyujinIndustriesFaction)

; Stop the ad from running and Jupiter's forcegreet
RI01_JobAdRadio.Stop()
DialogueFCRyujinTower.SetStage(110)

; Set up Ryujin Tower states
LC044.SetStage(1000) ; Unlock all elevator floors
Alias_MasakoOfficeDoor.GetRef().Lock(False)
Alias_YukoOfficeDoor.GetRef().Lock(False)
Alias_PlayerOfficeDoor.GetRef().Lock(False)
RI01.SetStage(10000) ; Allow Lane's scene greetings
RI01.Stop()
RI_LaneUnlockTLs.SetValue(1) ; Allow Lane's Top Levels
RI08_PostQuest.SetStage(600)

; Various character handling
If RI05_UlaruDead.GetValue() == 0
     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()
Else
     Alias_Ularu.GetRef().Disable()
EndIf

If RI05_ImogeneDead.GetValue() == 1 || RI08_MasakoRemainedCEO.GetValue() == 0
     Alias_Imogene.GetRef().Disable()
EndIf

If RI08_MasakoRemainedCEO.GetValue() == 1 
     RI_RadiantQuestGiver.SetValue(1)
     If RI08_UlaruRemainedCFO.GetValue() != 1
          Alias_Ularu.GetRef().Disable()
     EndIf
Else
     RI_RadiantQuestGiver.SetValue(2)
EndIf

Alias_Yuko.GetRef().Enable()

If RI02_NinaHartDead.GetValue() == 1
     Alias_Nina.GetRef().Disable()
     Alias_Harper.GetRef().Enable()
EndIf


If RI02_AngeloSoldaniDead.GetValue() == 1
     Alias_Angelo.GetRef().Disable()
EndIf


If RI03_StanleyDead.GetValue() == 1
     Alias_Stanley.GetRef().Disable()
EndIf

If RI05_Track_PlayerSidedWithMasako.GetValue() == 0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0
     RI05_Track_PlayerSidedWithMasako.SetValue(1)
EndIf

; Unlock Mission Boards and set up radiants
MissionBoardAccessAllowed_RI.SetValue(1)
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
SetStage(5010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(2)
RI08.SetStage(6)
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
RI_RadiantQuestGiver.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(2)
RI08.SetStage(6)
RI05_ImogeneDead.SetValue(1)
Alias_Imogene.GetRef().Disable()
RIR03_RadiantCount.SetValue(1)
RIR05_RadiantCount.SetValue(1)
RI_RadiantQuestGiver.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(2)
RI08.SetStage(7)
RI05_ImogeneDead.SetValue(1)
Alias_Imogene.GetRef().Disable()
RIR03_RadiantCount.SetValue(1)
RI_RadiantQuestGiver.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
SetStage(4)
Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
RI05_ImogeneDead.SetValue(1)
SetStage(4)
Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(0)
SetStage(4)
Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
SetStage(4)
RI_NPCRadiantAvailable.SetValue(1)
RI_RadiantQuestStartKeyword.SendStoryEvent()
RI_RadiantPointerQuest.SetStage(10)

Actor ImogeneRef = Alias_Imogene.GetActorRef()
ImogeneRef.MoveTo(Alias_RadiantPointerFurniture.GetRef())
ImogeneRef.EvaluatePackage()

Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(1)
RI05_ImogeneDead.SetValue(1)
SetStage(4)
RI_NPCRadiantAvailable.SetValue(1)
RI_RadiantQuestStartKeyword.SendStoryEvent()
RI_RadiantPointerQuest.SetStage(10)

Actor YukoRef = Alias_Yuko.GetActorRef()
YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef())
YukoRef.EvaluatePackage()

Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(0)
SetStage(4)
RI_NPCRadiantAvailable.SetValue(1)
RI_RadiantQuestStartKeyword.SendStoryEvent()
RI_RadiantPointerQuest.SetStage(10)

Actor YukoRef = Alias_Yuko.GetActorRef()
YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef())
YukoRef.EvaluatePackage()

Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
RIR03_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR03.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
RIR03_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR03.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetStage(2)
SetStage(5010)
RI_RadiantQuestGiver.SetValue(1)
RIR03_RadiantCount.SetValue(1)
RIR03_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR03.SetStage(2)
Game.GetPlayer().AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetStage(2)
SetStage(5010)
RI_RadiantQuestGiver.SetValue(2)
RIR03_RadiantCount.SetValue(1)
RIR03_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR03.SetStage(3)
Game.GetPlayer().AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
RIR04.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
RIR05_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR05.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetStage(2)
SetStage(5010)
RI_RadiantQuestGiver.SetValue(1)
RIR05_RadiantCount.SetValue(1)
RIR05_QuestStartKeyword.SendStoryEvent()
Utility.Wait(3)
RIR05.SetStage(2)
Game.GetPlayer().AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
RI06.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
RIR06_QuestStartKeyword.SendStoryEventAndWait()
RIR06.SetStage(1)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
RI01_TomoDead.SetValue(1)
RIR06_QuestStartKeyword.SendStoryEventAndWait()
RIR06.SetStage(1)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
RI08_MasakoRemainedCEO.SetValue(0)
SetStage(5010)
RI01_TomoDead.SetValue(1)
RIR06_RadiantCount.SetValue(2)
RIR06_QuestStartKeyword.SendStoryEventAndWait()
RIR06.SetStage(3)
SetStage(2)
Game.GetPlayer().AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
RI_RadiantQuestGiver.SetValue(2)
SetStage(5010)
RI08_MasakoRemainedCEO.SetValue(0)
RI05_ImogeneDead.SetValue(1)
RI01_TomoDead.SetValue(1)
RIR06_RadiantCount.SetValue(1)
RIR06_QuestStartKeyword.SendStoryEventAndWait()
RIR06.SetStage(3)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
RI_RadiantQuestGiver.SetValue(2)
SetStage(5010)
RI08_MasakoRemainedCEO.SetValue(0)
RIR06_RadiantCount.SetValue(1)
RIR06_QuestStartKeyword.SendStoryEventAndWait()
RIR06.SetStage(3)
SetStage(2)
Game.GetPlayer().AddPerk(Manipulation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(2)
RI_RadiantQuestGiver.SetValue(1)
RI08_MasakoRemainedCEO.SetValue(1)
RIR07_QuestStartKeyword.SendStoryEventAndWait()
RIR07.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetStage(2)
RI_RadiantQuestGiver.SetValue(2)
RI08_MasakoRemainedCEO.SetValue(0)
RIR07_QuestStartKeyword.SendStoryEventAndWait()
RIR07.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE ri_radiantsupportquestscript
Quest __temp = self as Quest
ri_radiantsupportquestscript kmyQuest = __temp as ri_radiantsupportquestscript
;END AUTOCAST
;BEGIN CODE
Alias_VentDoors.BlockActivation(True, True)
Alias_HoldingCellDoor.GetRef().BlockActivation(True, True)
kmyQuest.LockVentDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
Alias_RI04_CraneButton.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_ClinicSecurityGuard.GetRef().Disable()
Alias_ClinicSecureWingDoor.GetRef().BlockActivation(True, True)
Alias_Kendrick.GetRef().Disable()
Alias_Sean.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
ObjectReference SeanRef = Alias_Sean.GetRef()
ObjectReference KendrickRef = Alias_Kendrick.GetRef()

If RI06_SeanDead.GetValue() == 0 && RI06_KendrickDead.GetValue() == 0
     SeanRef.Enable()
     SeanRef.MoveTo(Alias_SeanMoveMarker.GetRef())
     KendrickRef.Enable()
     KendrickRef.MoveTo(Alias_KendrickMoveMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
Alias_UlaruOfficeEnableMarker.GetRef().Disable()
Alias_MasakoOfficeEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN CODE
Alias_Imogene.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN CODE
; Add keywords to prevent CFR03 from choosing Laredo or Trident.
Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed)
Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed)

; Add keywords to prevent RIR03, RIR04, and RIR06 won't pick Akila
; locations or Trident.
Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_AkilaCityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_AkilaTradeAuthorityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5010_Item_00
Function Fragment_Stage_5010_Item_00()
;BEGIN CODE
Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed)
Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed)

Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_AkilaCityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
Alias_Location_AkilaTradeAuthorityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6000_Item_00
Function Fragment_Stage_6000_Item_00()
;BEGIN CODE
Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6010_Item_00
Function Fragment_Stage_6010_Item_00()
;BEGIN CODE
Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowClothing)
Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowSpacesuit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6020_Item_00
Function Fragment_Stage_6020_Item_00()
;BEGIN CODE
Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowSpacesuit)
Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property RIR03_QuestStartKeyword Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneQS Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

GlobalVariable Property RIR03_RadiantCount Auto Const Mandatory

GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const Mandatory

ReferenceAlias Property Alias_PlayerOfficeQS Auto Const Mandatory

GlobalVariable Property RI_NPCRadiantAvailable Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_PointerQuestNPCQS Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

Quest Property RI_RadiantPointerQuest Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

Keyword Property RIR05_QuestStartKeyword Auto Const Mandatory

Quest Property RIR04 Auto Const Mandatory

Quest Property RIR05 Auto Const Mandatory

GlobalVariable Property RIR05_RadiantCount Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

GlobalVariable Property PlayerJoined_Ryujin Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

Quest Property RIR06 Auto Const Mandatory

Keyword Property RIR06_QuestStartKeyword Auto Const Mandatory

GlobalVariable Property RI01_TomoDead Auto Const Mandatory

GlobalVariable Property RIR06_RadiantCount Auto Const Mandatory

GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

Keyword Property RI_RadiantQuestStartKeyword Auto Const Mandatory

Keyword Property RIR07_QuestStartKeyword Auto Const Mandatory

Quest Property RIR07 Auto Const Mandatory

Quest Property DialogueFCRyujinTower Auto Const Mandatory

RefCollectionAlias Property Alias_VentDoors Auto Const Mandatory

ReferenceAlias Property Alias_HoldingCellDoor Auto Const Mandatory

ReferenceAlias Property Alias_Kendrick Auto Const Mandatory

ReferenceAlias Property Alias_Sean Auto Const Mandatory

ReferenceAlias Property Alias_Kai Auto Const Mandatory

ReferenceAlias Property Alias_ClinicSecureWingDoor Auto Const Mandatory

ReferenceAlias Property Alias_ClinicSecurityGuard Auto Const Mandatory

GlobalVariable Property RI06_SeanDead Auto Const Mandatory

GlobalVariable Property RI06_KendrickDead Auto Const Mandatory

ReferenceAlias Property Alias_KendrickMoveMarker Auto Const Mandatory

ReferenceAlias Property Alias_SeanMoveMarker Auto Const Mandatory

Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const Mandatory

GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_RI04_CraneButton Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_YukoOfficeDoor Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

GlobalVariable Property RI_LaneUnlockTLs Auto Const Mandatory

GlobalVariable Property RI05_UlaruDead Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_RadiantPointerFurniture Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory

GlobalVariable Property RI02_NinaHartDead Auto Const Mandatory

ReferenceAlias Property Alias_Nina Auto Const Mandatory

ReferenceAlias Property Alias_Harper Auto Const Mandatory

GlobalVariable Property RI02_AngeloSoldaniDead Auto Const Mandatory

GlobalVariable Property RI03_StanleyDead Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

ReferenceAlias Property Alias_Angelo Auto Const Mandatory

GlobalVariable Property RI08_UlaruRemainedCFO Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_PlayerOfficeDoor Auto Const Mandatory

Quest Property RI08_PostQuest Auto Const Mandatory

LocationAlias Property Alias_Location_LaredoLocation Auto Const Mandatory

Keyword Property LocTypeCFR03NotAllowed Auto Const Mandatory

LocationAlias Property Alias_Location_TridentLocation Auto Const Mandatory

LocationAlias Property Alias_Location_AkilaCityLocation Auto Const Mandatory

LocationAlias Property Alias_Location_AkilaTradeAuthorityLocation Auto Const Mandatory

Keyword Property LocTypeRIRadiantsNotAllowed Auto Const Mandatory

Keyword Property LocTypeShowClothing Auto Const Mandatory

Keyword Property LocTypeShowSpacesuit Auto Const Mandatory

LocationAlias Property Alias_Location_InfinityLTD Auto Const Mandatory
