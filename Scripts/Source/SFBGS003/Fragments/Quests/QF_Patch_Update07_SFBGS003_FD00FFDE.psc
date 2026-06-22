;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_Patch_Update07_SFBGS003_FD00FFDE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
FFNewHomesteadR04MiscQuestStartKeyword.SendStoryEventAndWait()
If DialogueNewHomestead.GetStageDone(402) || DialogueNewHomestead.GetStageDone(411) 
   FFNewHomesteadR04QuestStartKeyword.SendStoryEventAndWait()
EndIf
If DialogueNewHomestead.GetStageDone(413)
   FFNewHomesteadR04QuestStartKeyword.SendStoryEventAndWait()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property FFNewHomesteadR04MiscQuestStartKeyword Auto Const Mandatory

Keyword Property FFNewHomesteadR04QuestStartKeyword Auto Const Mandatory

Quest Property DialogueNewHomestead Auto Const Mandatory

Weapon Property Cutter Auto Const Mandatory
