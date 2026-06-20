;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SEKT01_MoldBlobs_02063A89 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SFFL_SE_KT01_MoldBlobsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference[] CrewRef = Alias_CrewSpawnMarkers.GetArray()
ObjectReference[] MoldRef = Alias_SmallItemSpawnMarkers.GetArray()

int i = 0
while i < CrewRef.Length
    CrewRef[i].PlaceAtMe(SFFL_SEDerelict_LCharCorpse)
    i += 2
endwhile
int k = 0
while k < MoldRef.Length
    ObjectReference HelperRef = MoldRef[k].PlaceAtMe(AnimHelperActivator, akOffsetValues = MyValues, abSnapOffsetToNavmesh = false)
    ObjectReference HazardRef = MoldRef[k].PlaceAtMe(ENV_CloudHazard_Spores_Toxic)
    ObjectReference MoldBlob = HelperRef.PlaceAtMe(SFFL_SE_KT01_MoldyBlob_Activator, abSnapOffsetToNavmesh = false)
    MoldBlob.SetLinkedRef(HazardRef)
    Alias_MoldBlobs.AddRef(MoldBlob)
    MoldBlob.SetScale(1.5)

    MoldBlob.AttachTo(HelperREf)
    k += 1
endwhile

Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeZeroGAllowClothes)


Alias_CaptainsLocker.GetRef().EnableNoWait()
Alias_CockpitComputer.GetRef().EnableNoWait()
Utility.Wait(2.0)
Actor PlayerRef = Game.GetPlayer()
if PlayerRef.Is3DLoaded()
    Cell ParentCell = Game.GetPlayer().GetParentCell()
    ParentCell.SetGravityScale(0.0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_KT01Script
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_KT01Script kmyQuest = __temp as SFBGS00D:SFFL_SE_KT01Script
;END AUTOCAST
;BEGIN CODE
Cell ParentCell = Game.GetPlayer().GetParentCell()
ParentCell.SetGravityScale(0.0)
kmyQuest.PlayAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_KT01Script
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_KT01Script kmyQuest = __temp as SFBGS00D:SFFL_SE_KT01Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopAlarm()
SFFL_SE_KT01_MoldBlobsSceneEnd.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

LeveledActor Property SFFL_SEDerelict_LCharCorpse Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property LocTypeZeroGAllowClothes Auto Const Mandatory

RefCollectionAlias Property Alias_SmallItemSpawnMarkers Auto Const Mandatory

Activator Property MoldBlobMovableStatic Auto Const Mandatory

RefCollectionAlias Property Alias_MoldBlobs Auto Const Mandatory

ReferenceAlias Property Alias_cockpitComputer Auto Const Mandatory

ReferenceAlias Property Alias_CaptainsLocker Auto Const Mandatory

Scene Property SFFL_SE_KT01_MoldBlobsScene Auto Const

Hazard Property ENV_PoolHazard_MicrobialContamination Auto Const Mandatory

Hazard Property ENV_CloudHazard_Spores_Toxic Auto Const Mandatory

WwiseEvent Property OBJ_Alarm_BoardingAlert Auto Const Mandatory

Scene Property SFFL_SE_KT01_MoldBlobsSceneEnd Auto Const Mandatory

Flora Property SFFL_SE_KT01_FloraMoldyBlob Auto Const Mandatory

ReferenceAlias Property Alias_AnimHelper Auto Const Mandatory

Activator Property AnimHelperActivator Auto Const Mandatory

Float[] Property MyValues Auto Const

Activator Property SFFL_SE_KT01_MoldyBlob_Activator Auto Const Mandatory
