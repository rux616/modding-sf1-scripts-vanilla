;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CFSD01_001E8E2A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
CF_Main.SetStage(1)
SetStage(5)
kmyQuest.DebugAddAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Quest Triggered from CF01_Stage220_Toft_BriefingScene
If CF_Main.GetStageDone(300) == 0
SetObjectiveDisplayed(100)
EndIf

;Enable any Disabled Evidence
CF01_Evidence_KempRef.Enable()
CF06_Evidence_EstelleVincentRef.Enable()
Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef().Enable()
CF06_TTGWallSafeRef.AddItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef())
CFKeyZ02_Evidence_AytonRef.Enable()
CFSD01_Evidence_MSC_HopeTownRef.Enable()
CFSD01_Evidence_MSC_ChunksRef.Enable()
CFSD01_Evidence_MSC_KreetRef.Enable()
CF05_Evidence_HuanDaiyuRef.Enable()
CFSD01_Evidence_MSC_ChiopteraRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF01_Kemp.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_Carter.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_LockRiots.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_Rokov.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_GalbankScheme.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_Daiyu.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_ComSpike.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_EstelleVincent.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf

Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef().SetActorOwner(Player)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF07_KryxFate.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Durand.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Voss.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ01_Maddie.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ02_Kirova.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Jaso.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chunks.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chiroptera.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Paradiso.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
If CF_Main.GetStageDone(300) == 0
kmyQuest.EvidenceCheck()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN AUTOCAST TYPE CFSD01_QuestScript
Quest __temp = self as Quest
CFSD01_QuestScript kmyQuest = __temp as CFSD01_QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Kreet.GetRef())
utility.wait(1)
kmyQuest.EvidenceCheck()
kmyQuest.EvidenceCounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Swap Adler Kemp Factions
Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CrimeFactionUC)
Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CydoniaFaction)
Alias_CFSD01_AdlerKemp.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet)

;Set Global for Endgame
CrimsonFleetCaptainState_Adler.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Alias_CFSD01_EvgenyRokov.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet)

;Set Global for Endgame
CrimsonFleetCaptainState_Rokov.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;Set Global for Endgame
CrimsonFleetCaptainState_Huan.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Swap EstelleVincent Factions
Actor EstelleRef = Alias_CFSD01_EstelleVincent.GetActorRef()
EstelleRef.RemoveFromFaction(CrimeFactionNeon)
EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)

;Set Global for Endgame
CrimsonFleetCaptainState_Estelle.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(100) == 1
SetObjectiveDisplayed(100,0)
endif

SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Do not stop quest - aliases need to remain active!
;KICKOUT HAS HAPPENED

If IsObjectiveDisplayed(100) == 1
SetObjectiveDisplayed(10,0)
Endif

If IsObjectiveDisplayed(200) == 1
SetObjectiveDisplayed(200,0)
Endif

If IsObjectiveDisplayed(300) == 1
SetObjectiveDisplayed(300,0)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
Game.GetPlayer().AddItem(LL_Weapon_Reward_CFSD01_Tofts,1)

;Do not stop quest - dialogue needs to remain active!
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CFSD01_Evidence_CF01_Kemp Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF03_Carter Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF03_LockRiots Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF04_Rokov Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF04_GalbankScheme Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF05_Daiyu Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF05_ComSpike Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF06_BayuGenerdyne Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF06_AyumiKomiko Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF06_EstelleVincent Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CF07_KryxFate Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ01_Maddie Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ02_Kirova Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Durand Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Voss Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Jaso Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chunks Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chiroptera Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Paradiso Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Kreet Auto Const Mandatory

ObjectReference Property CF01_Evidence_KempRef Auto Const Mandatory

ObjectReference Property CF06_Evidence_EstelleVincentRef Auto Const Mandatory

ObjectReference Property CF06_Evidence_AyumiKomikoRef Auto Const Mandatory

ObjectReference Property CFKeyZ02_Evidence_AytonRef Auto Const Mandatory

ObjectReference Property CFSD01_Evidence_MSC_HopeTownRef Auto Const Mandatory

ObjectReference Property CFSD01_Evidence_MSC_ChunksRef Auto Const Mandatory

ObjectReference Property CFSD01_Evidence_MSC_KreetRef Auto Const Mandatory

ObjectReference Property CF05_Evidence_HuanDaiyuRef Auto Const Mandatory

ObjectReference Property CFSD01_Evidence_MSC_ChiopteraRef Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property CydoniaFaction Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_AdlerKemp Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_EstelleVincent Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01_EvgenyRokov Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Adler Mandatory Const Auto

GlobalVariable Property CrimsonFleetCaptainState_Rokov Mandatory Const Auto


GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_CFSD01_Tofts Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ObjectReference Property CF06_TTGWallSafeRef Auto Const Mandatory

ActorBase Property Player Auto Const Mandatory
