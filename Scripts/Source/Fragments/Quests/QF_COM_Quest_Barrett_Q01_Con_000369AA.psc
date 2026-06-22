;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_Barrett_Q01_Con_000369AA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor Player = Game.GetPlayer()

Player.AddPerk(Perk00)
Player.AddPerk(Perk01)
Player.AddPerk(Perk02)
Player.AddPerk(Perk03)
Player.AddPerk(Perk04)
Player.AddPerk(Perk05)
Player.AddPerk(Perk06)
Player.AddPerk(Perk07)
Player.AddPerk(Perk08)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, NPCDemandMoney_Large.GetValueInt())
Game.GetPlayer().AddItem(Credits, NPCDemandMoney_Large.GetValueInt())
Game.GetPlayer().AddItem(MedPack, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(125)

Game.GetPlayer().AddItem(Wendy_DataSlate, 1)

Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_NewAtlantis.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Large.GetValueInt())

SetStage(142)
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
SetStage(142)
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0134_Item_00
Function Fragment_Stage_0134_Item_00()
;BEGIN CODE
SetStage(133)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
SetStage(142)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
SetStage(141)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0137_Item_00
Function Fragment_Stage_0137_Item_00()
;BEGIN CODE
Actor Player = Game.GetPlayer()

If Player.GetItemCount(Wendy_DataSlate) >= 1
   Player.RemoveItem(Wendy_DataSlate, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(125)
SetObjectiveDisplayed(150)

SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0141_Item_00
Function Fragment_Stage_0141_Item_00()
;BEGIN CODE
SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0142_Item_00
Function Fragment_Stage_0142_Item_00()
;BEGIN CODE
SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
; Wendy is returning to Gagarin.
If GetStageDone(141) && GetStageDone(138)
   SetStage(148)
ElseIf GetStageDone(141) && !GetStageDone(138)
   SetStage(146)
ElseIf GetStageDone(142) && GetStageDone(138)
   SetStage(149)
Else
   SetStage(147)
EndIf 

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0146_Item_00
Function Fragment_Stage_0146_Item_00()
;BEGIN CODE
SetStage(145)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0147_Item_00
Function Fragment_Stage_0147_Item_00()
;BEGIN CODE
SetStage(145)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(125)
SetObjectiveCompleted(150)
SetStage(144)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
If GetStageDone(140)
   SetStage(175)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_GagarinOffice.GetRef())
(Alias_Wendy.GetRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

ReferenceAlias Property Alias_Wendy Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_Wendy_GagarinOffice Auto Const Mandatory

Book Property Wendy_DataSlate Auto Const Mandatory

Perk Property Perk01 Auto Const Mandatory

Perk Property Perk02 Auto Const Mandatory

Perk Property Perk00 Auto Const Mandatory

Perk Property Perk03 Auto Const Mandatory

Perk Property Perk04 Auto Const Mandatory

Perk Property Perk05 Auto Const Mandatory

Perk Property Perk06 Auto Const Mandatory

Perk Property Perk07 Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_Wendy_NewAtlantis Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Potion Property MedPack Auto Const Mandatory

Perk Property Perk08 Auto Const Mandatory
