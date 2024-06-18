;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_MQ102_002A3901 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor MoaraREF = Alias_Moara.GetActorRef()
MoaraREF.Disable()
MoaraREF.EvaluatePackage()
MoaraREF.Moveto(Alias_CaptiveMarker.GetRef())
MoaraREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Moara Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory
