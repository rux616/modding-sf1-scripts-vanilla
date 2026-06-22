;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TraitStarterHome_000A47B8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference mapMarkerRef = Alias_MapMarker.GetRef()
ObjectReference mapMarkerRenameRef = Alias_MapMarkerRename.GetRef()
; link map marker to rename ref to get player name
mapMarkerRef.SetLinkedRef(mapMarkerRenameRef, MapMarkerLinkedRefNameOverride)

ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()

int i = 0

While i < DoorRef.Length
    DoorRef[i].BlockActivation(true, false)
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
SetObjectiveDisplayedAtTop(100)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Player has entered their Dream Home
SetObjectiveCompleted(100)
Alias_HomeMarker.GetRef().DisableNoWait()

;Complete quest if Landry paid off
if GetStageDone(400)
    SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500, FALSE)

; Purchase the house.
PlayerHouseSystem.PurchaseHouse(Trait_StarterHome_Mortgage)

; Complete quest if Dream Home visited
if GetStageDone(150)
    SetStage(1000)
endif

ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()

int i = 0

While i < DoorRef.Length
    DoorRef[i].BlockActivation(false, false)
    DoorRef[i].Unlock()
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
if !GetStageDone(150)
    SetObjectiveDisplayed(100, FALSE)
endif
SetObjectiveDisplayed(400, FALSE)

; Remove the trait and end the house
Game.GetPlayer().RemovePerk(TRAIT_StarterHome)

ObjectReference[] DoorRef = Alias_HomeDoors.GetArray()

int i = 0

While i < DoorRef.Length
    DoorRef[i].BlockActivation(false, false)
    DoorRef[i].SetLockLevel(254)
    DoorRef[i].Lock()
    i += 1
endWhile

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TraitStarterHome_Pointer Auto Const Mandatory

Perk Property TRAIT_StarterHome Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_MapMarkerRename Auto Const Mandatory

Keyword Property MapMarkerLinkedRefNameOverride Auto Const Mandatory

GlobalVariable Property Trait_StarterHome_Mortgage Auto Const Mandatory

ReferenceAlias Property Alias_HomeMarker Auto Const Mandatory

RefCollectionAlias Property Alias_HomeDoors Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory
