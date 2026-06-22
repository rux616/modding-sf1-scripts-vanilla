;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC_EncryptedSlateQuest_001D5AAF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
ObjectReference Player = Alias_Player.GetReference()

if Player.GetValue(FC_EncryptedSlatesCollectedAV) == 2
  FC05.SetStage(2100)
  FC06.SetStage(2000)
  SetStage(1000)
else
  if FC05.GetStageDone(2000)
    FC05.SetStage(2100)
  else
    FC06.SetStage(2000)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
ObjectReference Player = Alias_Player.GetReference()

; if FC05 is running, remove slate and shut it down
if FC05.IsRunning()
  FC05.SetStage(2100)
elseif FC06.IsRunning()
  FC06.SetStage(2000)
endif

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Start FC08
FC08.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const Mandatory

Quest Property FC05 Auto Const Mandatory

Quest Property FC06 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

Book Property FC05_MarcoDataslate Auto Const Mandatory

Book Property FC06_MayaDataslate Auto Const Mandatory

Quest Property FC08 Auto Const Mandatory

ReferenceAlias Property Alias_MarcoSlate Auto Const Mandatory

ReferenceAlias Property Alias_MayaSlate Auto Const Mandatory
