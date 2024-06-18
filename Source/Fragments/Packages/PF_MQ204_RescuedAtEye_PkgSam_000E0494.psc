;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_MQ204_RescuedAtEye_PkgSam_000E0494 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
akActor.ChangeAnimFlavor(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
akActor.ChangeAnimFlavor(AnimFlavorWounded)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property AnimFlavorWounded Auto Const Mandatory
