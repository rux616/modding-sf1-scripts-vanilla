;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SEKT02_SailingHighSe_02031F1D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4)
Alias_TourEscort.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
Utility.Wait(1)
SFFL_SE_KT02_100a_InitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_TourEscort.GetShipRef().DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SFFL_SE_KT02_100a_HailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_TourEscort.GetShipRef().DisableWithGravJump()
SpaceshipReference TourShipRef = Alias_HailingShip.GetShipRef()
if !GetStageDone(390)
    TourShipRef.RemoveFromAllFactions()
endif
TourShipRef.AddToFaction(PPlayerEnemyFaction)
TourShipRef.StartCombat(Alias_PlayerShip.GetShipRef())
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

Scene Property SFFL_SE_KT02_100a_HailingScene Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_TourEscort Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

GlobalVariable Property PSE_Player_FAB10_RunOnce Auto Const Mandatory

Scene Property SFFL_SE_KT02_100a_InitialScene Auto Const Mandatory
