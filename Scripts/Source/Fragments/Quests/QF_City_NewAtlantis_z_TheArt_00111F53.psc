;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_z_TheArt_00111F53 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Solomon.GetActorRef().RemoveItem(Credits.GetRef())
;Game.GetPlayer().AddItem(Credits.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

Zoe.GetActorRef().RemoveItem(Art.GetRef())
;Game.GetPlayer().RemoveItem(Credits.GetRef())

;Zoe.GetActorRef().AddItem(Credits.GetRef())
Game.GetPlayer().AddItem(Art.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Art.GetRef())
Solomon.GetActorRef().AddItem(Art.GetRef())
Utility.Wait(3)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Solomon Auto Const

ReferenceAlias Property Zoe Auto Const

ReferenceAlias Property Credits Auto Const

ReferenceAlias Property Art Auto Const
