;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_KT01_0003BC50 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
int random = Utility.RandomInt(0,2)

SpaceshipReference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef()
SpaceshipReference Male06 = Alias_HailingShip_Male06.GetShipRef()
SpaceshipReference Male08 = Alias_HailingShip_Male08.GetShipRef()

if random == 0
    Alias_HailingShip.ForceRefTo(FemaleEvenToned)
elseif random == 1
    Alias_HailingShip.ForceRefTo(Male06)
elseif random == 2
    Alias_HailingShip.ForceRefTo(Male08)
endif

SpaceshipReference pShip = Alias_HailingShip.GetShipRef()
pShip.EnableNoWait()
pShip.IgnoreFriendlyHits()
pShip.SetValue(SpaceshipCrew, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
SpaceshipReference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef()

Alias_HailingShip.ForceRefTo(FemaleEvenToned)
Alias_HailingShip.GetShipRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
SpaceshipReference Male06 = Alias_HailingShip_Male06.GetShipRef()

Alias_HailingShip.ForceRefTo(Male06)
Alias_HailingShip.GetShipRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
SpaceshipReference Male08 = Alias_HailingShip_Male08.GetShipRef()

SpaceshipReference Male06 = Alias_HailingShip_Male06.GetShipRef()

Alias_HailingShip.ForceRefTo(Male08)
Alias_HailingShip.GetShipRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
BE_KT01.SetObjectiveSkipped(10)
BE_KT01.SetObjectiveSkipped(20)
SetObjectiveSkipped(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
Actor CaptainRef = Alias_Captain.GetActorRef()

CaptainRef.RemoveFromFaction(REPlayerAlly)
CaptainRef.AddtoFaction(PlayerEnemyFaction)
CaptainRef.SetValue(Aggression, 1)
CaptainRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
Alias_MapMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveFailed(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip_FemaleEvenToned Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip_Male06 Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip_Male08 Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Quest Property BE_KT01 Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const

Faction Property REPlayerAlly Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

LocationAlias Property Alias_HailingShipInterior Auto Const Mandatory
