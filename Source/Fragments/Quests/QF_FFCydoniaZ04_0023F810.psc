;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ04_0023F810 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest if it's still running.
If FFCydoniaZ04Misc.IsRunning()
	FFCydoniaZ04Misc.SetStage(1000)
EndIf

Alias_Walls.EnableAll()

SetObjectiveDisplayed(100)
Game.GetPlayer().AddItem(StackOfDrawings.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(StackOfDrawings.GetRef())
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().SetValue(FFCydoniaZ04_ForeknowledgeAV, 1)
FFCydoniaZ04Posters.Start()
FFCydoniaR04_SpaceFrogRecipe_MSG.Show()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property StackOfDrawings Auto Const Mandatory

Quest Property FFCydoniaZ04Misc Auto Const Mandatory

RefCollectionAlias Property Alias_Walls Auto Const Mandatory

Quest Property FFCydoniaZ04Posters Auto Const Mandatory

Message Property FFCydoniaR04_SpaceFrogRecipe_MSG Auto Const Mandatory

ActorValue Property FFCydoniaZ04_ForeknowledgeAV Auto Const Mandatory
