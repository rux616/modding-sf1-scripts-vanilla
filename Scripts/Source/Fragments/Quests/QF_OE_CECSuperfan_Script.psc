;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_CECSuperfan_Script Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef()
ObjectReference WoundedFurniture = Alias_Furniture_Wounded_Interior.GetRef()

; Move the Wounded Furniture to the Ship Interior
WoundedFurniture.MoveTo(InteriorMarker)

; This does not use the Ship Interior Marker.
Alias_Superfan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; flag as "player has encountered"
OE_AustinF_CECSuperfanDone.SetValueInt(1)

ObjectReference FurnitureREF = Alias_Furniture_Wounded_Interior.GetRef()
ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef()

If GetStageDone(50)
   Alias_Superfan.GetActorRef().EvaluatePackage()
   
   ;Move after ship loads
   If FurnitureREF != NONE && InteriorMarker != NONE
      FurnitureREF.MoveTo(InteriorMarker)
   EndIf 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_Superfan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Alias_Superfan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Alias_Superfan.GetActorRef().EvaluatePackage()

If GetStageDone(200)
   SetStage(400)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Superfan.GetActorRef().EvaluatePackage()
Alias_Superfan.GetActorRef().AddToFaction(OE_AustinF_CECSuperfan_EnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor Superfan = Alias_Superfan.GetActorRef()
ObjectReference Marker = Alias_Furniture_Wounded.GetRef()

Superfan.SetValue(Game.GetAggressionAV(), 0)
Superfan.StopCombat()
Marker.MoveTo(Superfan)
Marker.Enable()
Superfan.EvaluatePackage()

Superfan.RemoveFromFaction(PlayerEnemyFaction)
Scene_PlayerWins.Start()

; Try again
If Superfan.IsInCombat()
   Superfan.StopCombat()   
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Actor Superfan = Alias_Superfan.GetActorRef()
ObjectReference Marker = Alias_Furniture_Wounded.GetRef()

; Try again
Superfan.SetValue(Game.GetAggressionAV(), 0)
If Superfan.IsInCombat()
   Superfan.StopCombat()   
EndIf 

; If the player used weapons or they killed the NPC
If GetStageDone(110) || GetStageDone(170)
   SetStage(999)
Else
   SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor Superfan = Alias_Superfan.GetActorRef()

Scene_PlayerLoses.Start()
Superfan.RemoveFromFaction(PlayerEnemyFaction)
Superfan.SetValue(Game.GetAggressionAV(), 0)
Superfan.EvaluatePackage()
Superfan.StopCombat()

Utility.Wait(3) 

If Superfan.IsInCombat()
   Superfan.StopCombat()
   Superfan.EvaluatePackage()
EndIf 

; Player lost
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
Actor Superfan = Alias_Superfan.GetActorRef()
GlobalVariable newLockLevel = NONE 

; Ship should be unlocked
If GetStageDone(500)
   ; Player won the fight, open the doors
   kmyQuest.ToggleShipDoors(newLockLevel)
Else 
   kmyQuest.ToggleShipDoors(gLockLevel)
EndIf 

Superfan.StopCombat()
Superfan.RemoveFromFaction(PlayerEnemyFaction)
Superfan.EvaluatePackage()

; Try again
Superfan.SetValue(Game.GetAggressionAV(), 0)
If Superfan.IsInCombat()
   Superfan.StopCombat()   
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerEnemyFaction Auto Const

ReferenceAlias Property Alias_Superfan Auto Const Mandatory

Scene Property Scene_PlayerWins Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_Wounded Auto Const Mandatory

Scene Property Scene_PlayerLoses Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker Auto Const Mandatory

ReferenceAlias Property Alias_Furniture_Wounded_Interior Auto Const Mandatory

GlobalVariable Property gLockLevel Auto Const Mandatory

Scene Property Scene_Cheater Auto Const Mandatory

Faction Property OE_AustinF_CECSuperfan_EnemyFaction Auto Const

GlobalVariable Property OE_AustinF_CECSuperfanDone Auto Const Mandatory
