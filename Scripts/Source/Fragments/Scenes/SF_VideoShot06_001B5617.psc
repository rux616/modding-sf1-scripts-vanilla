;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot06_001B5617 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack_01)
VideoActorRefAlias.GetActorRef().RemoveItem(Grendel)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property Grendel Auto Const Mandatory

Armor Property Spacesuit_Constellation_Backpack_01 Auto Const Mandatory

ReferenceAlias Property VideoActorRefAlias Auto Const
