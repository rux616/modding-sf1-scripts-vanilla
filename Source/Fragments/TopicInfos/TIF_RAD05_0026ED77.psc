;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RAD05_0026ED77 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Remove the credits from the player
Game.GetPlayer().removeitem(Credits, RAD05_Mercenary_Debt.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RAD05_Mercenary_Debt Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory
