;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R03_0203D1A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_AttackersRC.RefillAlias()
Alias_DefendersRC.RefillAlias()

;choose scenario - 1=passenger 2=betrayal
;civilians can either try to attack you and steal your ship or will be friendly
ScenarioGlobal.SetValue(Utility.RandomInt(1,2))

;choose secondary scenario to spawn a corpse or not, 1 = corpse 2 = none
ScenarioGlobal01.SetValue(Utility.RandomInt(1,2))


;set personality of ship captain (this opens up different dialogue 
;for the captain to keep things fresh on subsequent playthroughs)
CaptainPersonalityGlobal.SetValue(Utility.RandomInt(1,2))

;handle objectives
SetObjectiveDisplayed(10)

;make the hailing ship your friend so it ignores friendly hits
;Alias_DefendersRC.AddToFaction(PPlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_HailingShip.RefillAlias()
Attack01_100a_DefenderHailStart.Start()

SEtObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Alias_DefendersRC.RemoveFromAllFactions()
;Alias_DefendersRC.AddToFaction(PPlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(175)

;shut off engines
Alias_HailingShip.GetShipRef().SetPartPower(1, -1, 0)
Alias_HailingShip.GetShipRef().LockPowerAllocation(1,-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;set combat stage
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Start combat with captain and crew
Actor Captain = Alias_Captain.GetActorRef()
Captain.EvaluatePackage()
Captain.AddToFaction(PlayerEnemyFaction)
Captain.StartCombat(Game.GetPlayer())

Actor CommsOfficer = Alias_CommsOfficer.GetActorRef()
CommsOfficer.EvaluatePackage()
CommsOfficer.AddToFaction(PlayerEnemyFaction)
CommsOfficer.StartCombat(Game.GetPlayer())

Alias_Crew.AddToFaction(PlayerEnemyFaction)
Alias_Crew.StartCombatAll(Game.GetPlayer())

;handle objectives
setobjectiveCompleted(175)
SetObjectiveDisplayed(200)

;set hailingship crew to 0 and try to make it not react when shot
SpaceshipReference myShip = Alias_HailingShip.GetShipRef()
myShip.SetValue(SpaceShipCrew, 0)
myShip.SetEssential(false)
myShip.RemoveFromAllFactions()
Actor myShipAI = myShip.GetSpaceshipAutopilotAI()
myShipAI.RemoveFromAllFactions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
;Start combat with captain and crew
Actor Captain = Alias_Captain.GetActorRef()
Captain.EvaluatePackage()
Captain.AddToFaction(PlayerEnemyFaction)
Captain.StartCombat(Game.GetPlayer())

Actor CommsOfficer = Alias_CommsOfficer.GetActorRef()
CommsOfficer.EvaluatePackage()
CommsOfficer.AddToFaction(PlayerEnemyFaction)
CommsOfficer.StartCombat(Game.GetPlayer())

Alias_Crew.AddToFaction(PlayerEnemyFaction)
Alias_Crew.StartCombatAll(Game.GetPlayer())

;handle objectives
setobjectiveFailed(175)

;set stage 250 so quest will shut down
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)

SFFL_R03_BoardingEncounter.SetStage(30)

;set hailingship crew to 0 and try to make it not react when shot
SpaceshipReference myShip = Alias_HailingShip.GetShipRef()
myShip.SetValue(SpaceShipCrew, 0)
myShip.SetEssential(false)
myShip.RemoveFromAllFactions()
Actor myShipAI = myShip.GetSpaceshipAutopilotAI()
myShipAI.RemoveFromAllFactions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_01
Function Fragment_Stage_0250_Item_01()
;BEGIN CODE
;set hailingship crew to 0 and try to make it not react when shot
SpaceshipReference myShip = Alias_HailingShip.GetShipRef()
myShip.SetValue(SpaceShipCrew, 0)
myShip.SetEssential(false)
myShip.RemoveFromAllFactions()
Actor myShipAI = myShip.GetSpaceshipAutopilotAI()
myShipAI.RemoveFromAllFactions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(175)
SetObjectiveDisplayed(300)

;Make it so the player can't kill the passengers.
;add passengers to friendly faction and make them ignore friendly hits 
;and essential

kmyquest.AddPassengers(Alias_AllCrew)
Alias_AllCrew.EvaluateAll()
Alias_AllCrew.SetEssential()
Alias_AllCrew.AddToFaction(CivilianShipFaction)
Int i
Int iCount = Alias_AllCrew.GetCount()
While i < iCount
	ObjectReference myCrew = Alias_AllCrew.GetAt(i)
	myCrew.IgnoreFriendlyHits()
	i += 1
EndWhile




;set hailingship crew to 0 and try to make it not react when shot
SpaceshipReference myShip = Alias_HailingShip.GetShipRef()
myShip.SetValue(SpaceShipCrew, 0)
myShip.SetEssential(false)
myShip.RemoveFromAllFactions()
Actor myShipAI = myShip.GetSpaceshipAutopilotAI()
myShipAI.RemoveFromAllFactions()

;start up passenger handler quest
PassengerHandlerQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
PassengerHandlerQuest.SetStage(10)

Alias_Crew.DisableAll(true)

Alias_Captain.GetActorRef().EvaluatePackage()
Alias_CommsOfficer.GetActorRef().EvaluatePackage()
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;handle objectives
SetObjectiveCompleted(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
;handle objectives
setobjectivecompleted(250)

;Will wait to stop when player leaves planet/system
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE SEScript
Quest __temp = self as Quest
SEScript kmyQuest = __temp as SEScript
;END AUTOCAST
;BEGIN CODE
Alias_HailingShip.GetShipRef().Disable()

kmyquest.SetCooldown()

SFFL_R03_BoardingEncounter.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property Attack01_100a_DefenderHailStart Auto Const Mandatory

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_AttackersRC Auto Const Mandatory

RefCollectionAlias Property Alias_DefendersRC Auto Const Mandatory

LeveledItem Property LL_Loot_ShipRepairKit Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Message Property SE_ShipPartsAdded Auto Const Mandatory

GlobalVariable Property ScenarioGlobal Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Crew Auto Const Mandatory

Location Property CityNeonLocation Auto Const Mandatory

LocationAlias Property Alias_PassengerDestination Auto Const Mandatory

GlobalVariable Property CaptainPersonalityGlobal Auto Const Mandatory

Quest Property SFFL_R03_BoardingEncounter Auto Const Mandatory

GlobalVariable Property ScenarioGlobal01 Auto Const Mandatory

ReferenceAlias Property Alias_CommsOfficer Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

Faction Property CivilianShipFaction Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Quest Property PassengerHandlerQuest Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory
