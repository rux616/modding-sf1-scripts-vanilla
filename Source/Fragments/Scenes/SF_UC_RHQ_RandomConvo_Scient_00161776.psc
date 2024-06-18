;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC_RHQ_RandomConvo_Scient_00161776 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if UC_RHQ_RC_MindControlTestMostRecentResponseGlobal.GetValue() < 0
  UC_RHQ_RC_MindControlTestMostRecentResponseGlobal.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC_RHQ_RC_MindControlTestMostRecentResponseGlobal Auto Const Mandatory
