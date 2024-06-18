;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_AkilaLife02_00112ACE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Don't show Sahar's farm until it's ready
Alias_SaharFarmMapMarker.GetRef().Disable()

; Make it so the Farm doesn't spawn any OE quests
Alias_OETrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
if ( !GetStageDone(50) )
  SetObjectiveDisplayed(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Now you can go to the farm
Alias_SaharFarmMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Refresh the Alias - no longer necessary
; Alias_FarmContainer.RefillAlias()

; Create the Will
; Alias_FarmContainer.GetRef().AddAliasedItem(AkilaLife02_SaharWill, Alias_SaharWill)

int i = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

; Remove the Will
Alias_SaharWill.GetRef().Delete()
Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill)

; Give the player a load of credits
Game.GetPlayer().AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300, FALSE)
SetObjectiveCompleted(400)

; Remove the Will
Alias_SaharWill.GetRef().Delete()
Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SaharFarmMapMarker Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_FarmContainer Auto Const Mandatory

Book Property AkilaLife02_SaharWill Auto Const Mandatory

ReferenceAlias Property Alias_SaharWill Auto Const Mandatory

ReferenceAlias Property Alias_OETrigger Auto Const Mandatory
