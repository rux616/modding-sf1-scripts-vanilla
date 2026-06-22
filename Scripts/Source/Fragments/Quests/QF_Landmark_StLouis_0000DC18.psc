;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Landmark_StLouis_0000DC18 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE LandmarkScript
Quest __temp = self as Quest
LandmarkScript kmyQuest = __temp as LandmarkScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)

;play the sound
Wwise_Event_QST_Landmark_Snowglobe.PlayUI()

; For the meta reward of the Landmarks quests
kMyQuest.LandmarkFound()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property Wwise_Event_QST_Landmark_Snowglobe Auto Const Mandatory
