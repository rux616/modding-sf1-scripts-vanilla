;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update04_0020D381 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
ObjectReference SS_AkilaRef = Alias_SS_AkilaCity.GetRef()
ObjectReference FurnitureRef = SS_AkilaRef.GetLinkedRef()

if SS_AkilaRef.GetDistance(FurnitureRef) > DistanceCheck
    SS_AkilaRef.MoveTo(FurnitureRef)
endif


ObjectReference SS_CydoniaRef = Alias_SS_Cydonia.GetRef()
ObjectReference FurnitureRef_Cydonia = SS_CydoniaRef.GetLinkedRef()

if SS_CydoniaRef.GetDistance(FurnitureRef_Cydonia) > DistanceCheck
    SS_CydoniaRef.MoveTo(FurnitureRef_Cydonia)
endif


ObjectReference SS_EleosRetreatRef = Alias_SS_EleosRetreat.GetRef()
ObjectReference FurnitureRef_EleosRetreat = SS_EleosRetreatRef.GetLinkedRef()

if SS_EleosRetreatRef.GetDistance(FurnitureRef_EleosRetreat) > DistanceCheck
    SS_EleosRetreatRef.MoveTo(FurnitureRef_EleosRetreat)
endif



ObjectReference SS_GagarinRef = Alias_SS_Gagarin.GetRef()
ObjectReference FurnitureRef_Gagarin = SS_GagarinRef.GetLinkedRef()

if SS_GagarinRef.GetDistance(FurnitureRef_Gagarin) > DistanceCheck
    SS_GagarinRef.MoveTo(FurnitureRef_Gagarin)
endif


ObjectReference SS_HopeTownRef = Alias_SS_HopeTown.GetRef()
ObjectReference FurnitureRef_HopeTown = SS_HopeTownRef.GetLinkedRef()

if SS_HopeTownRef.GetDistance(FurnitureRef_HopeTown) > DistanceCheck
    SS_HopeTownRef.MoveTo(FurnitureRef_HopeTown)
endif


ObjectReference SS_NeonRef = Alias_SS_Neon.GetRef()
ObjectReference FurnitureRef_Neon = SS_NeonRef.GetLinkedRef()

if SS_NeonRef.GetDistance(FurnitureRef_Neon) > DistanceCheck
    SS_NeonRef.MoveTo(FurnitureRef_Neon)
endif


ObjectReference SS_NewAtlantisRef = Alias_SS_NewAtlantis.GetRef()
ObjectReference FurnitureRef_NewAtlantis = SS_NewAtlantisRef.GetLinkedRef()

if SS_NewAtlantisRef.GetDistance(FurnitureRef_NewAtlantis) > DistanceCheck
    SS_NewAtlantisRef.MoveTo(FurnitureRef_NewAtlantis)
endif


ObjectReference SS_NewHomesteadRef = Alias_SS_NewHomestead.GetRef()
ObjectReference FurnitureRef_NewHomestead = SS_NewHomesteadRef.GetLinkedRef()

if SS_NewHomesteadRef.GetDistance(FurnitureRef_NewHomestead) > DistanceCheck
    SS_NewHomesteadRef.MoveTo(FurnitureRef_NewHomestead)
endif


ObjectReference SS_ParadisoRef = Alias_SS_Paradiso.GetRef()
ObjectReference FurnitureRef_Paradiso = SS_ParadisoRef.GetLinkedRef()

if SS_ParadisoRef.GetDistance(FurnitureRef_Paradiso) > DistanceCheck
    SS_ParadisoRef.MoveTo(FurnitureRef_Paradiso)
endif


ObjectReference SS_RHQRef = Alias_SS_RHQ.GetRef()
ObjectReference FurnitureRef_RHQ = SS_RHQRef.GetLinkedRef()

if SS_RHQRef.GetDistance(FurnitureRef_RHQ) > DistanceCheck
    SS_RHQRef.MoveTo(FurnitureRef_RHQ)
endif



ObjectReference SS_TheClinicRef = Alias_SS_TheClinic.GetRef()
ObjectReference FurnitureRef_TheClinic = SS_TheClinicRef.GetLinkedRef()

if SS_TheClinicRef.GetDistance(FurnitureRef_TheClinic) > DistanceCheck
    SS_TheClinicRef.MoveTo(FurnitureRef_TheClinic)
endif

ObjectReference SS_TheDenRef = Alias_SS_TheDen.GetRef()
ObjectReference FurnitureRef_TheDen = SS_TheDenRef.GetLinkedRef()

if SS_TheDenRef.GetDistance(FurnitureRef_TheDen) > DistanceCheck
    SS_TheDenRef.MoveTo(FurnitureRef_TheDen)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
City_NewAtlantis_Z_TheBoot.SetObjectiveFailed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
Actor HuongRef = Alias_Huong.GetActorRef()
Actor HamzaRef = Alias_Hamza.GetActorRef()

if HuongRef.IsDead()
   HuongRef.Resurrect()
endif

if HamzaRef.IsDead()
   HamzaRef.Resurrect()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN CODE
Alias_EarlFulton.GetActorRef().Resurrect()

if City_NA_Botany02.IsCompleted() && !City_NA_Botany03.IsCompleted() && !City_NA_Botany03.IsRunning()
    City_NA_Botany03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_05
Function Fragment_Stage_0000_Item_05()
;BEGIN CODE
(CF05 as CF05_LayerScript).CF05_Layer.EnableFastTravel(false)
(CF05 as CF05_LayerScript).CF05_Layer.EnableFarTravel(false)

Game.GetPlayer().MoveTo(Alias_CF05_Huan.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_06
Function Fragment_Stage_0000_Item_06()
;BEGIN CODE
CF04_AccessDoor01Ref.SetLockLevel(0)
CF04_AccessDoor01Ref.Unlock()
CF04_AccessDoor02Ref.SetLockLevel(0)
CF04_AccessDoor02Ref.Unlock()
CF04_AccessDoor03Ref.SetLockLevel(0)
CF04_AccessDoor03Ref.Unlock()
CF04_AccessDoor01Ref.SetOpen()
CF04_AccessDoor02Ref.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_07
Function Fragment_Stage_0000_Item_07()
;BEGIN CODE
;Door Locks Handling
CF04_SheilaDoorRef.SetLockLevel(0)
CF04_SheilaDoorRef.Unlock()
CF04_DumbroskyDoorRef.SetLockLevel(0)
CF04_DumbroskyDoorRef.Unlock()
CF04_SwistDoorRef.SetLockLevel(0)
CF04_SwistDoorRef.Unlock()
CF04_VeraDoorRef.SetLockLevel(0)
CF04_VeraDoorRef.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_08
Function Fragment_Stage_0000_Item_08()
;BEGIN CODE
ObjectReference BaseDoorREF = Alias_VaruunBasementDoor.GetRef()
BaseDoorRef.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_09
Function Fragment_Stage_0000_Item_09()
;BEGIN CODE
PSQ_Airlock.RemoveActorFromInsideActorsAlias(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_10
Function Fragment_Stage_0000_Item_10()
;BEGIN CODE
MQ_TempleQuest_MQ104A.SetStageNoWait(10)

if MQ104a.IsObjectiveDisplayed(70)
  MQ104a.SetObjectiveDisplayed(70, false)
  Utility.Wait(1.0)
  MQ104a.SetObjectiveDisplayed(70, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_11
Function Fragment_Stage_0000_Item_11()
;BEGIN CODE
Alias_Vasco.GetRef().AddItem(Companion_AmmoLaser,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_12
Function Fragment_Stage_0000_Item_12()
;BEGIN CODE
;move Nadia to New Atlantis linked ref if moved outside the city
Actor NadiaRef = Alias_NadiaMuffaz.GetActorRef()
ObjectReference LocRef = Alias_SSNN_NadiaMuffaz_LocRef.GetRef()

NadiaRef.MoveTo(LocRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_13
Function Fragment_Stage_0000_Item_13()
;BEGIN CODE
;move George to New Atlantis linked ref if moved outside the city
Actor GeorgeRef = Alias_GeorgeSaintGeorge.GetActorRef()
ObjectReference LocRef = Alias_SSNN_NadiaMuffaz_LocRef.GetRef()

GeorgeRef.MoveTo(LocRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_14
Function Fragment_Stage_0000_Item_14()
;BEGIN CODE
;granting the Trade Tower key if the Neon player house quest did not complete purchase
PlayerHouseSystem.PurchaseHouse(housekey = FCNeon_TradeTowerPlayerHomeKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_15
Function Fragment_Stage_0000_Item_15()
;BEGIN CODE
MQ106.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_16
Function Fragment_Stage_0000_Item_16()
;BEGIN CODE
MQ103.MQ103EnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_17
Function Fragment_Stage_0000_Item_17()
;BEGIN CODE
MQ204.MQ204EnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_18
Function Fragment_Stage_0000_Item_18()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SS_AkilaCity Auto Const Mandatory

Int Property DistanceCheck Auto Const

ReferenceAlias Property Alias_SS_Cydonia Auto Const Mandatory

ReferenceAlias Property Alias_SS_EleosRetreat Auto Const Mandatory

ReferenceAlias Property Alias_SS_Gagarin Auto Const Mandatory

ReferenceAlias Property Alias_SS_HopeTown Auto Const Mandatory

ReferenceAlias Property Alias_SS_Neon Auto Const Mandatory

ReferenceAlias Property Alias_SS_NewAtlantis Auto Const Mandatory

ReferenceAlias Property Alias_SS_NewHomestead Auto Const Mandatory

ReferenceAlias Property Alias_SS_Paradiso Auto Const Mandatory

ReferenceAlias Property Alias_SS_RHQ Auto Const Mandatory

ReferenceAlias Property Alias_SS_TheClinic Auto Const Mandatory

ReferenceAlias Property Alias_SS_TheDen Auto Const Mandatory

Quest Property City_NewAtlantis_Z_TheBoot Auto Const Mandatory

ReferenceAlias Property Alias_Huong Auto Const Mandatory

ReferenceAlias Property Alias_Hamza Auto Const Mandatory

Quest Property FFNeonZ09 Auto Const Mandatory

ReferenceAlias Property Alias_EarlFulton Auto Const Mandatory

Quest Property City_NA_Botany02 Auto Const Mandatory

Quest Property City_NA_Botany03 Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Huan Auto Const Mandatory

Quest Property CF04 Auto Const Mandatory

ObjectReference Property CF04_AccessDoor01Ref Auto Const Mandatory

ObjectReference Property CF04_AccessDoor02Ref Auto Const Mandatory

ObjectReference Property CF04_AccessDoor03Ref Auto Const Mandatory

ObjectReference Property CF04_SheilaDoorRef Auto Const Mandatory

ObjectReference Property CF04_DumbroskyDoorRef Auto Const Mandatory

ObjectReference Property CF04_SwistDoorRef Auto Const Mandatory

ObjectReference Property CF04_VeraDoorRef Auto Const Mandatory

ReferenceAlias Property Alias_VaruunBasementDoor Auto Const Mandatory

sq_airlock_questscript Property PSQ_Airlock Auto Const Mandatory

Quest Property MQ_TempleQuest_MQ104A Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const

Ammo Property Companion_AmmoLaser Auto Const

ReferenceAlias Property Alias_NadiaMuffaz Auto Const Mandatory

ReferenceAlias Property Alias_SSNN_NadiaMuffaz_LocRef Auto Const Mandatory

ReferenceAlias Property Alias_GeorgeSaintGeorge Auto Const Mandatory

Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory

Quest Property MQ106 Auto Const Mandatory

MQ103Script Property MQ103 Auto Const Mandatory

mq204script Property MQ204 Auto Const Mandatory
