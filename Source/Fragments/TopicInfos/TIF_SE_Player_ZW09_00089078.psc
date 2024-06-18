;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_Player_ZW09_00089078 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Game.GetCredits(), 200000)
Game.getplayer().AddItem(Pse_player_zw09_Platinum_Warranty)
PSE_Player_ZW09.setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property Pse_zw09_Diamond_Warranty Auto Const Mandatory

Book Property Pse_zw09_Platinum_Warranty Auto Const Mandatory

Quest Property PSE_Player_ZW09 Auto Const Mandatory

Book Property Pse_player_zw09_Platinum_Warranty Auto Const Mandatory
