;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Gang_Tagging_00226526 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_GangSign01.GetRef().GetLinkedRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_GangSign02.GetRef().GetLinkedRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_GangSign03.GetRef().GetLinkedRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
Alias_GangSign01.GetRef().GetLinkedRef().Disable()
Alias_GangSign02.GetRef().GetLinkedRef().Disable()
Alias_GangSign03.GetRef().GetLinkedRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GangSign01 Auto Const Mandatory

ReferenceAlias Property Alias_GangSign02 Auto Const Mandatory

ReferenceAlias Property Alias_GangSign03 Auto Const Mandatory
