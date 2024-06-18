;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_002_EmissaryChoice_0015FF2B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Alias_Hunter.GetActorRef().PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const
