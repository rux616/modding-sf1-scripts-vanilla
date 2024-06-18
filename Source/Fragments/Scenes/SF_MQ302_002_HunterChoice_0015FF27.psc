;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_002_HunterChoice_0015FF27 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Alias_Emissary.GetActorRef().PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ReferenceAlias Property Alias_Emissary Auto Const
