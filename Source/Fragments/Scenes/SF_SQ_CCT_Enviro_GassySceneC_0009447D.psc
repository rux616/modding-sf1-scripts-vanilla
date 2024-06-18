;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_CCT_Enviro_GassySceneC_0009447D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CCT_Enviro_BehaviorScript
CCT_Enviro_BehaviorScript kmyQuest = GetOwningQuest() as CCT_Enviro_BehaviorScript
;END AUTOCAST
;BEGIN CODE
; failsafe
kmyQuest.ApplyBehaviorAbility(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE CCT_Enviro_BehaviorScript
CCT_Enviro_BehaviorScript kmyQuest = GetOwningQuest() as CCT_Enviro_BehaviorScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ApplyBehaviorAbility(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE CCT_Enviro_BehaviorScript
CCT_Enviro_BehaviorScript kmyQuest = GetOwningQuest() as CCT_Enviro_BehaviorScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ApplyBehaviorAbility(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
