;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC01_02040704 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Enable Gloria and set Gravity to 0 inside the ship
Actor Gloria = Alias_Gloria.GetActorRef() as Actor
Gloria.Enable()
Gloria.GetParentCell().SetGravityScale(0.0)

;Add ShowSpacesuit keyword to Location
Location enemyShipInterior = Alias_EnemyShipInteriorLocation.GetLocation()
enemyShipInterior.AddKeyword(LocTypeShowSpacesuit)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Utility.Wait(2.5)
Gloria_Warning_1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Gloria_Warning_2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Gloria_Warning_Door.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
ObjectReference centralModuleDoor = Alias_CentralModuleDoor.GetRef()
centralModuleDoor.SetLinkedRef(Alias_GloriaComputer.GetRef(),LinkTerminalDoor)
centralModuleDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Gloria_Warning_3.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Gloria_MiscWarning.Stop()
Gloria_Warning_3.Stop()
Alias_Player.GetRef().GetParentCell().SetGravityScale(1.0)
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Alias_Gloria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Gloria.GetActorRef().EvaluatePackage()
Gloria_Dialogue_Stage500.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_Gloria_Hiding_Spot.GetRef().DisableLinkChain()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetStage(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
Alias_Gloria.GetActorRef().EvaluatePackage()

SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(250)
SpaceEncounter.SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE defaultfollowertogglequestscript
Quest __temp = self as Quest
defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript
;END AUTOCAST
;BEGIN CODE
;kmyquest.CheckConditions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Gloria Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_GloriaSpawn Auto Const Mandatory

ReferenceAlias Property Alias_Gloria_Hiding_Spot Auto Const Mandatory

Scene Property Gloria_Dialogue_Stage500 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

Scene Property Gloria_Warning_1 Auto Const Mandatory

Scene Property Gloria_Warning_2 Auto Const Mandatory

Scene Property Gloria_Warning_3 Auto Const Mandatory

Scene Property Gloria_Warning_Door Auto Const Mandatory

Scene Property Gloria_MiscWarning Auto Const Mandatory

Quest Property SpaceEncounter Auto Const Mandatory

ReferenceAlias Property Alias_GloriaComputer Auto Const Mandatory

TerminalMenu Property GloriaTerminalMenu Auto Const Mandatory

ReferenceAlias Property Alias_CentralModuleDoor Auto Const Mandatory

Keyword Property LinkTerminalDoor Auto Const Mandatory

Keyword Property LocTypeShowSpacesuit Auto Const Mandatory
