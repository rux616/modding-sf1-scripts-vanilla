;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC070_00173A4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_AmbushEnableMarker.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_LightEnableMarker.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PowerCell Auto Const Mandatory

ActorValue Property AmbushTriggered Auto Const

ReferenceAlias Property Alias_AmbushEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LightEnableMarker Auto Const Mandatory
