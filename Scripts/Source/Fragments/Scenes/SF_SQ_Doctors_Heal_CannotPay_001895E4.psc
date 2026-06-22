;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Doctors_Heal_CannotPay_001895E4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE SQ_DoctorsScript
SQ_DoctorsScript kmyQuest = GetOwningQuest() as SQ_DoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CannotPay()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
