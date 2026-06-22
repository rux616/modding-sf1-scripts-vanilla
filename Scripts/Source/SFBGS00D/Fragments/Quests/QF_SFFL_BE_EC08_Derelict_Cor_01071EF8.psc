;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC08_Derelict_Cor_01071EF8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_BE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_BE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_BE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
;Chance to spawn from 1 to 3 pirates inside the ship
int pirateQuantity = Math.Max(Utility.RandomInt(1,6) + Utility.RandomInt(1,6) - 9,0) as int
if (pirateQuantity > 0)
    Debug.Trace("EC08: Spawning " + pirateQuantity + " pirates.")
    Alias_PirateMarkers.AddRefCollection(Alias_CrewSpawnMarkers)
    while (pirateQuantity > 0)
        ObjectReference spawnMarker = Alias_PirateMarkers.GetRandom()
        Actor pirate = spawnMarker.PlaceActorAtMe(LvlCrimsonFleet,Math.Clamp(pirateQuantity - 1,0,3) as int) ;Pirates are spawned in decreasing order of strength
        Alias_Pirates.AddRef(pirate)
        Alias_PirateMarkers.RemoveRef(spawnMarker) ;This is so two pirates don't spawn on the same marker
        pirateQuantity -= 1
    endwhile
endif

;Chance to have Emergency Menu access on Computers
kmyQuest.EmergencyMenu(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_BE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_BE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_BE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TurnOffLights()

Alias_LockableDoors.RefillAlias()

;Make sure Pirates are on Alert (if any)
int icount = Alias_Pirates.GetCount()
while (icount > 0)
    icount -= 1
    Actor pirate = Alias_Pirates.GetActorAt(icount)
    pirate.SetAlert()
    pirate.StartCombat(Game.GetPlayer())
endwhile

SpaceEncounter.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_InteriorLights Auto Const Mandatory

ReferenceAlias Property Alias_ModuleCockpit Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

GlobalVariable Property BE_EC08_NoConnection Auto Const Mandatory

RefCollectionAlias Property Alias_LockableDoors Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

Quest Property SpaceEncounter Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_CockpitDoor Auto Const Mandatory

;Scene Property SFFL_BE_EC08_Derelict_Corpses_200_Alarm Auto Const Mandatory

Keyword Property LocTypeShowSpacesuit Auto Const Mandatory

ActorBase Property LvlCrimsonFleet Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_PirateMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_Pirates Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructAlarm Auto Const Mandatory
