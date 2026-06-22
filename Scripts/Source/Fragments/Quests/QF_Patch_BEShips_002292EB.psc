;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_BEShips_002292EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Check for BE_Landing quests that have missed their landing events,
;and prompt them to start their encounters.
int i = 0
While (i < BELandings.Length)
     BELandings[i].PATCH_RecheckLanding()
     i = i + 1
EndWhile

;Check for BE_Generic quests that are stuck taking off, and prompt
;them to try taking off again.
i = 0
While (i < BEGenerics.Length)
     BEGenerics[i].PATCH_RetryTakeoff()
     i = i + 1
EndWhile

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


BELandingQuestScript[] property BELandings Auto Const Mandatory
BEScript[] property BEGenerics Auto Const Mandatory
