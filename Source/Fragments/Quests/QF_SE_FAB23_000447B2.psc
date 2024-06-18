;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB23_000447B2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Spawn all the Spacers for Nia Kalu to fight
ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef()
SpaceshipReference sShip
SpaceshipReference sNia = Alias_NiaKalu.GetRef() as SpaceshipReference 
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
SpaceshipBase sBadGuy = EncShip_Spacer_M01
sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , 500.0, 0.0)
Alias_SpacerBaddies.AddRef(sShip)
sShip.SetValue(Aggression, 3.0)

sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , -500.0, 0.0)
Alias_SpacerBaddies.AddRef(sShip)
sShip.SetValue(Aggression, 3.0)

sBadGuy = EncShip_Spacer_F01
sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , 0.0, 500.0)
Alias_SpacerBaddies.AddRef(sShip)
sShip.SetValue(Aggression, 3.0)

sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , 0.0, -500.0)
Alias_SpacerBaddies.AddRef(sShip)
sShip.SetValue(Aggression, 3.0)

; Now get all the baddies to attack
Alias_SpacerBaddies.StartCombatAll(sNia)
Alias_SpacerBaddies.StartCombatAll(sPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; After a short delay, Nia does her intro
Utility.Wait(3.0)
SE_FAB23_100_IntroBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Nia barks at the end of combat
SE_FAB23_200_HostilesDown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; After you talk with her, she ports out
utility.wait(4)
SpaceshipReference sShip = Alias_NiaKalu.GetRef() as SpaceshipReference
sShip.DisableWithGravJumpNoWait()
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

ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const Mandatory

SpaceshipBase Property EncShip_Spacer_F01 Auto Const
SpaceshipBase Property EncShip_Spacer_M01 Auto Const

RefCollectionAlias Property Alias_SpacerBaddies Auto Const Mandatory

Scene Property SE_FAB23_100_IntroBark Auto Const Mandatory

Scene Property SE_FAB23_200_HostilesDown Auto Const Mandatory

ReferenceAlias Property Alias_NiaKalu Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory
