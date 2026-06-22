;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CF05_SuspiciousMarineAtta_00090E5E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
CF05_Alarm.SetStage(60)
Alias_CF05_AlertedGuard_ForceGreeter03.GetActorRef().StartCombat(Game.GetPlayer())
CF05_SuspiciousMarineAttackScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF05_Alarm Auto Const Mandatory

ReferenceAlias Property Alias_CF05_AlertedGuard_ForceGreeter03 Auto Const Mandatory

Scene Property CF05_SuspiciousMarineAttackScene Auto Const Mandatory
