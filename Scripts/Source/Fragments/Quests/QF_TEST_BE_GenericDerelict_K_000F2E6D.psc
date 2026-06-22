;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TEST_BE_GenericDerelict_K_000F2E6D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
TestGoToSpaceQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SpaceshipReference MyShipRef = Alias_DerelictShip.GetShipRef()

MyShipRef.MoveNear(Alias_PlayerShip.GetShipRef())
Game.GetPlayer().AddPerk(StarshipEngineering)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SpaceshipReference MyShipRef = Alias_DerelictShip01.GetShipRef()

Alias_DerelictShip.GetShipRef().DisableNoWait()
MyShipRef.EnableNoWait()
MyShipRef.MoveNear(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
BE_Player_DerelictShip_Generic.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TestGoToSpaceQuest Auto Const Mandatory

ReferenceAlias Property Alias_DerelictShip Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Perk Property StarshipEngineering Auto Const Mandatory

Quest Property BE_Player_DerelictShip_Generic Auto Const Mandatory

Keyword Property SE_DerelictShipKeyword_Generic Auto Const Mandatory

Keyword Property SE_KT02_ShipKeyword Auto Const Mandatory

ReferenceAlias Property Alias_DerelictShip01 Auto Const Mandatory
