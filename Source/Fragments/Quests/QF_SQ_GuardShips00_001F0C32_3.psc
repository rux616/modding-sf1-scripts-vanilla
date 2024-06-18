;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_GuardShips00_001F0C32_3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE guardshipquestscript
Quest __temp = self as Quest
guardshipquestscript kmyQuest = __temp as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.debugAlarmStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE guardshipquestscript
Quest __temp = self as Quest
guardshipquestscript kmyQuest = __temp as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 50")
kmyQuest.AllowLanding()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory
