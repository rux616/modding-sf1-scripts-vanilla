;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_EmergencyRepairs_00057B00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
OE_KT_EmergencyRepairs_Global.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
OE_KT_EmergencyRepairs_Global02.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
OE_KT_EmergencyRepairs_Global03.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
OE_KT_EmergencyRepairs_Global04.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Alias_MapMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Alias_PilotSeat.GetRef().BlockActivation(True, False)
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False)
OE_KT_EmergencyRepairs_MoveToPostion.Start()

Actor PilotRef = Alias_NPC_VanguardCaptain.GetActorRef()

Cell myShipCell = Alias_PilotSeat.GetRef().GetParentCell()
myShipCell.SetFactionOwner(OE_ShipOwnerFaction)
myShipCell.SetPublic(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_ShipA.RefillDependentAliases()

Alias_soundMarker.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
int Randomizer = Utility.RandomInt(1,4)

if Randomizer == 1
    SetStage(11)
elseif Randomizer == 2
    SetStage(12)
elseif Randomizer == 3
    SetStage(13)
elseif Randomizer == 4
    SetStage(14)
endif

kmyQuest.LandShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
SetStage(10)

int i = 0

While i < 1
int Randomizer = Utility.RandomInt(1,4)

if Randomizer == 1 && OE_KT_EmergencyRepairs_Global.GetValue() == 0
    SetStage(11)
    i += 1
elseif Randomizer == 2 && OE_KT_EmergencyRepairs_Global02.GetValue() == 0
    SetStage(12)
    i += 1
elseif Randomizer == 3 && OE_KT_EmergencyRepairs_Global03.GetValue() == 0
    SetStage(13)
    i += 1
elseif Randomizer == 4 && OE_KT_EmergencyRepairs_Global04.GetValue() == 0
    SetStage(14)
    i += 1
endif

endWhile

kmyQuest.LandShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
if Game.GetPlayer().GetDistance(Alias_ShipA_LandingDeckMarker00.GetRef()) > 10
    Alias_soundMarker.GetRef().DisableNoWait()
    SpaceshipReference ShipRef = Alias_ShipA.GetShipRef()
    ShipRef.PlayAnimation("to_ShipFullHealth")
    ShipRef.SetExteriorLoadDoorInaccessible(True)
    kmyQuest.LaunchShip(0)
    if Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
       Alias_MapMarker.TryToDisable()
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_VanguardCaptain Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_ShipContainer Auto Const Mandatory

Scene Property OE_KT_EmergencyRepairs_MoveToPostion Auto Const Mandatory

GlobalVariable Property OE_KT_EmergencyRepairs_Global Auto Const Mandatory

GlobalVariable Property OE_KT_EmergencyRepairs_Global02 Auto Const Mandatory

GlobalVariable Property OE_KT_EmergencyRepairs_Global03 Auto Const Mandatory

ReferenceAlias Property Alias_ShipLoadDoor Auto Const Mandatory

LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const Mandatory

Faction Property OE_ShipOwnerFaction Auto Const Mandatory

GlobalVariable Property OE_KT_EmergencyRepairs_Global04 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

LocationAlias Property Alias_OE_Location Auto Const Mandatory

Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const Mandatory

ReferenceAlias Property Alias_soundMarker Auto Const Mandatory
