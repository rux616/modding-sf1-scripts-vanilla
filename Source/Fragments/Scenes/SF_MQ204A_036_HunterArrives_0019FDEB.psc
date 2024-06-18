;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_036_HunterArrives_0019FDEB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
MQ204_HunterWellMarker.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ObjectReference Property MQ204_HunterWellMarker Auto Const Mandatory
