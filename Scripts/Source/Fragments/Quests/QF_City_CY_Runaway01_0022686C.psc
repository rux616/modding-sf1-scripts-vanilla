;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_CY_Runaway01_0022686C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Minerva.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(100)
SetStage(105)
SetStage(110)
SetStage(190)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Natan.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Rivkah.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Sets a stage on DialogueCydonia to track if the player asked
;Rivkah for a hint in dealing with her father.
DialogueCydonia.SetStage(1301)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Alias_GovWhiskey.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.AddItem(Alias_Whiskey.GetRef())
myPlayer.RemoveItem(Credits, City_CY_Runaway01_WhiskeyPriceNormal.GetValue() as Int)
SetStage(200)
City_CY_Runaway01_0190_Companion_Whiskey.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.AddItem(Alias_Whiskey.GetRef())
myPlayer.RemoveItem(Credits, City_CY_Runaway01_WhiskeyPriceReduced.GetValue() as Int)
SetStage(200)
City_CY_Runaway01_0190_Companion_Whiskey.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
If !IsObjectiveCompleted(110) && IsObjectiveDisplayed(110)
	SetObjectiveCompleted(110)
EndIf
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

;Enable Natan and make his hotel room door accessible
Alias_Natan.GetRef().Enable()
ObjectReference myDoor = Alias_NatanDoor.GetRef()
myDoor.SetDoorInaccessible(False)
myDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Actor myNatan = Alias_Natan.GetActorRef()
myNatan.EvaluatePackage()
Utility.Wait(3)
myNatan.Say(City_CY_Runaway01_0415_Natan_ApproachTopic)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(1)
Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_NatanPeacefulAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0441_Item_00
Function Fragment_Stage_0441_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0442_Item_00
Function Fragment_Stage_0442_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0443_Item_00
Function Fragment_Stage_0443_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0444_Item_00
Function Fragment_Stage_0444_Item_00()
;BEGIN CODE
;Set the value: The player did not give up Rivkah, 
;but also failed to patch things up with Natan
City_CY_Runaway01_Ending.SetValue(6)

;Spawn Security guards in the hotel lobby.
Alias_Guard01.GetRef().Enable()
Alias_Guard02.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(450)

;Spawn Security guards in the hotel lobby.
Alias_Guard01.GetRef().Enable()
Alias_Guard02.GetRef().Enable()

;Natan attacks the player.
Alias_Natan.GetActorRef().StartCombat(Game.GetPlayer() as Objectreference, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(5)
SetObjectiveCompleted(450)
SetStage(500)
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

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
If GetStageDone(443)
	Alias_Rivkah.GetRef().Disable()
	SetStage(700)
Else
	SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
City_CY_Runaway01_Ending.SetValue(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500, False)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(500)
	SetObjectiveCompleted(500)
EndIf
If IsObjectiveDisplayed(700)
	SetObjectiveCompleted(700)
EndIf

Alias_Natan.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property City_CY_Runaway01_Whiskey Auto Const Mandatory

GlobalVariable Property City_CY_Runaway01_WhiskeyPriceNormal Auto Const Mandatory

GlobalVariable Property City_CY_Runaway01_WhiskeyPriceReduced Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Whiskey Auto Const Mandatory

GlobalVariable Property City_CY_Runaway01_Ending Auto Const Mandatory

ReferenceAlias Property Alias_Rivkah Auto Const Mandatory

ReferenceAlias Property Alias_Jack Auto Const Mandatory

ReferenceAlias Property Alias_Minerva Auto Const Mandatory

ReferenceAlias Property Alias_Natan Auto Const Mandatory

ReferenceAlias Property Alias_Guard01 Auto Const Mandatory

ReferenceAlias Property Alias_Guard02 Auto Const Mandatory

Topic Property City_CY_Runaway01_0415_Natan_ApproachTopic Auto Const Mandatory

Quest Property DialogueCydonia Auto Const Mandatory

Scene Property City_CY_Runaway01_0190_Companion_Whiskey Auto Const Mandatory

ActorValue Property City_CY_Runaway01_Foreknowledge_NatanPeacefulAV Auto Const Mandatory

ReferenceAlias Property Alias_GovWhiskey Auto Const Mandatory

ReferenceAlias Property Alias_NatanDoor Auto Const Mandatory
