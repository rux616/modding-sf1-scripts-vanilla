;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CREW_EliteCrew_BettyHows_0003772A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BettyECQuest.SetStage(700)
Game.GetPlayer().RemoveItem(Credits, CrewHiringCost.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CrewHiringCost Auto Const

Quest Property BettyECQuest Auto Const

MiscObject Property Credits Auto Const
