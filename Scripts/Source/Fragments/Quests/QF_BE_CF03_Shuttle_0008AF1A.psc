;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_CF03_Shuttle_0008AF1A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by: Startup
;For the CF03 Shuttle specifically, block teleport of waiting followers
;to this ship on startup, and remove it after takeoff.
Location enemyShipInteriorLoc = Alias_EnemyShipInteriorLocation.GetLocation()
enemyShipInteriorLoc.AddKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)

;Add keywords that force a specific takeoff camera for this ship.
enemyShipInteriorLoc.AddKeyword(SpaceshipTakeOffPriorityCameraKeyword)
enemyShipInteriorLoc.AddKeyword(BE_CF03_ShuttleShipKeyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, when leaving the Lock's location.
;For the CF03 Shuttle specifically, block teleport of waiting followers
;to this ship on startup, and remove it after the player escapes from the Lock.
Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias Script, on takeoff.

;Make sure the previous stage has been set.
SetStage(20)

;Remove the keyword that prevents the landing ramp from opening.
Alias_EnemyShip.GetShipRef().RemoveKeyword(SpaceshipPreventRampOpenOnLanding)

;Remove the keyword that forces a specific takeoff camera for this ship.
Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SpaceshipTakeOffPriorityCameraKeyword)

;And stop.
kMyQuest.CleanupAndStop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property SQ_Followers_DisallowTeleportWaitingFollowersToShip Auto Const Mandatory

Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

Keyword Property BE_CF03_ShuttleShipKeyword Auto Const Mandatory

Keyword Property SpaceshipTakeOffPriorityCameraKeyword Auto Const Mandatory
