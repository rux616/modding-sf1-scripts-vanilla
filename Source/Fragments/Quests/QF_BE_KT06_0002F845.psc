;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT06_0002F845 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
BE_KT06_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
BE_KT06_MetOnceGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_AllCrew.AddRef(Alias_Comms.GetRef())
Alias_AllCrew.AddRef(Alias_Captain.GetRef())

Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()

Alias_PilotSeat.GetRef().BlockActivation(True, True)
myCell.SetPublic()
BE_KT06_Scene00.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Complete SE objective, add to refcoll and display new objective

SE_KT06.SetStage(30)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
BE_KT06_OneDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
BE_KT06_OneDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
enemyshipRef.SetValue(DockingPermission, 4)
Utility.Wait(6)
enemyShipRef.DisableWithGravJump()

BE_KT06_MetOnceGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
ObjectReference PilotSeat = Alias_PilotSeat.GetRef()

PilotSeat.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Comms.GetActorRef().EvaluatePackage()
Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
Alias_AllCrew.SetValue(Aggression, 1)
Alias_AllCrew.StartCombatAll(Game.GetPlayer())
SetObjectiveSkipped(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Comms Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

Scene Property BE_KT06_Scene01 Auto Const Mandatory

GlobalVariable Property BE_KT06_MetOnceGlobal Auto Const Mandatory

Quest Property SE_KT06 Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

GlobalVariable Property BE_KT06_OneDead Auto Const Mandatory

Scene Property BE_KT06_Scene00 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
