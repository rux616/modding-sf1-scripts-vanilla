;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Crucible01_000BD77E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Move the player to the right spot
Game.GetPlayer().MoveTo(CrucibleMarker_CommonArea)

; This is a debug to get all of the actors in Crucible to appear
MS02.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Move HH Holmes to his intro spot
Actor aTarg = Alias_HH_Holmes.GetActorRef()
aTarg.MoveTo(Crucible01_InitialHolmesMarker)
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)

; The player gets called out by Wyatt Earp
Crucible01_050_HolmesBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; Get HH Holmes to move
Actor aTarg = Alias_HH_Holmes.GetActorRef()
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; If both people are at the cave, progress the quest
if ( GetStageDone(120) )
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; If both people are at the cave, progress the quest
if ( GetStageDone(110) )
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)

; Set things up for New Game+
Game.GetPlayer().SetValue(Crucible01_ForeknowledgeAV, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
; Force HH Holmes into an alias that renames him
Alias_HH_Holmes_Name.ForceRefTo(Alias_HH_Holmes.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)

; HH Holmes attacks
Actor aTarg = Alias_HH_Holmes.GetActorRef()
aTarg.StartCombat(Game.GetPlayer())
aTarg.SetEssential(FALSE)
aTarg.AddToFaction(PlayerEnemyFaction)
aTarg.EvaluatePackage()

; And the explosives go off
(Alias_ExplosiveBarrels.GetAt(0) as TestExplodingBarrel).Explode()
(Alias_ExplosiveBarrels.GetAt(1) as TestExplodingBarrel).Explode()
Alias_ExplosiveBarrels.GetAt(0).DamageObject(100.0)
Alias_ExplosiveBarrels.GetAt(1).DamageObject(100.0)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetStage(200)

CompleteAllObjectives()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Crucible01_050_HolmesBark Auto Const Mandatory

ObjectReference Property CrucibleMarker_CommonArea Auto Const Mandatory

ReferenceAlias Property Alias_HH_Holmes Auto Const Mandatory

ObjectReference Property Crucible01_InitialHolmesMarker Auto Const Mandatory

Quest Property MS02 Auto Const Mandatory

ActorValue Property Crucible01_ForeknowledgeAV Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_ExplosiveBarrels Auto Const Mandatory

ReferenceAlias Property Alias_HH_Holmes_Name Auto Const Mandatory
