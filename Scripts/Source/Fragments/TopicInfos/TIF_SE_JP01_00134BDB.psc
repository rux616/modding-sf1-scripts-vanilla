;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_JP01_00134BDB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(200)

AttackingShip01.GetShipReference().EnableWithGravJump()
AttackingShip01.GetShipReference().StartCombat(PlayerShip.GetShipReference())

AttackingShip02.GetShipReference().EnableWithGravJump()
AttackingShip02.GetShipReference().StartCombat(PlayerShip.GetShipReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property HailingShip Auto Const

ReferenceAlias Property Attacking Auto Const

ReferenceAlias Property AttackingShip01 Auto Const

ReferenceAlias Property AttackingShip02 Auto Const

ReferenceAlias Property playerShip Auto Const
