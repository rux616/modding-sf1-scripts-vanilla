;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_Execution_00082C9A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
OE_KT_Execution_Scene_Stage30_Opening.Start()

Actor AttackRef = Alias_NPC_Attacker01.GetActorRef()
Actor ThreatRef = Alias_NPC_Attacker02.GetActorRef()

AttackRef.SetProtected(False)
Alias_NPC_Group01.AddRef(AttackRef)
Alias_NPC_Group01.AddRef(ThreatRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_01
Function Fragment_Stage_0001_Item_01()
;BEGIN CODE
OE_KT_Execution_Scene_Stage25_Opening.Start()

Actor AttackRef = Alias_NPC_Attacker04.GetActorRef()
Actor ThreatRef = Alias_NPC_Attacker03.GetActorRef()

Alias_NPC_Group01.AddRef(AttackRef)
Alias_NPC_Group01.AddRef(ThreatRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, OE_Credit_BribeHigh.GetValueInt())
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, OE_Credit_BribeMedium.GetValueInt())
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_01
Function Fragment_Stage_0003_Item_01()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor ThreatRef = Alias_NPC_Attacker01.GetActorRef()
Actor AttackerRef = Alias_NPC_Attacker02.GetActorRef()

Alias_NPC_Attacker02.GetActorRef().SetProtected(False)
ThreatRef.EvaluatePackage()
ThreatRef.StartCombat(AttackerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, OE_Credit_BribeMedium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
OE_KT_Execution_Scene_Stage30_Opening.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Alias_NPC_Attacker04.GetRef().MoveTo(Alias_XMarkerHeading.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Actor CaptiveRef = Alias_NPC_Captive.GetActorRef()

CaptiveRef.IgnoreFriendlyHits(true)
CaptiveRef.SetValue(Aggression, 0)
CaptiveRef.SetRestrained(true)
CaptiveRef.SetValue(Health, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Alias_NPC_Captive.GetActorRef().SetProtected(False)
Alias_NPC_Captive.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
Alias_NPC_Attacker02.GetActorRef().SetProtected(False)
Alias_NPC_Attacker02.GetActorRef().Kill()
OE_KT_Execution_Scene_Stage30_BountySplit.Stop()
Utility.Wait(1.5)
OE_KT_Execution_Scene_Stage30_ENDPeaceful.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0044_Item_00
Function Fragment_Stage_0044_Item_00()
;BEGIN CODE
Actor Attacker = Alias_NPC_Attacker04.GetActorRef()
Attacker.EvaluatePackage()
Utility.Wait(2)
Alias_NPC_Attacker04.GetActorRef().SetProtected(False)
Alias_NPC_Captive.GetActorRef().StartCombat(Attacker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_NPC_Attacker04.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
Alias_NPC_Captive.GetActorRef().SetProtected(False)
Alias_NPC_Captive.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group01.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
int random = Utility.RandomInt()

if random > 70
    SetStage(30)
else
    SetStage(25)
endif

OE_KT_ExecutionSceneMover.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_NPC_Group01.EvaluateAll()

Actor CaptiveRef = Alias_NPC_Captive.GetActorRef()
CaptiveRef.SetRestrained(false)
CaptiveRef.IgnoreFriendlyHits(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_GrabBag_Small)
Alias_NPC_Captive.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC_Attacker01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Attacker02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Attacker03 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Attacker04 Auto Const Mandatory

LeveledItem Property LL_Weapon_Ranged_Any Auto Const Mandatory

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

Potion Property DrinkPack_Water_Md Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

FormList Property OnlyWaterList Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Captive Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

Potion Property DrinkPouch_CrystalWater_Md Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property OE_KT_Execution_Scene_Stage30_Opening Auto Const Mandatory

Scene Property OE_KT_Execution_Scene_Stage30_BountySplit Auto Const Mandatory

Scene Property OE_KT_Execution_Scene_Stage30_ENDPeaceful Auto Const Mandatory

GlobalVariable Property OE_Credit_BribeMedium Auto Const Mandatory

GlobalVariable Property OE_Credit_BribeHigh Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_GrabBag_Small Auto Const Mandatory

Scene Property OE_KT_Execution_Scene_Stage25_Opening Auto Const Mandatory

ReferenceAlias Property Alias_XMarkerHeading Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Captive Auto Const Mandatory

Scene Property OE_KT_ExecutionSceneMover Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory
