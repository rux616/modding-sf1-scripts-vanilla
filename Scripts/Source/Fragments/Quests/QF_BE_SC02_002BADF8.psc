;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_SC02_002BADF8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;On startup:

;Wound or kill the Captain, depending on which Mutineer
;we're dealing with.
((Self as Quest) as BE_SC02QuestScript).SetupCaptain()

;Set the enemy crew and ship to be friendly.
((Self as Quest) as BESCript).SetCrewPlayerFriend(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: Hit event on any member of the crew, mutineer, or ship.

;The entire crew turns hostile.
kMyQuest.SetCrewPlayerFriend(False, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
