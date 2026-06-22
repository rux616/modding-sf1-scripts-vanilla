;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC_EncryptedSlateQuest_010017ED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
ObjectReference Player = Alias_Player.GetReference()

if Player.GetValue(FC_EncryptedSlatesCollectedAV) == 2
  FC05.SetStage(2100)
  FC06.SetStage(2000)
  ;Remove Marco slate
  Player.RemoveItem(FC05_MarcoDataslate) 
  ;Remove Maya slate
  Player.RemoveItem(FC06_MayaDataslate)
  SetStage(1000)
else
  if FC05.GetStageDone(2000)
    FC05.SetStage(2100)
    ;Remove Marco slate
    Player.RemoveItem(FC05_MarcoDataslate)
  else
    FC06.SetStage(2000)
    ;Remove Maya slate
    Player.RemoveItem(FC06_MayaDataslate)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
ObjectReference Player = Alias_Player.GetReference()

if FC05.GetStageDone(2000)
  FC05.SetStage(2100)
  ;Remove Marco slate
  Player.RemoveItem(FC05_MarcoDataslate)
else
  FC06.SetStage(2000)
  ;Remove Maya slate
  Player.RemoveItem(FC06_MayaDataslate)
endif

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Start FC07
;FC07.Start()

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
