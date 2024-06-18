;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC115_0022F263 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_SeokguhActorsTrespass3rdFloor.AddRefCollection(Alias_SeokguhActorsTrespassAll)
Alias_SeokguhActorsTrespassAll.RemoveAll()
Alias_SeokguhActorsTrespass3rdFloor.EvaluateAll()
Alias_ArmoryDoor.getref().unlock()
Alias_ArmoryDoor.getref().setopen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ArmoryDoor Auto Const Mandatory

Faction Property LC115SeokguhCrimeFaction Auto Const

Faction Property LC115SeokguhNeutralFaction Auto Const

Faction Property LC115SeokguhTrespassFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

RefCollectionAlias Property Alias_SeokguhActorsTrespassAll Auto Const Mandatory

RefCollectionAlias Property Alias_SeokguhActorsTrespass3rdFloor Auto Const Mandatory
