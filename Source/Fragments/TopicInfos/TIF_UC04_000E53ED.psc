;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_UC04_000E53ED Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !UC04_694_YumiTerrormorphScene_HellosStartup.IsPlaying() && !UC04_695_Yumi_Post2ndMorphKilled.IsPlaying()
  UC04_694_YumiTerrormorphScene_HellosStartup.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC04_694_YumiTerrormorphScene_HellosStartup Auto Const Mandatory

Scene Property UC04_695_Yumi_Post2ndMorphKilled Auto Const Mandatory
