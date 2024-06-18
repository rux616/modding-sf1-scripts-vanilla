;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Viewport01_002926D2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;in the event door has been opened prior, close and lock it
Alias_Door.GetReference().lock(True)
Alias_Door.GetReference().SetOpen(False)
;Enable Emin
Alias_EminMacar.GetReference().Enable()
;Make sure ownership is set on keycard
Alias_Keycard02.getref().SetFactionOwner(UCSecurityFaction)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
If IsObjectivedisplayed(20)
SetObjectiveCompleted(20)
endif
SetObjectiveDisplayed(50)

; Pointer complete
City_NA_GuardPointer_Viewport.SetStage(200)
Alias_EminMacar.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_EminMacar.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_Door.GetReference().lock(false)
Alias_Door.GetReference().SetOpen(True)
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(Alias_Keycard01.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectivedisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Maguffin.GetReference(), 1)
CompleteAllObjectives()
Alias_EminMacar.GetReference().Disable()

; Add the drink to the Vendor Container Ref, so that it can be bought immediately
VendorContainerRef.AddItem(SupernovaDrink, 5)

;if player has already completed MQ105, update this quest's stage
if MQ105.GetStageDone(2000)
SetStage(1500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Stage set when MQ105 has been completed, meaning we're ready for Quest02 in this series
;script on player alias now checks for location change to New Atlantis
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;conditions met for Quest 02 to run
City_NA_Viewport02.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Maguffin Auto Const Mandatory

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Door Auto Const Mandatory

Quest Property City_NA_Viewport02 Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

ReferenceAlias Property Alias_Keycard01 Auto Const Mandatory

Quest Property City_NA_GuardPointer_Viewport Auto Const Mandatory

ReferenceAlias Property Alias_EminMacar Auto Const Mandatory

ReferenceAlias Property Alias_Keycard02 Auto Const Mandatory

Faction Property UCSecurityFaction Auto Const Mandatory

Potion Property SupernovaDrink Auto Const Mandatory

ObjectReference Property vendorContainerRef Auto Const Mandatory
