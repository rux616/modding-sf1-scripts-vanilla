;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SQ_StarbornContainer_020522D4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Debug stage
Game.GetPlayer().MoveTo(Lodge_RoomMarker_Player)
MQ305.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SQ_StarbornContainerScript
Quest __temp = self as Quest
SFBGS00D:SQ_StarbornContainerScript kmyQuest = __temp as SFBGS00D:SQ_StarbornContainerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TryToStartQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Lodge_RoomMarker_Player Auto Const

Quest Property MQ305 Auto Const

Perk Property Perk_StarbornContainer Auto Const

ActorValue Property QuantumEssence Auto Const
