;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFFL_DialogueMilliwhale_0108C2B5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE SFBGS00D:SFFLMS03MilliwhaleColorScript
SFBGS00D:SFFLMS03MilliwhaleColorScript kmyQuest = GetOwningQuest() as SFBGS00D:SFFLMS03MilliwhaleColorScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SwapDesert()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectMod Property SFFL_mod_CCT_Skin_CritterMilliwhaleAlbino Auto Const Mandatory

EffectShader Property SFFL_MilliwhaleAlbinoFXS Auto Const Mandatory

EffectShader Property SFFL_MilliwhaleCommonFXS Auto Const Mandatory
