;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Hotelier_TopLevel_0032AF8C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE SQ_HoteliersQuestScript
SQ_HoteliersQuestScript kmyQuest = GetOwningQuest() as SQ_HoteliersQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetRoomPrices()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
