;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB14_0005B944 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Damage the Star Parcel freighter's engine
SpaceshipReference sTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
ActorValue avSystem = ShipSystemEngineHealth
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Figure out which destination
int nRand = Utility.RandomInt(1,4)
SetStage(400+nRand)

; Store what was rolled
SE_FAB14_DestinationGlobal.SetValue(nRand as Float)
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE SEScript
Quest __temp = self as Quest
SEScript kmyQuest = __temp as SEScript
;END AUTOCAST
;BEGIN CODE
; Set the objective
int nDest = SE_FAB14_DestinationGlobal.GetValue() as Int
SetObjectiveDisplayed(400+nDest)

; Give the player the package
Game.GetPlayer().AddAliasedItem(SE_FAB14_StarParcelPackage, Alias_StarParcelPackage)

; If the player negotiated more caps - pay up
if ( GetStageDone(420) )
  Game.GetPlayer().AddItem(Credits, 500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
; Shove the right ship tech into the alias
Alias_DestinationShipTech.ForceRefTo(Alias_AC_ShipTech.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN CODE
; Shove the right ship tech into the alias
Alias_DestinationShipTech.ForceRefTo(Alias_CY_ShipTech.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN CODE
; Shove the right ship tech into the alias
Alias_DestinationShipTech.ForceRefTo(Alias_Neon_ShipTech.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN CODE
; Shove the right ship tech into the alias
Alias_DestinationShipTech.ForceRefTo(Alias_NA_ShipTech.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Remove the package
Game.GetPlayer().RemoveItem(SE_FAB14_StarParcelPackage)

; Finish the quest
CompleteAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; If you refused to help and leave - then the quest spins down
if ( !GetStageDone(400) )
  Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " stop stage START")
Alias_HailingShip.GetShipRef().DisableWithGravJump()
Stop()
debug.trace(self + " stop stage DONE")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

ReferenceAlias Property Alias_AC_ShipTech Auto Const Mandatory

ReferenceAlias Property Alias_CY_ShipTech Auto Const Mandatory

ReferenceAlias Property Alias_Neon_ShipTech Auto Const Mandatory

ReferenceAlias Property Alias_NA_ShipTech Auto Const Mandatory

ReferenceAlias Property Alias_DestinationShipTech Auto Const Mandatory

GlobalVariable Property SE_FAB14_DestinationGlobal Auto Const Mandatory

MiscObject Property SE_FAB14_StarParcelPackage Auto Const Mandatory

ReferenceAlias Property Alias_StarParcelPackage Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory
