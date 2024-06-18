;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ305_000_GravJumpUnity_0005490F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
Game.GetPlayer().StopCombatAlarm()
PlayerShip.GetShipRef().SetGhost()
ShipGravJumpSpaceVFX.Play(PlayerShip.GetRef())
MUSGenesisStingerGravJumpUnity.Add()
Game.HideHudMenus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq305script
mq305script kmyQuest = GetOwningQuest() as mq305script
;END AUTOCAST
;BEGIN CODE
PlayerShip.GetShipRef().SetGhost(False)
kmyquest.GravJumpToUnity()
ShipGravJumpSpaceVFX.Stop(PlayerShip.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerShip Auto Const

VisualEffect Property ShipGravJumpSpaceVFX Auto Const Mandatory

MusicType Property MUSGenesisStingerGravJumpUnity Auto Const Mandatory
