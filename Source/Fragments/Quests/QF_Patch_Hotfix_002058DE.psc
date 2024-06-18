;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Hotfix_002058DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;MQ105 - if the quest failed to start because the guard was killed beforehand, restart it
If MQ103.IsCompleted() && MQ104A.IsCompleted() && MQ104B.IsCompleted()
  If (MQ105.IsCompleted() == False) && (MQ105.IsRunning() == False)
    MQ105.SetStage(10)
  EndIf
EndIf

;FC04 - if the quest failed to start because the syndicate doorman was killed beforehand, restart it
If FC03.IsCompleted() && (FC04.IsRunning() == False)
  FC04.SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ103 Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

Quest Property MQ104B Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

Quest Property FC03 Auto Const Mandatory

Quest Property FC04 Auto Const Mandatory
