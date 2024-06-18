;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ201B_03_Vladimir_001B1D81_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
MQ00_CompanionAtEye.GetActorRef().PlayIdle(IdleAnimObjUnequipAll)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MQ00_CompanionAtEye Auto Const

Idle Property IdleAnimObjUnequipAll Auto Const Mandatory
