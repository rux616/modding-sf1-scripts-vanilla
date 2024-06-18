;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_CreatureCage_Script Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_Creature.GetActorRef().Disable()
Alias_Creature_Hard.GetActorRef().Disable()
Alias_Creature_Medium.GetActorRef().Disable()
Alias_Creature_Easy.GetActorRef().Disable()
Alias_Cage.GetRef().Enable()
Alias_Nest.GetRef().Enable()

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor Creature = Alias_Creature.GetActorRef()

Creature.MoveTo( Alias_CageMarker.GetRef() )
Creature.SetScale(0.7) ; smallest that is allowed
Creature.Enable()
Creature.MoveTo( Alias_CageMarker.GetRef() )

SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference Cage = Alias_CageDoor.GetRef()
int PlayerLevel = Game.GetPlayer().GetLevel()
int Range = PlayerLevel / 2
int NoviceLockLevel = LockLevel_Novice.GetValue() as Int
int AdvancedLockLevel = LockLevel_Advanced.GetValue() as Int
int ExpertLockLevel = LockLevel_Expert.GetValue() as Int
int MasterLockLevel = LockLevel_Master.GetValue() as Int

PlayerLevel = Math.Clamp(PlayerLevel as Float, 0.0, 100.0) as Int
Range = Utility.RandomInt(Range, PlayerLevel)

Cage.SetOpen(False) ; KMK: always close the cage since creatures can't open doors

If Range < NoviceLockLevel
   Cage.Lock(False)
   Cage.UnLock(True)
Else 
   Cage.Lock()

   If Range < AdvancedLockLevel
      Cage.SetLockLevel(NoviceLockLevel)
   ElseIf Range < ExpertLockLevel
      Cage.SetLockLevel(AdvancedLockLevel)
   ElseIf Range < MasterLockLevel
      Cage.SetLockLevel(ExpertLockLevel)
   Else
      Cage.SetLockLevel(MasterLockLevel)
   EndIf 
EndIf 

SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference Nest = Alias_Nest.GetRef()
Actor Player = Game.GetPlayer()

Nest.MoveTo( Alias_NestMarker.GetRef() )
Nest.Enable()
Nest.Unlock()
Nest.SetOpen(True)

If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter)
   SetStage(35)
ElseIf Utility.RandomInt(Player.GetLevel(),100 ) > Utility.RandomInt(0,100)
   SetStage(35)
EndIf 

SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Actor Player = Game.GetPlayer()

Alias_Nest.GetRef().AddItem(LL_OELoot)

; Bonus
If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter)
   Alias_Nest.GetRef().AddItem(LL_OELoot)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
int BonusChance = Utility.RandomInt(1,3)
debug.trace(self + " bonus chance=" + BonusChance)
If BonusChance > 1
   SetStage(45)
EndIf 

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Actor BonusCreature = NONE
int Random = Utility.RandomInt(0, Game.GetPlayer().GetLevel())

debug.trace(self + " rolling for random creatures: " + random)

; KMK: hard/med/easy isn't possible since we need to match the predator to what was spawned in the cage
; so instead we randomly enable (and sometimes kill) 0-3 additional creatures
If Random > 75
   Alias_Creature_Hard.TryToEnable()
   Alias_Creature_Easy.TryToEnable()
ElseIf Random > 25
   Alias_Creature_Easy.TryToEnable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
ObjectReference Corpse = Alias_NPCCorpse.GetRef()
ObjectReference Nest = Alias_NestMarker.GetRef()
ObjectReference Cage = Alias_CageMarker.GetRef()
int Random = Utility.RandomInt(1,4)

If Random < 4
   If Nest != NONE || Cage != NONE
       SetStage(55)
   EndIf 
EndIf

SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
ObjectReference Marker = Alias_CageMarker.GetRef()
ObjectReference Corpse = Alias_NPCCorpse.GetRef()
int Random = Utility.RandomInt(0,3)

If Corpse != NONE
   If Random < 2
      Marker = Alias_NestMarker.GetRef()
      Random = Utility.RandomInt(0,3)
   EndIf 

   If Random < 3
      Corpse.MoveTo(Marker)
   EndIf

   Alias_NPCCorpse.GetRef().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
int PlayerLevel = Game.GetPlayer().GetLevel()

If Utility.RandomInt(0, PlayerLevel) > 50
   Alias_Creature_Medium.TryToEnable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor Creature = Alias_Creature.GetActorRef()

Creature.AddToFaction(PlayerEnemyFaction)
Creature.StartCombat(Alias_Player.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If GetStageDone(200)
   Alias_Nest.GetRef().AddItem(LL_OELoot_Rare)
Else
   Alias_Nest.GetRef().AddItem(LL_OELoot_Uncommon)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; both creatures are dead
If GetStageDone(850)
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; both creatures are dead
If GetStageDone(800)
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Props
ReferenceAlias Property Alias_CageMarker Auto Const Mandatory
ReferenceAlias Property Alias_NestMarker Auto Const Mandatory
ReferenceAlias Property Alias_Nest Auto Const Mandatory
ReferenceAlias Property Alias_Cage Auto Const Mandatory

; Creatures
ReferenceAlias Property Alias_Creature Auto Const Mandatory
ReferenceAlias Property Alias_Creature_Hard Auto Const Mandatory
ReferenceAlias Property Alias_Creature_Medium Auto Const Mandatory
ReferenceAlias Property Alias_Creature_Easy Auto Const Mandatory

; Player
ReferenceAlias Property Alias_Player Auto Const Mandatory
Faction Property PlayerEnemyFaction Auto Const
Perk Property BackgroundBigGameHunter Auto Const Mandatory
Perk Property BackgroundXenobiologist Auto Const Mandatory
Perk Property BackgroundExplorer Auto Const Mandatory

; Locks and Loot
GlobalVariable Property LockLevel_Novice Auto Const Mandatory
GlobalVariable Property LockLevel_Expert Auto Const Mandatory
GlobalVariable Property LockLevel_Advanced Auto Const Mandatory
GlobalVariable Property LockLevel_Master Auto Const Mandatory
LeveledItem Property LL_OELoot Auto Const Mandatory
LeveledItem Property LL_OELoot_Rare Auto Const Mandatory
LeveledItem Property LL_OELoot_Uncommon Auto Const Mandatory

; Other
ReferenceAlias Property Alias_NPCCorpse Auto Const Mandatory

ReferenceAlias Property Alias_CageDoor Auto Const Mandatory
