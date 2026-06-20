;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SQ_ExtendedCommArray_02054421 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference FriendlyShip = Alias_AlliedShip.GetShipRef()
SpaceshipReference ActiveShip = Alias_PlayerShip.GetShipRef()

if(FriendlyShip && ActiveShip)
  FriendlyShip.MoveNear(ActiveShip, 1, 0, 0)
  FriendlyShip.EnableWithGravJump()
  FriendlyShip.StartCombat(ActiveShip.GetCombatTarget())
endif
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
ExtendedComm_SpawnIn.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SpaceshipReference FriendlyShip = Alias_AlliedShip.GetShipRef()

if(FriendlyShip)
     ExtendedComm_CombatOver.Start()
     FriendlyShip.DisableWithGravJump()
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AlliedShip Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Scene Property ExtendedComm_SpawnIn Auto Const Mandatory

Scene Property ExtendedComm_CombatOver Auto Const Mandatory
