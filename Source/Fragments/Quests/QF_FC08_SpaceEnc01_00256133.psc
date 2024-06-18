;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC08_SpaceEnc01_00256133 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_FirstShipA01.GetShipReference().EnableWithGravJump()
Alias_FirstShipA02.GetShipReference().EnableWithGravJump()

;Utility.Wait(10.0)

;Spawn Ship 01
;float[] offset = new float[6]
;offset[0] = 200 ;Right(positive) and Left(negative)
;offset[1] = 2000 ;front(positive) and behind(negative)
;offset[2] = 100 ;up(positive) and down(negative)
;offset[5] = 180 ;heading/yaw in degrees
;SpaceshipReference SpawnedFirstShipA01 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipB01,akOffsetValues=offset)
;Alias_FirstShips_Wave01.AddRef(SpawnedFirstShipA01)

;Spawn Ship 02
;offset[0] = 0
;offset[1] = 4000
;offset[2] = 0
;SpaceshipReference SpawnedFirstShipA02 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipB02,akOffsetValues=offset)
;Alias_FirstShips_Wave01.AddRef(SpawnedFirstShipA02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_FirstShipB01.GetShipReference().EnableWithGravJump()
Alias_FirstShipB02.GetShipReference().EnableWithGravJump()

;float[] offset = new float[6]
;offset[0] = 200 ;Right(positive) and Left(negative)
;offset[1] = 2000 ;front(positive) and behind(negative)
;offset[2] = 100 ;up(positive) and down(negative)
;offset[5] = 180 ;heading/yaw in degrees
;SpaceshipReference SpawnedFirstShipB01 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipB01,akOffsetValues=offset)
;Alias_FirstShips_Wave02.AddRef(SpawnedFirstShipB01)

;offset[0] = 0
;offset[1] = 2000
;offset[2] = 0
;SpaceshipReference SpawnedFirstShipB02 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipB02,akOffsetValues=offset)
;Alias_FirstShips_Wave02.AddRef(SpawnedFirstShipB02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_FirstShipC01.GetShipReference().EnableWithGravJump()
Alias_FirstShipC02.GetShipReference().EnableWithGravJump()

;float[] offset = new float[6]
;offset[0] = 0 ;Right(positive) and Left(negative)
;offset[1] = 2000 ;front(positive) and behind(negative)
;offset[2] = 100 ;up(positive) and down(negative)
;offset[5] = 180 ;heading/yaw in degrees
;SpaceshipReference SpawnedFirstShipC01 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipC01,akOffsetValues=offset)
;Alias_FirstShips_Wave03.AddRef(SpawnedFirstShipC01)

;offset[0] = 200
;offset[1] = 2500
;offset[2] = 150
;SpaceshipReference SpawnedFirstShipC02 = Alias_PlayerShip.getShipRef().PlaceShipAtMe(FC08_FirstShipC02,akOffsetValues=offset)
;Alias_FirstShips_Wave03.AddRef(SpawnedFirstShipC02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
PFC08.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_FirstShipA01 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipA02 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipB01 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipB02 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipB03 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipC01 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipC02 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipC03 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipC04 Auto Const Mandatory

RefCollectionAlias Property Alias_FirstShips_Wave01 Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

RefCollectionAlias Property Alias_FirstShips_Wave02 Auto Const Mandatory

RefCollectionAlias Property Alias_FirstShips_Wave03 Auto Const Mandatory

Form Property FC08_FirstShipA01 Mandatory Const Auto

Form Property FC08_FirstShipA02 Mandatory Const Auto

Form Property FC08_FirstShipB01 Mandatory Const Auto

Form Property FC08_FirstShipB02 Mandatory Const Auto

Form Property FC08_FirstShipB03 Mandatory Const Auto

Form Property FC08_FirstShipC01 Mandatory Const Auto

Form Property FC08_FirstShipC02 Mandatory Const Auto

Form Property FC08_FirstShipC03 Mandatory Const Auto

Form Property FC08_FirstShipC04 Mandatory Const Auto

Quest Property PFC08 Auto Const Mandatory
