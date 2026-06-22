;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CREW_Generic_Recruit_0026C4C0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE crew_genericcrewquestscript
crew_genericcrewquestscript kmyQuest = GetOwningQuest() as crew_genericcrewquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateCost()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
