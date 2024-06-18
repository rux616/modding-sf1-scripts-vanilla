;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_ZW15_0005EAEF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
; Spin up the space cell
SE_ZW15_SpaceCell.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PSE_ZW0801_HailingScene.Start()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Alias_TheBrute.GetShipRef().RemoveFromFaction(PPlayerFriendFaction)
;Alias_Guardship01.GetShipRef().RemoveFromFaction(PPlayerFriendFaction)
;Alias_Guardship02.GetShipRef().RemoveFromFaction(PPlayerFriendFaction)
;Alias_Guardship03.GetShipRef().RemoveFromFaction(PPlayerFriendFaction)

;Alias_Guardship01.GetShipRef().StartCombat(Alias_playerShip.GetShipRef())
;Alias_Guardship02.GetShipRef().StartCombat(Alias_playerShip.GetShipRef())
;Alias_Guardship03.GetShipRef().StartCombat(Alias_playerShip.GetShipRef())
;Alias_TheBrute.GetShipRef().StartCombat(Alias_playerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SE_ZW15_DoneOnceGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
Alias_TheBrute.GetShipRef().DamageValue( SpaceshipEngineHealth, 100000)
Alias_Guardship01.GetShipRef().kill()
Alias_Guardship02.GetShipRef().kill()
Alias_Guardship03.GetShipRef().kill()

Alias_playership.GetShipRef().InstantDock(Alias_TheBrute.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1002_Item_00
Function Fragment_Stage_1002_Item_00()
;BEGIN CODE
Alias_TheBrute.GetShipRef().DamageValue( SpaceshipEngineHealth, 100000)
Alias_Guardship01.GetShipRef().kill()
Alias_Guardship02.GetShipRef().kill()
Alias_Guardship03.GetShipRef().kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory


Scene Property PSE_ZW0801_HailingScene Auto Const Mandatory

ReferenceAlias Property Alias_TheBrute Auto Const Mandatory

Faction Property PPlayerFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip01 Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip02 Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip03 Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ActorValue Property SpaceshipEngineHealth Auto Const Mandatory

Quest Property SE_ZW15_SpaceCell Auto Const Mandatory

GlobalVariable Property SE_ZW15_DoneOnceGlobal Auto Const Mandatory
