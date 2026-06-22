;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot09_001BFFAE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack_01)
VideoActorRefAlias.GetActorRef().RemoveItem(Grendel)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VideoActorRefAlias Auto Const

Weapon Property Grendel Auto Const Mandatory

Armor Property Spacesuit_Constellation_Backpack_01 Auto Const Mandatory
