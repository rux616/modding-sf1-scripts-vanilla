;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT03_000277A3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SE_KT03.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SE_KT03.SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Faction myFaction = Alias_EnemyShip.GetShipRef().GetCrimeFaction()

int i = 0
Actor[] robotCrew = Alias_AllCrew.GetActorArray()
while i < robotCrew.Length
    robotCrew[i].SetCrimeFaction(myFaction)
    i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()

myCell.SetPublic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SE_KT03.SetStage(30)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_03
Function Fragment_Stage_0020_Item_03()
;BEGIN CODE
SetObjectiveCompleted(10)
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_GenericCrew.RemoveFromFaction(REPlayerFriend)
Alias_GenericCrew.AddtoFaction(PlayerEnemyFaction)
Alias_GenericCrew.SetValue(Aggression, 1)
Alias_GenericCrew.StartCombatAll(Game.GetPlayer())
SE_KT03.SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
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

Float Property GravityFloat Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property SE_KT03 Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

ReferenceAlias Property Alias_FirstMate Auto Const Mandatory
