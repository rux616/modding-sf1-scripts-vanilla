;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_Photographer_000FC909 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_FoundMapMarker.getref().AddToMapScanned()
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

Furniture Property NPCInjuredOnGround Auto Const

ReferenceAlias Property Alias_Marker_SceneA01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const

Spell Property AbilityDamageHealthSlow Auto Const

ReferenceAlias Property Alias_FoundMapMarker Auto Const Mandatory
