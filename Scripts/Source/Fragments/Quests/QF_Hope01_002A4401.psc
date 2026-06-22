;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Hope01_002A4401 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Make Mr Sood be active
Alias_MrSood.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)

; Give the player the package
Game.GetPlayer().AddAliasedItem(Hope01SoodPackage, Alias_MrSoodPackage)

; Show a tutorial message
HelpSmuggling.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef())
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

; Remove the package
Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef())
Alias_PlayerShip.GetRef().RemoveItem(Alias_MrSoodPackage.GetRef())

; Disappear Mr. Sood
Alias_MrSood.GetRef().Disable()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
Alias_Chest.GetRef().AddItem(Alias_MrSoodPackage.GetRef())

FailAllObjectives()
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

ReferenceAlias Property Alias_MrSood Auto Const Mandatory

Message Property TestHope01_200 Auto Const Mandatory

ReferenceAlias Property Alias_MrSoodPackage Auto Const Mandatory

MiscObject Property Hope01SoodPackage Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Message Property HelpSmuggling Auto Const Mandatory

ReferenceAlias Property Alias_Chest Auto Const Mandatory
