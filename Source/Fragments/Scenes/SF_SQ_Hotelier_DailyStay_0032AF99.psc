;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Hotelier_DailyStay_0032AF99 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE SQ_HoteliersQuestScript
SQ_HoteliersQuestScript kmyQuest = GetOwningQuest() as SQ_HoteliersQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RentedRoomDaily()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
