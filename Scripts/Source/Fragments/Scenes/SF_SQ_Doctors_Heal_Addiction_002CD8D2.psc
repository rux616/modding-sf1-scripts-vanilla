;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Doctors_Heal_Addiction_002CD8D2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE SQ_DoctorsScript
SQ_DoctorsScript kmyQuest = GetOwningQuest() as SQ_DoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.HealAddictions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
