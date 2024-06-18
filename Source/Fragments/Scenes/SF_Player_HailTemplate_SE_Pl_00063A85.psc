;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Player_HailTemplate_SE_Pl_00063A85 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
SpaceshipReference PlayerShip = Alias_PlayerShip.GetShipRef()
ObjectReference PlayerRef = Game.GetPlayer()

int CargoShipParts01 = PlayerShip.GetItemCount(InorgRareLithium)
int PlayerShipParts01 = PlayerRef.GetItemCount(InorgRareLithium)
int TotalParts01 = (CargoShipParts01 + PlayerShipParts01)
SE_Player_AC03_Inventory01.SetValue(TotalParts01)

int CargoShipParts02 = PlayerShip.GetItemCount(InorgRarePlatinum)
int PlayerShipParts02 = PlayerRef.GetItemCount(InorgRarePlatinum)
int TotalParts02 = (CargoShipParts02 + PlayerShipParts02)
SE_Player_AC03_Inventory02.SetValue(TotalParts02)

int CargoShipParts03 = PlayerShip.GetItemCount(InorgRareVanadium)
int PlayerShipParts03 = PlayerRef.GetItemCount(InorgRareVanadium)
int TotalParts03 = (CargoShipParts02 + PlayerShipParts03)
SE_Player_AC03_Inventory03.SetValue(TotalParts03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
;this phase ends the scene when the player has Rafael on their crew.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

GlobalVariable Property SE_Player_AC03_Inventory01 Auto Const Mandatory

GlobalVariable Property SE_Player_AC03_Inventory02 Auto Const Mandatory

GlobalVariable Property SE_Player_AC03_Inventory03 Auto Const Mandatory

MiscObject Property InorgRareLithium Auto Const Mandatory

MiscObject Property InorgRareVanadium Auto Const Mandatory

MiscObject Property InorgRarePlatinum Auto Const Mandatory
