;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_RI03_0024015E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
RI03.SetStage(600)

Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()

myCell.SetPublic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetCrewPlayerFriend(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef()
Cell myCell = PilotSeatRef.GetParentCell()
PilotSeatRef.BlockActivation(False, False)
myCell.SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_GenericTurrets.SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property RI03 Auto Const Mandatory

RefCollectionAlias Property Alias_GenericTurrets Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory
