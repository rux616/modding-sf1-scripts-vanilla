;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Staryard_Trident_Z_Fue_002E7CA5_1 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;only remove 1 velocity of any color from inventory

if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(Staryard_Trident_Z_FuelingGreatness_DrinkList) > 0
    VelocityRemoved.Mod(1)
    Game.GetPlayer().RemoveItem(Staryard_Trident_Z_FuelingGreatness_DrinkList, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property Staryard_Trident_Z_FuelingGreatness_DrinkList Auto Const

GlobalVariable Property VelocityRemoved Auto Const
