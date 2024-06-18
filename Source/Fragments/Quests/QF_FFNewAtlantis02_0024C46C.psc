;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewAtlantis02_0024C46C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
FFNewAtlantis02.Start()
FFNewAtlantis02TopLevels.Start()
FFNewAtlantis02Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

SetObjectiveDisplayed(10)

If GetStageDone(15) == 1
  PlayerREF.AddItem(Credits, FFNewAtlantis02_Credits_Medium.GetValueInt()) ;player gets extra if they used the Bouncer trait
Else
  PlayerREF.AddItem(Credits, FFNewAtlantis02_Credits_Small.GetValueInt())
EndIf

; Pointer complete
City_NA_GuardPointer_NA02.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_PackageActivator.GetRef().EnableNoWait()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_PackageActivator.GetRef().DisableNoWait()

Game.GetPlayer().AddAliasedItem(FFNewAtlantis02_Package, Alias_Package)

SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Package.GetRef())
CompleteAllObjectives()
FFNewAtlantis04.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFNewAtlantis02_Credits_Medium Auto Const Mandatory

GlobalVariable Property FFNewAtlantis02_Credits_Small Auto Const Mandatory

ReferenceAlias Property Alias_PackageActivator Auto Const Mandatory

ReferenceAlias Property Alias_Package Auto Const Mandatory

MiscObject Property FFNewAtlantis02_Package Auto Const Mandatory

Quest Property FFNewAtlantis04 Auto Const Mandatory

Quest Property City_NA_GuardPointer_NA02 Auto Const Mandatory

Quest Property FFNewAtlantis02 Auto Const Mandatory

Quest Property FFNewAtlantis02TopLevels Auto Const Mandatory

Quest Property FFNewAtlantis02Misc Auto Const Mandatory
