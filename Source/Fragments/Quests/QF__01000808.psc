;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01000808 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
int SelectedScene = Utility.RandomInt(1,10)

If SelectedScene <= 2
   SetStage(110) ; Basic Scene 20%
ElseIf SelectedScene <= 6
   SetStage(120) ; Stranded Scene 40%
Else 
   SetStage(130) ; Challenge Scene 40%
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE OEScript
Quest __temp = self as Quest
OEScript kmyQuest = __temp as OEScript
;END AUTOCAST
;BEGIN CODE
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
