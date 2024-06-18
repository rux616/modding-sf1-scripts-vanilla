;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_Spread_001145EE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)

;Tommy gives the player three pieces of journalism

Tommy.GetActorRef().RemoveItem(NewsSlate.GetRef())
Tommy.GetActorRef().RemoveItem(NewsSlateReview.GetRef())
Tommy.GetActorRef().RemoveItem(NewsSlateSanctum.GetRef())

Game.GetPlayer().AddItem(NewsSlate.GetRef())
Game.GetPlayer().AddItem(NewsSlateReview.GetRef())
Game.GetPlayer().AddItem(NewsSlateSanctum.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set objectives and remove data slate from player inv

SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(NewsSlate.GetRef())
George.GetActorRef().AddItem(NewsSlate.GetRef())

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
Game.GetPlayer().RemoveItem(NewsSlateReview.GetRef())
Royce.GetActorRef().AddItem(NewsSlateReview.GetRef())

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
Game.GetPlayer().RemoveItem(NewsSlateSanctum.GetRef())
Catherine.GetActorRef().AddItem(NewsSlateSanctum.GetRef())

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
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property pCity_NA_Z_SpreadTheNewsDataSlate Auto Const Mandatory

ReferenceAlias Property Tommy Auto Const

ReferenceAlias Property NewsSlate Auto Const

ReferenceAlias Property NewsSlateReview Auto Const

ReferenceAlias Property NewsSlateSanctum Auto Const

ReferenceAlias Property George Auto Const

ReferenceAlias Property Catherine Auto Const

ReferenceAlias Property Royce Auto Const
