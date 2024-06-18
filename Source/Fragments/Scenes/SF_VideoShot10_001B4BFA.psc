;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot10_001B4BFA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
VideoDoor.GetRef().SetOpen(true)
VideoActorRefAlias.GetActorRef().UnEquipItem(Spacesuit_Constellation_Backpack)
VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack, 999)
VideoActorRefAlias.GetActorRef().RemoveItem(Grendel, 999)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VideoDoor Auto Const

ReferenceAlias Property VideoActorRefAlias Auto Const

Armor Property Spacesuit_Constellation_Backpack Auto Const Mandatory

Weapon Property Grendel Auto Const Mandatory
