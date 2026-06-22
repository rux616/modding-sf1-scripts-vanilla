;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_MysteriousTragedy_0008DF6F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
int PlayerLevel = Game.GetPlayer().GetLevel()
int Randomizer = Utility.RandomInt(1,5)

If PlayerLevel  > 100
   Randomizer += 5
ElseIf PlayerLevel > 75
   Randomizer += 4
ElseIf PlayerLevel > 50
   Randomizer += 3
ElseIf PlayerLevel > 25
   Randomizer += 2
ElseIf PlayerLevel > 15
   Randomizer += 1
EndIf

If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
   Randomizer += 3
EndIf

If Game.GetPlayer().HasPerk(BackgroundExplorer)
   Randomizer += 1
EndIf

; Check for Enemies
If Utility.RandomInt(1,10) < Randomizer
   SetStage(20)
ElseIf Utility.RandomInt(1,10) < Randomizer
   SetStage(30)
EndIf

; Add creature corpses
If Utility.RandomInt(1,10) < Randomizer
   SetStage(50)
ElseIf Utility.RandomInt(1,10) < Randomizer
   SetStage(60)
ElseIf Utility.RandomInt(1,10) < Randomizer
   SetStage(70)
EndIf
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
int Randomizer = Utility.RandomInt(1,5)
int PlayerLevel = Game.GetPlayer().GetLevel()

If PlayerLevel  > 100
   Randomizer += 5
ElseIf PlayerLevel > 75
   Randomizer += 4
ElseIf PlayerLevel > 50
   Randomizer += 3
ElseIf PlayerLevel > 25
   Randomizer += 2
ElseIf PlayerLevel > 15
   Randomizer += 1
EndIf

If PlayerLevel < 25 && GetStageDone(20)
   Randomizer -= 3
EndIf

If Game.GetPlayer().HasPerk(BackgroundBigGameHunter)
   Randomizer += 3
EndIf

If Game.GetPlayer().HasPerk(BackgroundExplorer)
   Randomizer += 1
EndIf

; Check for Terrormorphs
If terrormorphAllowed 
   If Utility.RandomInt(1,10) < Randomizer
      SetStage(310)
      Randomizer -= 4
   EndIf
EndIf 

; Roll for Predators
If apexAllowed
   If Utility.RandomInt(1,10) < Randomizer
      SetStage(320)
      Randomizer -= 3
   EndIf
ElseIf predatorsAllowed 
   If Utility.RandomInt(1,10) < Randomizer
      SetStage(330)
      Randomizer -= 2
   EndIf 
EndIf


If !GetStageDone(20) && !GetStageDone(310) && !GetStageDone(320) && !GetStageDone(330)
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
