;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_ECSConstantRoamingHandl_003C23E6_2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If !FFConstantZ05.IsRunning() && !FFConstantZ05.IsCompleted()
	FFConstantZ05Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If !FFConstantR02.IsRunning() && !FFConstantR02Misc.IsRunning() && FFConstantR02_NumTimesCompleted.GetValue() < FFConstantR02_CompletedLimit.GetValue()
	FFConstantR02MiscQuestStartKeyword.SendStoryEvent()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE ECSConstantRoamingHandlerQuestScript
Quest __temp = self as Quest
ECSConstantRoamingHandlerQuestScript kmyQuest = __temp as ECSConstantRoamingHandlerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RandomJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
ECSConstantRoamingHandlerQuestStartKeyword.SendStoryEventAndWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFConstantZ05 Auto Const Mandatory

Quest Property FFConstantZ05Misc Auto Const Mandatory

Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const Mandatory

Quest Property FFConstantR02 Auto Const Mandatory

Quest Property FFConstantR02Misc Auto Const Mandatory

GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const Mandatory

GlobalVariable Property FFConstantR02_CompletedLimit Auto Const Mandatory

Keyword Property ECSConstantRoamingHandlerQuestStartKeyword Auto Const Mandatory

ReferenceAlias Property Alias_ShipMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ship Auto Const Mandatory
