;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCNewAtlantis_00013497 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_ZoeKaminski.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0341_Item_00
Function Fragment_Stage_0341_Item_00()
;BEGIN CODE
RAD03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;when the player reaches the end of this scene we set stage 700 on the DialogueUCFactionNewAtlantis quest
;We only do this if the player has already completed a different stage

if(DialogueUCFactionNewAtlantis.GetStageDone(525) == 1)
DialogueUCFactionNewAtlantis.SetStage(700)
endIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0363_Item_00
Function Fragment_Stage_0363_Item_00()
;BEGIN CODE
SetStage(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0364_Item_00
Function Fragment_Stage_0364_Item_00()
;BEGIN CODE
; Purchase the house.
PlayerHouseSystem.PurchaseHouse(PlayerHouse_NA_WellCost, CityNewAtlantisWellApartmentKey)
Alias_WellApartmentActivator.GetRef().Enable()
UC_NA_Home_Well_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
; Purchase the house (for free)
PlayerHouseSystem.PurchaseHouse(houseKey = CityNewAtlantisPenthouseKey)

DialogueUCFactionNewAtlantis.SetStage(700)
;if we got this off the greeting from Zora, skip her normal greeting as well
if GetStageDone(360)==0
    SetStage(360)
    SetStage(362)
endif
UC_NA_Home_Penthouse_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0366_Item_00
Function Fragment_Stage_0366_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, (PlayerHouse_NA_HomeCost.GetValue()as int))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RAD03 Auto Const Mandatory

ReferenceAlias Property Alias_ZoeKaminski Auto Const Mandatory

Quest Property DialogueUCFactionNewAtlantis Auto Const

ObjectReference Property PlayerHouseDoor Auto Const

ObjectReference Property PenthouseDoor Auto Const

ReferenceAlias Property PlayerPenthouseDoor Auto Const

ReferenceAlias Property Alias_ZoraSangweni Auto Const

GlobalVariable Property PlayerHouse_NA_WellCost Auto Const Mandatory

GlobalVariable Property PlayerHouse_NA_HomeCost Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Key Property CityNewAtlantisWellApartmentKey Auto Const Mandatory

Quest Property UC_NA_Home_Penthouse_Misc Auto Const Mandatory

Quest Property UC_NA_Home_Well_Misc Auto Const Mandatory

Key Property CityNewAtlantisPenthouseKey Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory

ReferenceAlias Property Alias_WellApartmentActivator Auto Const Mandatory
