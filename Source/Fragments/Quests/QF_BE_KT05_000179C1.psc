;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT05_000179C1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BE_KT05_SSNNQuiz.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BE_KT05_SSNNQuiz.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
BE_KT05_SSNNQuiz.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
BE_KT05_SSNNQuiz.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
BE_KT05_SSNNQuiz.SetValue(0)
Actor CaptainRef = Alias_Captain.GetActorRef()

Alias_Clipboard.GetRef().SetFactionOwner(BEKT05_CaptainFaction)
Alias_AllCrew.AddRef(Alias_Comms.GetRef())
Alias_AllCrew.AddRef(CaptainRef)
CaptainRef.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin)
CaptainRef.SetCrimeFaction(CrimeFactionUC)
Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()

myCell.SetPublic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SE_KT05.SetStage(30)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
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
Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
Alias_AllCrew.SetValue(Aggression, 1)
Alias_AllCrew.StartCombatAll(Game.GetPlayer())
SetObjectiveSkipped(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
enemyshipRef.SetValue(SpaceshipCrew, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_04
Function Fragment_Stage_0100_Item_04()
;BEGIN CODE
Utility.Wait(1)
BE_KT05_DialogueCaptain_Scene.Stop()
BE_KT05_DialogueCaptain_SceneBusy.Start()
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

GlobalVariable Property BE_KT05_SSNNQuiz Auto Const Mandatory

ReferenceAlias Property Alias_Comms Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

Quest Property SE_KT05 Auto Const Mandatory

Scene Property BE_KT05_DialogueCaptain_SceneBusy Auto Const Mandatory

Scene Property BE_KT05_DialogueCaptain_Scene Auto Const Mandatory

Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_Clipboard Auto Const Mandatory

Faction Property BEKT05_CaptainFaction Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory
