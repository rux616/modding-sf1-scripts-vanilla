;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_LC088_Space_CF_160_MainBa_0021C91B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
UCSysDefFaction.SetAlly(PlayerFaction, True, True)
UCSysDefFaction.SetAlly(CrimeFactionCrimsonFleet, True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
lc088_spacequestscript kmyQuest = GetOwningQuest() as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
UCSysDefFaction.SetEnemy(PlayerFaction)
UCSysDefFaction.SetEnemy(CrimeFactionCrimsonFleet)
kMyQuest.SetStageNoWait(161)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
