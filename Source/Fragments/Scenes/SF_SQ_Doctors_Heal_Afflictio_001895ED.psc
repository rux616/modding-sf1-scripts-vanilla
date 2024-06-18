;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Doctors_Heal_Afflictio_001895ED Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE SQ_DoctorsScript
SQ_DoctorsScript kmyQuest = GetOwningQuest() as SQ_DoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.HealAfflictions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
