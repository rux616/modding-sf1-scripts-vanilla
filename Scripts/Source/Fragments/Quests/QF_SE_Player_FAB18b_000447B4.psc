;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB18b_000447B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Spawn two Smugglers for Genghis to fight
ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef()
SpaceshipReference sShip
SpaceshipReference sGenghis = Alias_HailingShip.GetRef() as SpaceshipReference 
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
SpaceshipBase sBadGuy = SmugglerBase
sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , 500.0, 0.0)
sShip.RemoveFromAllFactions()
sShip.SetValue(Aggression, 3.0)
sShip.StartCombat(sGenghis)
sShip.StartCombat(sPlayer)
Alias_SmugglerLeader.ForceRefTo(sShip)
Alias_Smugglers.AddRef(sShip)

sShip = oTarg.PlaceShipAtMeOffset(sBadGuy , -500.0, 0.0)
sShip.RemoveFromAllFactions()
sShip.SetValue(Aggression, 3.0)
sShip.StartCombat(sGenghis)
sShip.StartCombat(sPlayer)
Alias_Smugglers.AddRef(sShip)

; Now get all the baddies to attack
Alias_Smugglers.StartCombatAll(sGenghis)
Alias_Smugglers.StartCombatAll(sPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
; Now get all the baddies to attack
SpaceshipReference sGenghis = Alias_HailingShip.GetRef() as SpaceshipReference 
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
Alias_Smugglers.SetValue(Aggression, 3.0)
Alias_Smugglers.StartCombatAll(sGenghis)
Alias_Smugglers.StartCombatAll(sPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
Utility.Wait(5.0)
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Genghis reacts to the smugglers all being dead
SE_FAB18b_200_PostCombatBark.Start()

; Progress Genghis' SE global
MS02_GenghisReactivity.SetValue(3.0)
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
;BEGIN CODE
; Make it so Genghis goes hostile
SpaceshipReference sShip = Alias_HailingShip.GetRef() as SpaceshipReference 
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference 
sShip.RemoveFromAllFactions()
sShip.StartCombat(sPlayer)

; Turn off Genghis' SEs
MS02_GenghisReactivity.SetValue(0.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property SE_FAB18b_200_PostCombatBark Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

GlobalVariable Property MS02_GenghisReactivity Auto Const Mandatory

ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const Mandatory

SpaceshipBase Property SmugglerBase Auto Const

RefCollectionAlias Property Alias_Smugglers Auto Const Mandatory

ReferenceAlias Property Alias_SmugglerLeader Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
