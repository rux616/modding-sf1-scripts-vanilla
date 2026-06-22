;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueECSConstant_002741B1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_DianaBrackenridge.GetRef().MoveTo(Alias_DianaIntroMarker01.GetRef())
Alias_BomaniRida.GetRef().MoveTo(Alias_BomaniIntroMarker01.GetRef())
Alias_MabhutiDaCosta.GetRef().MoveTo(Alias_MabhutiIntroMarker01.GetRef())
Alias_IntroNPCs.SetGhost(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
MS06.Start()
MS06.SetStage(400)
DialogueECS_Establishing01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ECS_EndState.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
ECS_EndState.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
ECS_EndState.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
;Set the appropriate stages and complete the quest so that 
;FFConstantR02 can start.
SetStage(110)
SetStage(200)
MS06.SetStage(2410)
Game.GetPlayer().MoveTo(Alias_AbeLevitz.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN CODE
ECS_EndState.SetValue(1)
Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef())
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
ECS_EndState.SetValue(2)
Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef())
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
FFConstantR02_NumTimesCompleted.SetValue(FFConstantR02_CompletedNextToLast.GetValue())
SetStage(52)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;If the player has set stage 1 of MS06, do not play the scene, 
;for debug purposes.
If !MS06.GetStageDone(1)
	Alias_Companion.GetRef().MoveTo(Alias_CompanionIntroMarker01.GetRef())
	DialogueECS_Establishing01.Stop()
	DialogueECS_Establishing02.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
MS06.SetStage(500)
DialogueECS_Establishing03.Start()
Alias_IntroNPCs.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
MS06.SetStage(600)
Alias_CargoColonist.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DialogueECSConstantQuestScript
Quest __temp = self as Quest
DialogueECSConstantQuestScript kmyQuest = __temp as DialogueECSConstantQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_NamedECSNPCs.RefillAlias()

;Move the named NPCs to Paradiso
kmyQuest.MoveNPCs()

;Disable ECS Constant generic NPCs on the ship
Alias_GenericNPCs.DisableAll()

;Set the stage on the Paradiso settlement quest to handle
;disabling/enabling Generic NPCs, and changing factions for all
DialogueParadiso.SetStage(2010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
If !FFConstantZ04.IsRunning() && !FFConstantZ04.IsCompleted()
	FFConstantZ04Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1401_Item_00
Function Fragment_Stage_1401_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest
If FFConstantZ04Misc.IsRunning()
	FFConstantZ04Misc.SetStage(1000)
EndIf
FFConstantZ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1451_Item_00
Function Fragment_Stage_1451_Item_00()
;BEGIN CODE
Alias_JanetYang.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
If !FFConstantZ05.IsRunning() && !FFConstantZ05.IsCompleted()
	FFConstantZ05Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1501_Item_00
Function Fragment_Stage_1501_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest
If FFConstantZ05Misc.IsRunning()
	FFConstantZ05Misc.SetStage(1000)
EndIf
FFConstantZ05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
Alias_CargoColonist.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
Alias_EmptyModule.GetRef().Disable()
Alias_GravDrivemodules.EnableAll()

ECSConstantRoamingHandlerQuestStartKeyword.SendStoryEventAndWait()
SetObjectiveDisplayed(2100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BomaniRida Auto Const Mandatory

ReferenceAlias Property Alias_DianaBrackenridge Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiDaCosta Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard02 Auto Const Mandatory

ReferenceAlias Property Alias_IntroGuard03 Auto Const Mandatory

ReferenceAlias Property Alias_DianaIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_BomaniIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_DianaBridgeMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_BomaniBridgeMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiHomeMarker01 Auto Const Mandatory

Scene Property DialogueECS_Establishing01 Auto Const Mandatory

Scene Property DialogueECS_Establishing02 Auto Const

Scene Property DialogueECS_Establishing03 Auto Const

Quest Property MS06 Auto Const Mandatory

ReferenceAlias Property Alias_JanetYang Auto Const Mandatory

GlobalVariable Property ECS_EndState Auto Const Mandatory

Quest Property FFConstantZ04 Auto Const Mandatory

Quest Property FFConstantZ04Misc Auto Const Mandatory

Quest Property FFConstantZ05 Auto Const Mandatory

Quest Property FFConstantZ05Misc Auto Const Mandatory

ReferenceAlias Property Alias_AbeLevitz Auto Const Mandatory

ReferenceAlias Property Alias_CompanionIntroMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

GlobalVariable Property FFConstantR02_CompletedNextToLast Auto Const Mandatory

GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const Mandatory

ReferenceAlias Property Alias_CargoColonist Auto Const Mandatory

Quest Property DialogueParadiso Auto Const Mandatory

RefCollectionAlias Property Alias_NamedECSNPCs Auto Const Mandatory

Keyword Property ECSConstantRoamingHandlerQuestStartKeyword Auto Const Mandatory

ReferenceAlias Property Alias_ECSConstantShip Auto Const Mandatory

ReferenceAlias Property Alias_ECSConstantGravDrive Auto Const Mandatory

ReferenceAlias Property Alias_EmptyModule Auto Const Mandatory

RefCollectionAlias Property Alias_GravDriveModules Auto Const Mandatory

RefCollectionAlias Property Alias_GenericNPCs Auto Const Mandatory

RefCollectionAlias Property Alias_IntroNPCs Auto Const Mandatory
