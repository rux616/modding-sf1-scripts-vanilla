;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_AnInvi_000B2148 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(Alias_Marcus.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;set the objectives
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)

;give player the invitation slates
Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate1.GetRef())
Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate2.GetRef())
Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate3.GetRef())
Game.GetPlayer().AddItem(Alias_Slate1.GetRef())
Game.GetPlayer().AddItem(Alias_Slate2.GetRef())
Game.GetPlayer().AddItem(Alias_Slate3.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set objectives and remove data slate from player inv

SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(Alias_Slate1.GetRef())
Alias_Tony.GetActorRef().AddItem(Alias_Slate1.GetRef())

;Check to see if the player delivered the other slates

if(GetStageDone(30) == 1 && GetStageDone(40) == 1)

SetStage(50)

endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set objectives and remove data slate from player inv

SetObjectiveCompleted(30)
Game.GetPlayer().RemoveItem(Alias_Slate2.GetRef())
Alias_Evie.GetActorRef().AddItem(Alias_Slate2.GetRef())

;Check to see if the player delivered the other slates

if(GetStageDone(20) == 1 && GetStageDone(40) == 1)

SetStage(50)

endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set objectives and remove data slate from player inv

SetObjectiveCompleted(40)
Game.GetPlayer().RemoveItem(Alias_Slate3.GetRef())
Alias_Johann.GetActorRef().AddItem(Alias_Slate3.GetRef())

;Check to see if the player delivered the other slates

if(GetStageDone(20) == 1 && GetStageDone(30) == 1)

SetStage(50)

endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;don't stop the quest so that players can still see the top levels for Marcus
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Marcus Auto Const Mandatory

ReferenceAlias Property Alias_Slate1 Auto Const Mandatory

ReferenceAlias Property Alias_Slate2 Auto Const Mandatory

ReferenceAlias Property Alias_Slate3 Auto Const Mandatory

ReferenceAlias Property Alias_Tony Auto Const Mandatory

ReferenceAlias Property Alias_Johann Auto Const Mandatory

ReferenceAlias Property Alias_Evie Auto Const Mandatory
