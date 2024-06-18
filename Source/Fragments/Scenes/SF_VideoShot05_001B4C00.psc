;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot05_001B4C00 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;close door
VideoDoor.GetRef().SetOpen(False)
VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack)
VideoActorRefAlias.GetActorRef().UnEquipItem(Grendel)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
VideoActorRefAlias.GetActorRef().UnEquipItem(Spacesuit_Constellation_Backpack)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VideoDoor Auto Const

ReferenceAlias Property VideoActorRefAlias Auto Const

Armor Property Spacesuit_Constellation_Backpack Auto Const Mandatory

Weapon Property Grendel Auto Const Mandatory
