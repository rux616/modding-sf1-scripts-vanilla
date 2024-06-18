;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_GG_Bet_0018BC55 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Move all the ag goods into the container
int i = 0
int iCount = Alias_AgGoods.GetCount()
ObjectReference PlayINV = Game.GetPlayer()

while i < iCount
  ObjectReference currGood = Alias_AgGoods.GetAt(i)

  if currGood != none
    PlayINV.AddItem(currGood)
  endif

  i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(200)
Game.GetPlayer().MoveTo(UC_GG_Bet_DebugMarker01)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
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

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor, 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_AgGoods Auto Const Mandatory

ReferenceAlias Property Alias_ShipContainer Auto Const Mandatory

ReferenceAlias Property Alias_DebugMarker Auto Const Mandatory

ObjectReference Property UC_GG_Bet_DebugMarker01 Auto Const Mandatory

MiscObject Property UC_GG_Bet_Liquor Auto Const Mandatory

GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const Mandatory
