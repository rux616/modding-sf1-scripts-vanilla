;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_013_HunterScene02_0010DAC2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
MQ204_HunterAppearsSpaceport.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Actor HunterREF = Hunter.GetActorRef()
ABStarbornTeleport.Cast(HunterREF, HunterREF)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ObjectReference Property MQ204_HunterAppearsSpaceport Auto Const Mandatory

Spell Property AbStarbornTeleport Auto Const Mandatory

ReferenceAlias Property Hunter Auto Const