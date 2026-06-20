;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFFL_BE_EC01_02048C07 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Alias_Player.GetRef().GetParentCell().SetGravityScale(0.0)
Utility.Wait(0.5)
Alias_Player.GetRef().GetParentCell().SetGravityScale(-0.5)
Utility.Wait(0.5)
Alias_Player.GetRef().GetParentCell().SetGravityScale(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const Mandatory
