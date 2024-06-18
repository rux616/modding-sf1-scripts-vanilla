;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CREW_EliteCrew_BettyHows_0004B4A9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BettyQuest.SetStage(700)
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BettyQuest Auto Const

MiscObject Property Credits Auto Const

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory
