;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_GemJea_000C55B0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Guillaume gives the plate item to the player

Alias_Guillaume.GetActorRef().RemoveItem(Alias_Plate.GetRef())
Game.GetPlayer().AddItem(Alias_Plate.GetRef())

;test!
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Guillaume Auto Const Mandatory

ReferenceAlias Property Alias_George Auto Const Mandatory

ReferenceAlias Property Alias_Gem Auto Const Mandatory

ReferenceAlias Property Alias_Plate Auto Const Mandatory
