;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_013_HunterScene01a_0010D8C5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
MQ204_Well_HunterAppearsMarker.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
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

ObjectReference Property MQ204_Well_HunterAppearsMarker Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

Spell Property AbStarbornTeleport Auto Const Mandatory

ReferenceAlias Property Hunter Auto Const

Spell Property LC165_Starborn_Fire_ScriptedQuantumEssenceSpell Auto Const Mandatory
