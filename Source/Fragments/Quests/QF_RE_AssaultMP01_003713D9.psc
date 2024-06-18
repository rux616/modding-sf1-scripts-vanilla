;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RE_AssaultMP01_003713D9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE reassaultquestscript
Quest __temp = self as Quest
reassaultquestscript kmyQuest = __temp as reassaultquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE reassaultquestscript
Quest __temp = self as Quest
reassaultquestscript kmyQuest = __temp as reassaultquestscript
;END AUTOCAST
;BEGIN CODE
Debug.Trace(self + "Defending factio won")
kmyQuest.CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE reassaultquestscript
Quest __temp = self as Quest
reassaultquestscript kmyQuest = __temp as reassaultquestscript
;END AUTOCAST
;BEGIN CODE
Debug.Trace(self + "Attacking faction won")
kmyQuest.CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE reassaultquestscript
Quest __temp = self as Quest
reassaultquestscript kmyQuest = __temp as reassaultquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CleanupAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")

;Rearm the trigger so another RE can happen here on next load
;(Alias_TRIGGER.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const Mandatory
