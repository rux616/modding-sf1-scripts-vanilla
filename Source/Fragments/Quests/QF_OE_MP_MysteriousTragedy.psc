;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_MysteriousTragedy Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
int PlayerLevel = Game.GetPlayer().GetLevel()
int EncounterPoints = Utility.RandomInt(1,10)

If PlayerLevel  > 200
   EncounterPoints += 10
ElseIf PlayerLevel > 100 
   EncounterPoints += 5
ElseIf PlayerLevel > 75
   EncounterPoints += 4
ElseIf PlayerLevel > 50
   EncounterPoints += 3
ElseIf PlayerLevel > 25
   EncounterPoints += 2
ElseIf PlayerLevel > 15
   EncounterPoints += 1
EndIf

If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
   EncounterPoints += 4
EndIf

If Game.GetPlayer().HasPerk(BackgroundExplorer)
   EncounterPoints += 2
EndIf

; Check for Living Enemies
If EncounterPoints > Utility.RandomInt(1,10)
   SetStage(20)
   EncounterPoints -= 5
Else 
   Alias_Enemy.TryToDisable()
   Alias_Enemies.DisableAll()
   EncounterPoints += 2
EndIf 

; Check for Enemy Corpses
If EncounterPoints > Utility.RandomInt(1,10)
   SetStage(30)
   EncounterPoints -= 1
Else
   Alias_EnemyCorpse00.TryToDisable()
   Alias_EnemyCorpse01.TryToDisable()
   EncounterPoints += 1
EndIf 

; Add creature corpses
If EncounterPoints > Utility.RandomInt(1,10)
   SetStage(50)
   EncounterPoints -= 2
EndIf 

If EncounterPoints > Utility.RandomInt(1,10)
   SetStage(60)
   EncounterPoints -= 1
EndIf 

If EncounterPoints > Utility.RandomInt(1,10)
   SetStage(70)
   EncounterPoints -= 3
EndIf

; If too much has happened, launch the ship, add reward to container
If EncounterPoints < 3
   SetStage(150)
   SetStage(80)
Else ; Spawn Critters
   SetStage(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Enemy.TryToEnable()
Alias_Enemies.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
If !GetStageDone(10)
   SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_ApexPredator_Corpse.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
int numToSpawn = Utility.RandomInt(1,4)

Alias_Predator_Corpse00.TryToEnable()

If numToSpawn > 1
   Alias_Predator_Corpse01.TryToEnable()
EndIf 

If numToSpawn > 2
   Alias_Predator_Corpse02.TryToEnable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Alias_RewardContainer.TryToEnable()
Alias_RewardContainer.GetRef().AddItem(LL_OE_AlternativeReward)
Alias_RewardContainer.GetRef().Lock(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If !GetStageDone(10)
   SetStage(10)
EndIf

; If Enemies are present, launch the ship
If GetStageDone(40)
   If Utility.RandomInt(1,2) == 1
      SetStage(150)
   EndIf 
EndIf 

If GetStageDone(20)
   SetStage(110)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Move note to the Enemy's inventory
Alias_Enemy.GetActorRef().AddItem(Alias_Note.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
If GetStageDone(100)
   SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LaunchShip(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
bool apexAllowed = ( Alias_ApexPredator.GetRef() != NONE )
bool predatorsAllowed = ( Alias_Predator.GetRef() != NONE )
bool terrormorphAllowed = Alias_Trigger.GetRef().GetCurrentPlanet().HasKeyword(PCM_TerrormorphEncountersAllowed)
int EncounterPoints = Utility.RandomInt(1,10)
int PlayerLevel = Game.GetPlayer().GetLevel()

If PlayerLevel > 200
   EncounterPoints += 10 
ElseIf PlayerLevel  > 100
   EncounterPoints += 5
ElseIf PlayerLevel > 75
   EncounterPoints += 4
ElseIf PlayerLevel > 50
   EncounterPoints += 3
ElseIf PlayerLevel > 25
   EncounterPoints += 2
ElseIf PlayerLevel > 15
   EncounterPoints += 1
EndIf

If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
   EncounterPoints += 4
EndIf

If Game.GetPlayer().HasPerk(BackgroundExplorer)
   EncounterPoints += 2
EndIf

If PlayerLevel < 25
   If GetStageDone(20)
      EncounterPoints -= 3
   EndIf 

   If GetStageDone(30) 
      EncounterPoints -= 2
   EndIf

   If GetStageDone(50) || GetStageDone(60) || GetStageDone(70)
      EncounterPoints -= 1
   EndIf
Else
   If GetStageDone(20)
      EncounterPoints -= 2
   EndIf
EndIf

; Check for Terrormorphs
If terrormorphAllowed 
   If EncounterPoints > Utility.RandomInt(1,10)
      SetStage(310)
      EncounterPoints -= 5
   EndIf
EndIf 

; Roll for Predators
If apexAllowed
   If EncounterPoints > Utility.RandomInt(1,10)
      SetStage(320)
      EncounterPoints -= 4
   EndIf
ElseIf predatorsAllowed 
   If EncounterPoints > Utility.RandomInt(1,10)
      SetStage(330)
      EncounterPoints -= 2
   EndIf 
Else
   SetStage(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
If UC09_Result.GetValue() == 1
   Alias_Terrormorph.TryToEnable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
Alias_ApexPredator.TryToEnable()
Alias_ApexPredator.TryToSetValue(Game.GetAggressionAV(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
ActorValue aggression = Game.GetAggressionAV()
int numToEnable = Utility.RandomInt(2, Alias_Predators.Length)
int i = 0

; pick some of group to enable
while i < numToEnable
   Alias_Predators[i].TryToEnable()
   Alias_Predators[i].TryToSetValue(aggression, 1)
   i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_Critters.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; General Quest Setup
Keyword Property PCM_TerrormorphEncountersAllowed Auto Const Mandatory
ReferenceAlias Property Alias_Note Auto Const Mandatory
GlobalVariable Property UC09_Result Auto Const Mandatory
Perk Property BackgroundBigGameHunter Auto Const Mandatory
Perk Property BackgroundExplorer Auto Const Mandatory

; Hostile Actors 
ReferenceAlias Property Alias_Trigger Auto Const Mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const Mandatory
ReferenceAlias Property Alias_Enemy Auto Const Mandatory
ReferenceAlias Property Alias_ApexPredator Auto Const Mandatory
ReferenceAlias Property Alias_Predator Auto Const Mandatory
ReferenceAlias[] Property Alias_Predators Auto Const Mandatory
RefCollectionAlias Property Alias_Enemies Auto Const
RefCollectionAlias Property Alias_Critters Auto Const Mandatory

; Corpses
ReferenceAlias Property Alias_Predator_Corpse00 Auto Const Mandatory
ReferenceAlias Property Alias_Predator_Corpse01 Auto Const Mandatory
ReferenceAlias Property Alias_Predator_Corpse02 Auto Const Mandatory
ReferenceAlias Property Alias_ApexPredator_Corpse Auto Const Mandatory
ReferenceAlias Property Alias_EnemyCorpse00 Auto Const Mandatory
ReferenceAlias Property Alias_EnemyCorpse01 Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

ReferenceAlias Property Alias_RewardContainer Auto Const Mandatory
