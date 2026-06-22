;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_VideoShot07_001B4BFE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack)
VideoActorRefAlias.GetActorRef().RemoveItem(Grendel)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
;close door
VideoDoor.GetRef().SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
VideoDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VideoDoor Auto Const

ReferenceAlias Property VideoActorRefAlias Auto Const

Armor Property Spacesuit_Constellation_Backpack Auto Const Mandatory

Weapon Property Grendel Auto Const Mandatory
