;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF08_Fleet_Misc_000E758F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Quickstart To Key
Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
DialogueCFTheKey.SetStage(300)
LC088_Vigilance.SetStage(1100)
SetStage(100)
Game.GetPlayer().MoveTo(Alias_Key_Scene01_DockingNPC02.GetRef())
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Actor FleetRef = Alias_Key_Scene01NPC_C.GetActorRef()

If FleetRef.IsDead()
   Alias_Key_Scene01NPC_C.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_Fleet_NoSpacesuit))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_01
Function Fragment_Stage_0004_Item_01()
;BEGIN CODE
Actor FleetRef = Alias_Key_Scene02_NPCC.GetActorRef()

FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerC.GetRef())

If FleetRef.IsDead()
   Alias_Key_Scene02_NPCC.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Female))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_02
Function Fragment_Stage_0004_Item_02()
;BEGIN CODE
Actor FleetRef = Alias_Key_Scene02_NPCD.GetActorRef()

FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerD.GetRef())

If FleetRef.IsDead()
   Alias_Key_Scene02_NPCD.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_03
Function Fragment_Stage_0004_Item_03()
;BEGIN CODE
Actor FleetRef = Alias_Key_Scene01NPC_D.GetActorRef()

If FleetRef.IsDead()
   Alias_Key_Scene01NPC_D.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_04
Function Fragment_Stage_0004_Item_04()
;BEGIN CODE
Actor FleetRef = Alias_Key_Scene02_NPCA.GetActorRef()

FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerA.GetRef())

If FleetRef.IsDead()
   Alias_Key_Scene02_NPCA.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_GenericFleet_CaptainPatrol_Operations04))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
CF08_000_KeyScenes_Start.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
ObjectReference SauvageRef = Alias_SauvageRef.GetRef() 
ObjectReference EstelleRef = Alias_Estelle.GetRef()

if SauvageRef != None
    EstelleRef.MoveTo(SauvageRef)
else
    EstelleRef.DisableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Start scene with Fleet actors running to ports

CF08_000_KeyScenes_Start.Stop()
CF08_010_KeyScenes_Pre01.Start()

DialogueUCVigilance.SetStage(4)
Alias_CaptainSit_Mathis.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
Alias_Mathis.GetRef().MoveTo(Alias_CaptainSit_Mathis.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
Alias_Mathis.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_03
Function Fragment_Stage_0010_Item_03()
;BEGIN CODE
;Remove bounty on CF
CrimeFactionCrimsonFleet.SetCrimeGold(0)
CrimeFactionCrimsonFleet.SetCrimeGoldViolent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
CF08_010_KeyScenes_Pre01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Key_Scene02_NPCC.GetActorRef().EvaluatePackage()
Alias_Key_Scene02_NPCB.GetActorRef().EvaluatePackage()
Alias_Key_Scene02_NPCD.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Start Scene two

CF08_010_KeyScenes_Pre02.Start()

;Enable custom CF08 furniture

Alias_OperationsMarker02.GetRef().DisableNoWait()
Alias_OperationsMarker03.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
CF08_010_KeyScenes_Pre03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
CF08_010_KeyScenes_Pre04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Enable docking scene markers
Alias_Key_MiscEnableMarker.GetRef().EnableNoWait()
Alias_Key_Scene01_MarkerA.GetRef().EnableNoWait()
Alias_Key_Scene01NPC_E.GetRef().EnableNoWait()
Alias_Key_Scene01NPC_F.GetRef().EnableNoWait()
;Remove bounty on CF
CrimeFactionCrimsonFleet.SetCrimeGold(0)
CrimeFactionCrimsonFleet.SetCrimeGoldViolent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
CF08_010_KeyScenes_Pre01.Stop()
CF08_010_KeyScenes_Pre02.Stop()
CF08_010_KeyScenes_Pre03.Stop()
CF08_010_KeyScenes_Pre04.Stop()
CF08_110_KeyScenes_Post01.Start()

Alias_Operations_Actor05.GetRef().DisableNoWait()
Alias_Operations_Actor06.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
CF08_110_KeyScenes_Post01.Stop()
CF08_110_KeyScenes_Post02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Move Captain to Operations

Actor AdlerRef = Alias_Adler.GetActorRef()

AdlerRef.EnableNoWait()
AdlerRef.MoveTo(Alias_CaptainSit_Adler.GetRef())
AdlerRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_01
Function Fragment_Stage_0120_Item_01()
;BEGIN CODE
;Move Captain to Operations

Actor EstelleRef = Alias_Estelle.GetActorRef()

EstelleRef.EnableNoWait()
EstelleRef.MoveTo(Alias_CaptainSit_Estelle.GetRef())
EstelleRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_02
Function Fragment_Stage_0120_Item_02()
;BEGIN CODE
;Move Captain to Operations

Actor HuanRef = Alias_Huan.GetActorRef()

HuanRef.EnableNoWait()
HuanRef.MoveTo(Alias_CaptainSit_Huan.GetRef())
HuanRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_03
Function Fragment_Stage_0120_Item_03()
;BEGIN CODE
;Move Captain to Operations

Actor MathisRef = Alias_Mathis.GetActorRef()

MathisRef.EnableNoWait()
MathisRef.MoveTo(Alias_CaptainSit_Mathis.GetRef())
MathisRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_04
Function Fragment_Stage_0120_Item_04()
;BEGIN CODE
;Move Captain to Operations

Actor RokovRef = Alias_Rokov.GetActorRef()

RokovRef.EnableNoWait()
RokovRef.MoveTo(Alias_CaptainSit_Rokov.GetRef())
RokovRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_05
Function Fragment_Stage_0120_Item_05()
;BEGIN CODE
Alias_MathisReplacement.GetRef().EnableNoWait()
SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_06
Function Fragment_Stage_0120_Item_06()
;BEGIN CODE
Alias_Mathis.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Start Foyer scene clear docking NPCs

Alias_Key_Scene02_NPCC.GetActorRef().EquipItem(Tombstone, true)

CF08_110_KeyScenes_Post01.Stop()
CF08_110_KeyScenes_Post02.Stop()
CF08_110_KeyScenes_Post04.Start()

Alias_Key_Scene01_DockingNPC01.Clear()
Alias_Key_Scene01_DockingNPC02.Clear()
Alias_Key_Scene01NPC_C.GetRef().DisableNoWait()
Alias_Key_Scene01NPC_E.GetRef().DisableNoWait()
Alias_Key_Scene01NPC_F.GetRef().DisableNoWait()

ObjectReference MathisMarker = Alias_MathisSitMarker.GetRef()
ObjectReference NaevaMarker = Alias_NaevaSitMarker.GetRef()

ObjectReference Mathis = Alias_Mathis.GetRef()
Actor Naeva = Alias_Naeva.GetActorRef()

if !Mathis.IsDisabled()
    MathisMarker.EnableNoWait()
    Mathis.MoveTo(MathisMarker)
endif

if Naeva.IsDisabled()
    Naeva.EnableNoWait()
endif

Naeva.SnapIntoInteraction(NaevaMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
CF08_110_KeyScenes_Post05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
CF08_110_KeyScenes_Post06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
CFPost_Fleet_Mathis_Forcegreet.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Huan.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Restore everything back to how it was
Alias_OperationsMarker02.GetRef().EnableNoWait()
Alias_Operations_Actor05.GetRef().EnableNoWait()
Alias_Operations_Actor06.GetRef().EnableNoWait()

;Clean up extra actors
int i = 0
while i < CF08_Misc.Length
    CF08_Misc[i].GetRef().DisableNoWait()
    i += 1
endwhile
Alias_CaptainSit_Mathis.GetRef().DisableNoWait()
;Stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property CF08_010_KeyScenes_Pre01 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01NPC_D Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01NPC_C Auto Const Mandatory

Scene Property CF08_010_KeyScenes_Pre02 Auto Const Mandatory

Scene Property CF08_000_KeyScenes_Start Auto Const Mandatory

ReferenceAlias Property Alias_Reaver Auto Const Mandatory

Scene Property CF08_010_KeyScenes_Pre03 Auto Const Mandatory

Scene Property CF08_010_KeyScenes_Pre04 Auto Const Mandatory

ReferenceAlias Property Alias_OperationsMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01_MarkerA Auto Const Mandatory

ReferenceAlias Property Alias_OperationsMarker03 Auto Const Mandatory

Scene Property CF08_110_KeyScenes_Post01 Auto Const Mandatory

ReferenceAlias Property Alias_Estelle Auto Const Mandatory

ReferenceAlias Property Alias_Mathis Auto Const Mandatory

ReferenceAlias Property Alias_Rokov Auto Const Mandatory

ReferenceAlias Property Alias_Huan Auto Const Mandatory

ReferenceAlias Property Alias_Adler Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Estelle Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Mathis Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Huan Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Adler Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Rokov Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01NPC_E Auto Const Mandatory

Scene Property CF08_110_KeyScenes_Post02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01NPC_F Auto Const Mandatory

ReferenceAlias[] Property CF08_Misc Auto Const Mandatory

Scene Property CF08_110_KeyScenes_Post04 Auto Const Mandatory

Quest Property LC088_Vigilance Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

Scene Property CF08_110_KeyScenes_Post05 Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01_DockingNPC02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01_DockingNPC01 Auto Const Mandatory

ReferenceAlias[] Property CF08_Captains Auto Const Mandatory

Scene Property CF08_110_KeyScenes_Post06 Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSit_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_Key_MiscEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_MathisReplacement Auto Const Mandatory

Scene Property CREW_EliteCrew_MathisCastillo_RecruitScene Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPCA Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_SpacePirate_02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPCC Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPCD Auto Const Mandatory

ActorBase Property LvlCrimsonFleet_Male Auto Const Mandatory

ActorBase Property LvlCrimsonFleet_Female Auto Const Mandatory

ActorBase Property CF_TheKey_Fleet_NoSpacesuit Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerD Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerC Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerA Auto Const Mandatory

ActorBase Property CF_TheKey_GenericFleet_CaptainPatrol_Operations04 Auto Const Mandatory

ReferenceAlias Property Alias_Operations_Actor05 Auto Const Mandatory

ReferenceAlias Property Alias_Operations_Actor06 Auto Const Mandatory

Quest Property DialogueUCVigilance Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02_NPCB Auto Const Mandatory

ReferenceAlias Property Alias_MathisSitMarker Auto Const Mandatory

ReferenceAlias Property Alias_NaevaSitMarker Auto Const Mandatory

Weapon Property Tombstone Auto Const Mandatory

ObjectReference Property CFPost_Fleet_Mathis_Forcegreet Auto Const Mandatory

ReferenceAlias Property Alias_SauvageRef Auto Const Mandatory
