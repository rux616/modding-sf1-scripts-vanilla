;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_013_HunterSceneRep_000D092D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ204Script
MQ204Script kmyQuest = GetOwningQuest() as MQ204Script
;END AUTOCAST
;BEGIN CODE
kmyquest.HunterWarpEnds()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ204_Well_HunterAppearsMarker Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory
