;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Doctors_BuySupplies_001895EA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE SQ_DoctorsScript
SQ_DoctorsScript kmyQuest = GetOwningQuest() as SQ_DoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.BuySupplies()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
