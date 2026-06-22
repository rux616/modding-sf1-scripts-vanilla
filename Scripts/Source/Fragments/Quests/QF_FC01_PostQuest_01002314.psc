;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC01_PostQuest_01002314 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Unlock bank doors and set levels to unlocked
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
if !Alias_Player.GetRef().IsInLocation(CityAkilaCityLocation)
  ; Disable bank robbers
  Alias_JedBullock.GetActorRef().Disable()
  Alias_Robber02.GetActorRef().Disable()
  Alias_Robber03.GetActorRef().Disable()
  Alias_Robber04.GetActorRef().Disable()
  Alias_Robber05.GetActorRef().Disable()
  Alias_Robber06.GetActorRef().Disable()
  Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property CityAkilaCityLocation Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_JedBullock Auto Const Mandatory

ReferenceAlias Property Alias_Robber02 Auto Const Mandatory

ReferenceAlias Property Alias_Robber03 Auto Const Mandatory

ReferenceAlias Property Alias_Robber04 Auto Const Mandatory

ReferenceAlias Property Alias_Robber05 Auto Const Mandatory

ReferenceAlias Property Alias_Robber06 Auto Const Mandatory
