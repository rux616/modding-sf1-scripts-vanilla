;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_DeadManBox_00062700 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
ObjectReference RewardKey = Alias_KeyObject.GetRef()
ObjectReference CorpseInventory = Alias_Corpse.GetRef()

CorpseInventory.AddItem(RewardKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_StashContainer.Getref().Lock()
Alias_StashContainer.Getref().SetLockLevel(75)

Alias_StashContainer.Getref().MoveTo(Alias_StashContainer.Getref(), 0.0, 0.0, -0.2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property OE_PackageCheck_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_StashContainer Auto Const Mandatory

ReferenceAlias Property Alias_KeyObject Auto Const Mandatory
