;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF08_SysDef_Misc_0030B8A4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene02.Stop()
CF08_SysDef_MiscScene02b.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Ensign01_Marker.GetRef().EnableNoWait()
Alias_StagingSitMarker01.GetRef().EnableNoWait()
Alias_StagingSitMarker07.GetRef().EnableNoWait()
Alias_KibweBriefing.GetRef().EnableNoWait()
Alias_Soldier11.GetRef().MoveTo(Alias_Soldier_MarkerRef13.GetRef())
Alias_Soldier11.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef13.GetRef())
Alias_Soldier12.GetRef().MoveTo(Alias_Soldier_MarkerRef12.GetRef())
Alias_Soldier12.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef12.GetRef())
Alias_Ensign03.GetActorRef().SetOutfit(Outfit_Clothes_UCNavy_Crew_SysDef)
DialogueUCVigilance.SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene02.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene06.Start()
Actor Pilot1 = Alias_TempMarine05.GetActorRef()
Actor Pilot2 = Alias_TempMarine06.GetActorRef()

Pilot1.EnableNoWait()
Pilot2.EnableNoWait()
Pilot2.SetOutfit(Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet)
Pilot1.EvaluatePackage()
Pilot2.EvaluatePackage()
Alias_TempMarine01.GetRef().DisableNoWait()
Alias_TempMarine02.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_TempMarine03.GetActorRef().EvaluatePackage()
Utility.Wait(1)
Alias_TempMarine04.GetActorRef().EvaluatePackage()
Utility.Wait(1)
Alias_StagingSitMarker07.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene08.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene01.Start()
Actor Marine1 = Alias_TempMarine01.GetActorRef()
Actor Marine2 = Alias_TempMarine02.GetActorRef()
Alias_TempMarine03.GetRef().EnableNoWait()
Alias_TempMarine04.GetRef().EnableNoWait()

Marine1.EnableNoWait()
Marine1.EvaluatePackage()
Utility.Wait(1)
Marine2.EnableNoWait()
Marine2.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene01.Stop()
Alias_Ensign01.GetActorRef().EvaluatePackage()
Alias_Ensign02.GetActorRef().EvaluatePackage()
Alias_Ensign03.GetActorRef().EvaluatePackage()
Alias_Ensign02_marker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN CODE
Actor Marine01 = Alias_TempMarine04.GetActorRef()
Actor Marine02 = Alias_TempMarine07.GetActorRef()
Actor Marine03 = Alias_TempMarine11.GetActorRef()
Actor Marine04 = Alias_TempMarine12.GetActorRef()

Marine01.EnableNoWait()
Marine01.MoveTo(Alias_StagingSitMarkerPortA.GetRef())
Marine01.EvaluatePackage()
Utility.Wait(0.5)
Marine02.EnableNoWait()
Marine02.MoveTo(Alias_StagingSitMarkerPortA.GetRef())
Marine02.EvaluatePackage()
Utility.Wait(0.5)
Marine03.EnableNoWait()
Marine03.MoveTo(Alias_StagingSitMarkerPortB.GetRef())
Marine03.EvaluatePackage()
Marine04.EnableNoWait()
Marine04.MoveTo(Alias_StagingSitMarkerPortB.GetRef())
Marine04.EvaluatePackage()
CF08_SysDef_MiscScene07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
Actor Marine01 = Alias_TempMarine01.GetActorRef()
Actor Marine02 = Alias_TempMarine02.GetActorRef()
Actor Marine03 = Alias_TempMarine03.GetActorRef()

Marine01.EnableNoWait()
Marine01.MoveTo(Alias_StagingSitMarker12.GetRef())
Marine01.EvaluatePackage()
Utility.Wait(0.5)
Marine02.EnableNoWait()
Marine02.MoveTo(Alias_StagingSitMarker12.GetRef())
Marine02.EvaluatePackage()
Utility.Wait(0.5)
Marine03.EnableNoWait()
Marine03.MoveTo(Alias_StagingSitMarker12.GetRef())
Marine03.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Enable Hero's welcome, disable unused furniture

CF08_SysDef_HeroWelcomeEnableMarker.GetRef().EnableNoWait()
Alias_Ensign01_Marker.GetRef().DisableNoWait()
Alias_Ensign02_marker.GetRef().EnableNoWait()

Alias_StagingSitMarker01.GetRef().DisableNoWait()
Alias_TempMarine05.GetRef().DisableNoWait()
Alias_TempMarine06.GetRef().DisableNoWait()
Alias_TempMarine09.GetRef().DisableNoWait()
Alias_TempMarine10.GetRef().DisableNoWait()
Alias_StagingSitMarker20.GetRef().EnableNoWait()
Alias_TempMarine16.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Initiate Applause
Actor TempRef01 = Alias_TempMarine07.GetActorRef()
Actor TempRef02 = Alias_TempMarine08.GetActorRef()

TempRef01.MoveTo(Alias_StagingSitMarker21.GetRef())
TempRef01.EvaluatePackage()
TempRef02.MoveTo(Alias_StagingSitMarker22.GetRef())
TempRef02.EvaluatePackage()

CF08_SysDef_MiscScene01.Stop()
CF08_SysDef_MiscScene02.Start()

;Close door to operations so it's a surprise what's behind

Alias_DoorOperations.GetRef().SetOpen(false)
Alias_TempMarine01.GetRef().DisableNoWait()
Alias_TempMarine02.GetRef().DisableNoWait()
Alias_TempMarine03.GetRef().DisableNoWait()
Alias_TempMarine04.GetRef().DisableNoWait()
Alias_TempMarine11.GetRef().DisableNoWait()
Alias_TempMarine12.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Player enters to cheering
CF08_SysDef_MiscScene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Cheering ends, go back to applauding loop

CF08_SysDef_MiscScene04.Stop()
CF08_SysDef_MiscScene03.Start()
Alias_CF08_SysDef_Ikande.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CF08_SysDef_MiscScene05.Stop()
CF08_SysDef_MiscScene08.Stop()
Alias_SoldiersRefColl.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Cleanup - disperse actors
CF08_SysDef_MiscScene03.Stop()
DialogueUCVigilance_CF_Post_IkandeToftHold.Start()

ObjectReference Marker01 = Alias_BridgeMarker.GetRef()
ObjectReference Marker02 = Alias_Ensign02.GetRef()
Alias_Soldier09.GetRef().MoveTo(Marker01)
Alias_Soldier10.GetRef().MoveTo(Marker01)
Alias_Soldier11.GetRef().MoveTo(Marker02)
Alias_Soldier12.GetRef().MoveTo(Marker02)
CF08_SysDef_HeroWelcomeEnableMarker.GetRef().DisableNoWait()
Alias_SoldiersRefColl.EvaluateAll()
Alias_StagingSitMarker20.GetRef().DisableNoWait()
Alias_TempMarine16.GetRef().DisableNoWait()
Setstage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Cleanup, disable temp furniture and actors then stop
Alias_TempMarine07.GetRef().DisableNoWait()
Alias_TempMarine08.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property CF08_SysDef_MiscScene01 Auto Const Mandatory

ReferenceAlias Property Alias_KibweMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ensign01_marker Auto Const Mandatory

ReferenceAlias Property Alias_Ensign01 Auto Const Mandatory

ReferenceAlias Property Alias_Ensign02 Auto Const Mandatory

ReferenceAlias Property Alias_Ensign03 Auto Const Mandatory

ReferenceAlias Property CF08_SysDef_HeroWelcomeEnableMarker Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene02 Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene03 Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene04 Auto Const Mandatory

ReferenceAlias Property Alias_DoorOperations Auto Const Mandatory

ReferenceAlias Property Alias_SysDef_KeyEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ensign02_marker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const Mandatory

ReferenceAlias Property Alias_BridgeMarker Auto Const Mandatory

ReferenceAlias Property Alias_Soldier09 Auto Const Mandatory

ReferenceAlias Property Alias_Soldier10 Auto Const Mandatory

ReferenceAlias Property Alias_Soldier11 Auto Const Mandatory

ReferenceAlias Property Alias_Soldier12 Auto Const Mandatory

Scene Property DialogueUCVigilance_CF_Post_IkandeToftHold Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene02b Auto Const Mandatory

RefCollectionAlias Property Alias_SoldiersRefColl Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine01 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine02 Auto Const Mandatory

ReferenceAlias Property Alias_Soldier_MarkerRef11 Auto Const Mandatory

ReferenceAlias Property Alias_Soldier_MarkerRef12 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine03 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine04 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine05 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine06 Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene06 Auto Const Mandatory

Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_Helmet Auto Const Mandatory

Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet Auto Const Mandatory

ReferenceAlias Property Alias_Soldier_MarkerRef13 Auto Const Mandatory

Outfit Property Outfit_Clothes_UCNavy_Crew_SysDef Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker07 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine07 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine08 Auto Const Mandatory

ReferenceAlias Property Alias_KibweBriefing Auto Const Mandatory

ReferenceAlias Property Alias_Soldier_MarkerRef09 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine09 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine10 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine11 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine12 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker13 Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene07 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarkerPortA Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarkerPortB Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker12 Auto Const Mandatory

ReferenceAlias Property Alias_TempMarine16 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker20 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker21 Auto Const Mandatory

ReferenceAlias Property Alias_StagingSitMarker22 Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene08 Auto Const Mandatory

Quest Property DialogueUCVigilance Auto Const Mandatory

Scene Property CF08_SysDef_MiscScene05 Auto Const Mandatory
