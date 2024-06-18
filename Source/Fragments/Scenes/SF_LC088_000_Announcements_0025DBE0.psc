;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_LC088_000_Announcements_0025DBE0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property LC088_Vigilance_PlayAnnouncementValue Auto Const Mandatory
