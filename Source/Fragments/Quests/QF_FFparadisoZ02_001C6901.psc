;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFparadisoZ02_001C6901 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_RoomKey.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Thermos.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_WeddingRing.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Slate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()

SetObjectiveDisplayed(200)
SetObjectiveDisplayed(300)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(500)

If myPlayer.GetItemCount(FFParadisoZ02_RoomKey) >= 1
	SetStage(200)
EndIf
If myPlayer.GetItemCount(FFParadisoZ02_Thermos) >= 1
	SetStage(300)
EndIf
If myPlayer.GetItemCount(FFParadisoZ02_WeddingRing) >= 1
	SetStage(400)
EndIf
If myPlayer.GetItemCount(FFParadisoZ02_Slate) >= 1
	SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
If GetStageDone(300) && GetStageDone(400) && GetStageDone(500)
	SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
If GetStageDone(200) && GetStageDone(400) && GetStageDone(500)
	SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
If GetStageDone(200) && GetStageDone(300) && GetStageDone(500)
	SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
If GetStageDone(200) && GetStageDone(300) && GetStageDone(400)
	SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
FFParadisoZ02Misc.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()

myPlayer.SetValue(FFParadisoZ02_Foreknowledge_AV, 1)

myPlayer.RemoveItem(Alias_Slate.GetRef())
myPlayer.RemoveItem(Alias_RoomKey.GetRef())
myPlayer.RemoveItem(Alias_Thermos.GetRef())
myPlayer.RemoveItem(Alias_WeddingRing.GetRef())

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property FFParadisoZ02_RoomKey Auto Const Mandatory

MiscObject Property FFParadisoZ02_Thermos Auto Const Mandatory

MiscObject Property FFParadisoZ02_WeddingRing Auto Const Mandatory

MiscObject Property FFParadisoZ02_Slate Auto Const Mandatory

Quest Property FFParadisoZ02Misc Auto Const Mandatory

ReferenceAlias Property Alias_RoomKey Auto Const Mandatory

ReferenceAlias Property Alias_Thermos Auto Const Mandatory

ReferenceAlias Property Alias_WeddingRing Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

ActorValue Property FFParadisoZ02_Foreknowledge_AV Auto Const Mandatory
