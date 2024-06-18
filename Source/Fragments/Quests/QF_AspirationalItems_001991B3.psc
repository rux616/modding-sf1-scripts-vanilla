;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AspirationalItems_001991B3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Populate the Cydonian UC Exchange if unpopulated.
if !VendorCyUCExchange.GetRef()
    VendorCyUCExchange.ForceRefTo(CYDenisContainerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VendorCyUCExchange Auto Const Mandatory

ObjectReference Property CYDenisContainerRef Auto Const Mandatory
