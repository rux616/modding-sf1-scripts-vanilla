;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot04_001B4C01 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;close door
VideoDoor.GetRef().SetOpen(False)

VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack)
VideoActorRefAlias.GetActorRef().EquipItem(Grendel)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VideoDoor Auto Const

ReferenceAlias Property VideoActorRefAlias Auto Const

Armor Property Spacesuit_Constellation_Backpack Auto Const Mandatory

Weapon Property Grendel Auto Const Mandatory
