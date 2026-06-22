;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R01_020296F5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
SFFL_R01_HAIL.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;handle ship aggro if you attack it
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()
ShipRef.AddtoFaction(PlayerEnemyFaction)
ShipRef.SetValue(Aggression, 1)
ShipRef.StartCombat(Alias_PlayerShip.GetShipRef())
Setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.SetGhost(true)
Utility.wait(3)
oTarg.DisableWithGravJump()
Alias_MapMarker.GetRef().DisableNoWait()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(401)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

If getstagedone(425)== TRUE && getstagedone (450) == TRUE
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(401)

If getstagedone(425)== TRUE && getstagedone (450) == TRUE
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
SetObjectiveDisplayed(501)

;enable the trade authority dead drop container
Alias_TradeAuthorityDeadDrop.GetRef().Enable()

;clear alias for contraband cache to remove quest object flag
Alias_Contraband01.Clear()
Alias_Contraband02.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
if getstagedone(525) == TRUE && getstagedone(550) == TRUE
  setstage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
if getstagedone(525) == TRUE && getstagedone(550) == TRUE
  setstage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;You delivered items to the smuggler - remove items from inventory/cargo hold
Game.GetPlayer().RemoveItem(Alias_Contraband01NotQuestObject.GetRef())
Game.GetPlayer().RemoveItem(Alias_Contraband02NotQuestObject.GetRef())
Alias_PlayerShip.GetShipRef().RemoveItem(Alias_Contraband01NotQuestObject.GetRef())
Alias_Playership.GetShipRef().RemoveItem(Alias_Contraband02NotQuestObject.GetRef())

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;remove contraband 
Game.GetPlayer().RemoveItem(Alias_Contraband01NotQuestObject.GetRef())
Game.GetPlayer().RemoveItem(Alias_Contraband02NotQuestObject.GetRef())
Alias_PlayerShip.GetShipRef().RemoveItem(Alias_Contraband01NotQuestObject.GetRef())
Alias_Playership.GetShipRef().RemoveItem(Alias_Contraband02NotQuestObject.GetRef())

;start rare dungeon reward quest - chance you will be pointed to a dungeon
;if you have done multiple runs of this quest before
R01_DungeonReward.Start()

;end quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetStage(300)

;mod playthrough count global
PlaythroughCount.Mod(1)

;start the cooldown timer
SFFL_R01_Timestamp.SetValue(GameDaysPassed.GetValue()+2)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if getstagedone(600) == TRUE
  SetObjectiveCompleted(501)
  SetObjectiveDisplayed(500,0)
elseif getstagedone(700) == TRUE
  SetObjectiveCompleted(500)
  SetObjectiveDisplayed(501,0)
  Alias_Contraband01NotQuestObject.GetRef().Disable()
  Alias_Contraband02NotQuestObject.GetRef().Disable()
endif

SetStage(300)

;mod playthrough count global
PlaythroughCount.Mod(1)

;start the cooldown timer
SFFL_R01_Timestamp.SetValue(GameDaysPassed.GetValue()+1)

;disable the smuggler ship
Alias_HailingShip.GetShipRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFFL_R01_HailingStart01 Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory


ReferenceAlias Property Alias_Contraband01 Auto Const Mandatory

ReferenceAlias Property Alias_Contraband02 Auto Const Mandatory

ReferenceAlias Property Alias_TradeAuthorityDeadDrop Auto Const Mandatory

GlobalVariable Property PlaythroughCount Auto Const Mandatory

Quest Property R01_DungeonReward Auto Const Mandatory

Scene Property SFFL_R01_HailingStart02 Auto Const Mandatory

Scene Property SFFL_R01_HAIL Auto Const Mandatory

ReferenceAlias Property Alias_Container01 Auto Const Mandatory

ReferenceAlias Property Alias_Container02 Auto Const Mandatory

ReferenceAlias Property Alias_Contraband01NotQuestObject Auto Const Mandatory

ReferenceAlias Property Alias_Contraband02NotQuestObject Auto Const Mandatory

GlobalVariable Property SFFL_R01_Timestamp Auto Const Mandatory

GlobalVariable Property GameDaysPassed Auto Const Mandatory

MiscObject Property ContrabandCache Auto Const Mandatory
