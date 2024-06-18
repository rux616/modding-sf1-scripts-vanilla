;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_HiveMine_0004BD9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
ObjectReference Nest = Alias_Activator.GetRef()

if Nest.GetDistance(Alias_Marker_SceneA01.GetRef()) < 15
    Nest.MoveTo(Alias_Marker_LargeGroundObject00.GetRef())
else
    Alias_Container_Reward.GetRef().DisableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
OE_KT_HiveMine_Scene01.Start()

Alias_NPC02.GetActorRef().SetRestrained(true)
Alias_NPC03.GetActorRef().SetRestrained(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.GetPlayer().AddAliasedItem(OE_KT_HiveMine_Canister_Poison, Alias_Poison_Canister)
SetStage(30)

ObjectReference MarkerRef = Alias_Activator.GetRef()
int k = Utility.RandomInt(0,5)
int i = 0

if k == 0
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_HexapodAGlider, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
elseif k == 1
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACockroach, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
elseif k == 2
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACoralbug, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
elseif k == 3
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidAHookneck, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
elseif k == 4
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
elseif k == 5
    while i < 4
        Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab, abSnapOffsetToNavmesh = true))
        i += 1
    endwhile
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef())
Game.GetPlayer().RemoveItem(OE_KT_HiveMine_Canister_Poison)
WwiseEvent_NestDamage.Play(Game.GetPlayer())
Game.ShakeCamera(afStrength = shakeFloat)
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Aid_MedPack)
if GetStageDone(70)
    SetStage(80)
endif
Alias_NPC02.GetActorRef().SetRestrained(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Aid_MedPack)
if GetStageDone(60)
    SetStage(80)
endif
Alias_NPC02.GetActorRef().SetRestrained(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
Alias_NPC_Trader.GetActorRef().EvaluatePackage()
Alias_NPC00.GetActorRef().EvaluatePackage()
Alias_NPC01.GetActorRef().EvaluatePackage()
Alias_NPC02.GetActorRef().EvaluatePackage()
Alias_NPC03.GetActorRef().EvaluatePackage()
Alias_NPC04.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
OE_KT_HiveMine_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_01
Function Fragment_Stage_0175_Item_01()
;BEGIN CODE
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;Game.GetPlayer().AddItem(LL_OE_Default_Reward)
OE_KT_HiveMine_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Predators_Group Auto Const Mandatory

Scene Property OE_KT_HiveMine_Scene01 Auto Const Mandatory

LeveledItem Property LL_OE_Default_Reward Auto Const Mandatory

Scene Property OE_KT_HiveMine_Scene02 Auto Const Mandatory

MiscObject Property OE_KT_HiveMine_Canister_Poison Auto Const Mandatory

ReferenceAlias Property Alias_Poison_Canister Auto Const Mandatory

WwiseEvent Property WwiseEvent_NestDamage Auto Const Mandatory

ReferenceAlias Property Alias_Activator Auto Const Mandatory

ReferenceAlias Property Alias_HiveNest Auto Const Mandatory

Potion Property Aid_MedPack Auto Const Mandatory

Float Property shakeFloat Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const Mandatory

ReferenceAlias Property Alias_Marker_SceneA01 Auto Const Mandatory

ReferenceAlias Property Alias_Marker_LargeGroundObject00 Auto Const Mandatory

ReferenceAlias Property Alias_Container_Reward Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Trader Auto Const Mandatory

ReferenceAlias Property Alias_NPC00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC03 Auto Const Mandatory

ReferenceAlias Property Alias_NPC04 Auto Const Mandatory
