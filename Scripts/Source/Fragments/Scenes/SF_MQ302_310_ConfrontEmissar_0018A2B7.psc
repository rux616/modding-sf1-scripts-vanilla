;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_310_ConfrontEmissar_0018A2B7 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE lc165questscript
lc165questscript kmyQuest = GetOwningQuest() as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Lock player controls.
kMyQuest.SetPlayerControlsEnabled(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE lc165questscript
lc165questscript kmyQuest = GetOwningQuest() as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Unlock player controls.
kMyQuest.SetPlayerControlsEnabled(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE lc165questscript
lc165questscript kmyQuest = GetOwningQuest() as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Your adversary teleports in.
kMyQuest.StarbornAdversaryTeleportInForConfrontation()

;Play music
MUSGenesisStingerStarbornAppear.Add()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MusicType Property MUSGenesisStingerStarbornAppear Auto Const Mandatory
