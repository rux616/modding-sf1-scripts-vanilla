;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RAD05_002AD3D5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Teleport the player to Landry
Actor aLandry = Alias_LandryHollifeld.GetActorRef()
Game.GetPlayer().MoveTo(aLandry)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Check to see if you're hunting the pirate
if ( RAD05_TargetVariant.GetValue() == 1 )
  ; If so, then queue up that variant
  SetStage(145)
endif

; Check to see if you're on variant 2 - if so the target is hostile
if ( RAD05_QuestVariant.GetValue() == 2 )
  Actor aTarg = Alias_target.GetActorRef()
  Actor aPlayer = Game.GetPlayer()
  aTarg.SetValue(Game.GetAggressionAV(), 2) ; Now they are aggressive
  aTarg.RemoveFromAllFactions()  ; Strip away factions
  aTarg.AddToFaction(PlayerEnemyFaction)  ; Make them an enemy of the player
  aTarg.AddToFaction(PirateFaction)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
if ( RAD05_TargetVariant.GetValue() == 1 )
  ; If you are hunting pirates, get a different objective
  SetObjectiveDisplayed(145)

  ; And also make it so the map marker shows up
  Alias_SpaceMapMarker.GetRef().Enable()
else
  SetObjectiveDisplayed(100)
endif

; If this is the first instance - move Dieter
if ( RAD05_QuestVariant.GetValue() == 0 )
  Alias_01_Dieter.GetRef().MoveTo(Alias_FinalMapMarker.GetRef())
endif

; If this is the friendly Merc, disable any encounters
if ( RAD05_QuestVariant.GetValue() == 3 && RAD05_TargetVariant.GetValue() == 1 )
  Alias_Loc03_Friendly_Overlay.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
int i = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; When you reach the proper orbit, then spawn the Pirate
RAD05_Space_PirateEnc.Start()

Utility.Wait(1.0)

; After the space encounter spins up, then force the pirate ship
;   into the right Alias so the quest knows who the target is.
ObjectReference oPirate = Alias_Tar01_PirateShip.GetRef()
Alias_Target.ForceRefTo(oPirate)

; And have it attack
(oPirate as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(145)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
; Make it so that the target goes hostile
Actor aTarg = Alias_target.GetActorRef()
Actor aPlayer = Game.GetPlayer()

aTarg.RemoveFromAllFactions()
aTarg.SetValue(Aggression, 2.0)
aTarg.AddToFaction(PlayerEnemyFaction)
aTarg.StartCombat(aPlayer)

; If the target is Dieter, then his bodyguards go hostile
if ( RAD05_NumTimesCompleted.GetValue() == 0 )
  Alias_Guards01_Dieter.StartCombatAll(aPlayer)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pCredits, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
; Flag that the debt has been collected
SetStage(200)

; Give the player a custom reward
Game.GetPlayer().AddItem(LL_Weapon_Reward_RAD05_Solace)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

; Increment the number of times completed
Float fTemp = RAD05_NumTimesCompleted.GetValue()
RAD05_NumTimesCompleted.SetValue(fTemp+1)

; For the next iteration of the quest - do the randomness now
;   (That way the Aliases can use it when the quest restarts)

; For Target: 
;     1 Pirate
;     2 Businesswoman
;     3 Mercenary
Float fRandom = Utility.RandomInt(1, 3) as Float

; If you rolled the same as the current variant - let's deal with that
;if ( fRandom == RAD05_TargetVariant.GetValue() as Int )
;  if ( fRandom == 3 )  ; If you are the third variant, then roll 1
;    fRandom = 1
;  else                 ; Otherwise just pick next
;    fRandom += 1
;  endif
;endif

RAD05_TargetVariant.SetValue(RAD05_NumTimesCompleted.GetValue())

fRandom = Utility.RandomInt(1, 2) as Float
RAD05_QuestVariant.SetValue(1)

; End the quest
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
FailAllObjectives()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Note: This quest isn't stopped - it's reset so a player can do it again
;       If they want
; NOTE: This is being called via another script so it can be
;       restarted.

if RAD05_NumTimesCompleted.GetValue() < 4
(DialogueUCNewAtlantis_LandryHollifeld as LandyScript).RestartRAD05()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_target Auto Const Mandatory

ReferenceAlias Property Alias_LandryHollifeld Auto Const Mandatory

MiscObject Property pCredits Auto Const Mandatory

GlobalVariable Property RAD05_NumTimesCompleted Auto Const Mandatory

GlobalVariable Property RAD05_TargetVariant Auto Const Mandatory

GlobalVariable Property RAD05_QuestVariant Auto Const Mandatory

RefCollectionAlias Property Alias_Guards01_Dieter Auto Const Mandatory

Quest Property RAD05_Space_PirateEnc Auto Const Mandatory

ReferenceAlias Property Alias_Tar01_PirateShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property PirateFaction Auto Const Mandatory

ReferenceAlias Property Alias_FinalMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_01_Dieter Auto Const Mandatory

Quest Property DialogueUCNewAtlantis_LandryHollifeld Auto Const

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Loc03_Friendly_Overlay Auto Const Mandatory 

ReferenceAlias Property Alias_SpaceMapMarker Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_RAD05_Solace Auto Const Mandatory
