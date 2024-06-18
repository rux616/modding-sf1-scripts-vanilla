;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF_Post_00143472 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart 0: CF Quickstart

;Run through LC088_Vigilance up to this point.
LC088.SetStage(10)
LC088_Vigilance.SetStage(8)
LC088_Vigilance.SetStage(1101)
LC088_Space.SetStage(195)
CF08_Fleet.SetStage(1000)

;Move the player to the cTest so the Vigilance can move safely.
Game.GetPlayer().MoveTo(cTestCOCMarkerRef)

;Force the CF Postquest state.
SetStage(110)

;Then move the player into space and to the Key.
kMyQuest.QuickstartToKey()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart 1: SD Quickstart

;Run through LC088_Key up to this point.
LC088.SetStage(10)
LC088_Key.SetStage(9)
Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort)
LC088_Key.SetStage(1101)
LC088_Key.SetStage(2000)
LC088_Space.SetStage(295)
CF08_SysDef.SetStage(1000)

;Move the player to the cTest so the Vigilance can move safely.
Game.GetPlayer().MoveTo(cTestCOCMarkerRef)

;Set up the SD Postquest state.
SetStage(200)
SetStage(210)

;Then move the player into space and to the Key.
kMyQuest.QuickstartToKey()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set by: CF_Post_Toft_TL_TheKeyPlayerHome

;Give the player access to the Captain's Quarters on the Key.
DialogueCFTheKey.SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Vigilance stage 1100.

;Cleanup all of the Captains' ships.
kMyQuest.CF_CleanupAllCaptainShips()

;Switch the Vigilance to the Crimson Fleet Faction.
kMyQuest.CF_ConvertVigilance()

;Register for location change to do further setup.
kMyQuest.RegisterForPostquestLocationChange()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script; player leaves Suvorov orbit after 100 set.

;Clean up LC088 and its subquests, and shut it down.
LC088.SetStage(2000)

;Disable the ships of the Captains who leave the Key.
kMyQuest.CF_DisableCaptainShips()

;Move the Vigilance to its final position and cripple it.
kMyQuest.CF_MoveAndCrippleVigilance()

;Disable the LC088 Turrets at the Key.
Alias_LC088_KeyTurretsEnableMarker.TryToDisable()

;Enable CFPost CF Traffic Manager, Turrets, & Ships docked w/ Vigilance.
CFPost_CFEnableMarker.TryToEnable()

;Enable Fleet sandboxers on the Vigilance
Alias_CFPost_FleetAtVigilanceEnableMarker.GetRef().EnableNoWait()

;Move Ikande and Toft to the brig if they survive
if (LC088_Vigilance.GetStageDone(1019))
    (LC082 as LC082_brigquestscript).AddPrisoner(Alias_CF_Post_Kibwe.GetActorRef(), 1)
    (LC082 as LC082_brigquestscript).AddPrisoner(Alias_CF_Post_Toft.GetActorRef(), 2)
EndIf

;Set up the Data Core Analyzer in its final home.
Alias_CF08_Key_DataCoreAnalyzer_EnableMarker.TryToDisable()
Alias_CF08_Key_DataCoreAnalyzer_DisableMarker.TryToEnable()
Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker.TryToEnable()
Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker.TryToDisable()
(Alias_CFPost_Key_DataCoreAnalyzer.GetRef() as DefaultMultiStateActivator).SetAnimationState("Done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key stage 1100.

;Register for location change to do further setup.
kMyQuest.RegisterForPostquestLocationChange()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE CF_PostQuestScript
Quest __temp = self as Quest
CF_PostQuestScript kmyQuest = __temp as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script; player leaves Suvorov orbit after 200 set.

;Clean up LC088 and its subquests, and shut it down.
LC088.SetStage(2000)

;Cleanup all of the Captains' ships.
kMyQuest.SD_CleanupAllCaptainShips()

;Remove CF08's protections from the Vigilance's Main actors.
LC082.SetStage(211)

;Move the Vigilance to its final position.
kMyQuest.SD_MoveVigilance()

;Disable the LC088 Turrets at the Key.
Alias_LC088_KeyTurretsEnableMarker.TryToDisable()

;Enable CFPost SD Traffic Manager, Turrets, and Ships docked w/ Key.
CFPost_SDEnableMarker.TryToEnable()

;Enable SysDef soldiers on the Key with Patrol/Sandbox packages
Alias_CFPost_SysDefatKeyEnableMarker.TryToEnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias property CFPost_CFEnableMarker Auto Const Mandatory
ReferenceAlias property CFPost_SDEnableMarker Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory
Quest Property CF08_Fleet Auto Const Mandatory
Quest Property CF08_SysDef Auto Const Mandatory
Quest Property LC088 Auto Const Mandatory
Quest Property LC088_Key Auto Const Mandatory
Quest Property LC088_Vigilance Auto Const Mandatory

ReferenceAlias Property Alias_Vigilance Auto Const Mandatory

ReferenceAlias Property Alias_LC088_KeyTurretsEnableMarker Auto Const Mandatory

ObjectReference Property LC082_Quickstart_DockingPort Auto Const Mandatory

ObjectReference Property cTestCOCMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_CFPost_SysDefatKeyEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_CFPost_FleetatVigilanceEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF_Post_Kibwe Auto Const Mandatory

ReferenceAlias Property Alias_CF_Post_Toft Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ReferenceAlias property Alias_CF08_Key_DataCoreAnalyzer_EnableMarker Auto Const Mandatory
ReferenceAlias property Alias_CF08_Key_DataCoreAnalyzer_DisableMarker Auto Const Mandatory
ReferenceAlias property Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker Auto Const Mandatory
ReferenceAlias property Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker Auto Const Mandatory
ReferenceAlias property Alias_CFPost_Key_DataCoreAnalyzer Auto Const Mandatory

Quest Property LC088_Space Auto Const Mandatory
