;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_FFNeonZ06_00082D1B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Rusty.GetActorRef().AddToFaction(PlayerEnemyFaction)
Rusty.GetActorRef().StartCombat(Game.GetPlayer())
Rusty.GetActorRef().setvalue(Game.GetAggressionAV(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Rusty Auto Const

Faction Property PlayerEnemyFaction Auto Const
