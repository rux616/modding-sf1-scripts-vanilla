;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFParadisoZ03_001C433F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
FFParadisoZ03Misc.SetStage(1000)
If !DialogueParadiso.GetStageDone(1320)
	SetObjectiveDisplayed(100)
EndIf
Alias_Rowan.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
Int iBribeAmount = FFParadisoZ03_BribePrice.GetValue() as Int
If myPlayer.GetItemCount(Credits) >= iBribeAmount
	myPlayer.RemoveItem(Credits, iBribeAmount)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
ObjectReference myRecipe = (Alias_Recipe.GetRef())
If myPlayer.GetItemCount(myRecipe) < 1
	myPlayer.AddItem(myRecipe)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
;Add 1 to this tracked value for New Game+. Once the player has 
;done this 4 times, they will "remember" the recipe and will be able to 
;bypass some of the content here if they want.
If myPlayer.GetValue(FFParadisoZ03_Foreknowledge_AV) < 4
	myPlayer.ModValue(FFParadisoZ03_Foreknowledge_AV, 1)
EndIf

ObjectReference myRecipe = (Alias_Recipe.GetRef())
If myPlayer.GetItemCount(myRecipe) > 0
	myPlayer.RemoveItem(myRecipe)
EndIf

Alias_Rowan.GetRef().Disable()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFParadisoZ03Misc Auto Const Mandatory

ReferenceAlias Property Alias_Recipe Auto Const Mandatory

ReferenceAlias Property Alias_Rowan Auto Const Mandatory

ActorValue Property FFParadisoZ03_Foreknowledge_AV Auto Const Mandatory

Quest Property DialogueParadiso Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFParadisoZ03_BribePrice Auto Const Mandatory
