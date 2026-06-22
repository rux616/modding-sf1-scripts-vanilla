;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update07b_00318F4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
If UC08.GetStageDone(500)
   Alias_SecurityOfficeDoor.GetRef().Unlock()
EndIf
If UC08.GetStageDone(515) && !UC08.GetStageDone(1000)
   ObjectReference gateREF = Alias_Spaceportgate.Getref()
   gateREF.Unlock()
   gateREF.SetOpen()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
City_Akila_Ashta03.SetStage(95)
Alias_AlphaAshta.GetActorRef().SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
;Unlock Strikers door and set new lock level if door is closed after reset
ObjectReference StrikersDoorRef = Alias_StrikersDoor.GetRef()
if StrikersDoorRef.GetLockLevel() == 255 
   StrikersDoorRef.Unlock()
   StrikersDoorRef.SetLockLevel(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN CODE
RAD05.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_05
Function Fragment_Stage_0000_Item_05()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC08 Auto Const Mandatory

ReferenceAlias Property Alias_SecurityOfficeDoor Auto Const

ReferenceAlias Property Alias_SpaceportGate Auto Const Mandatory

ReferenceAlias Property Alias_StrikersDoor Auto Const Mandatory

ReferenceAlias Property Alias_AlphaAshta Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property City_Akila_Ashta03 Auto Const Mandatory

Quest Property RAD05 Auto Const Mandatory
