;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_Suspic_00112864 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
IsaacStrum.GetActorRef().Enable()
LouisKing.GetActorRef().Enable()
KarsonEndler.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
IsaacStrum.GetActorRef().Enable()
LouisKing.GetActorRef().Enable()
KarsonEndler.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)

;stop the looping thieves scene from playing
LoopingThievesScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
Post20ThiefLoopScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)
;set the thieves to be non-essential in case the player decides to kill them
IsaacStrum.GetActorRef().SetEssential(false)
LouisKing.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayedAtTop(35)
;set the thieves to be non-essential in case the player decides to kill them
IsaacStrum.GetActorRef().SetEssential(false)
LouisKing.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveFailed(35)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;put the thieves in the PlayerEnemy faction
;have them start combat with the player

IsaacStrum.GetActorRef().AddToFaction(PlayerEnemyFaction)
LouisKing.GetActorRef().AddToFaction(PlayerEnemyFaction)

IsaacStrum.GetActorRef().StartCombat(Game.GetPlayer())
LouisKing.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40, false)
SetObjectiveDisplayed(50, false)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(60)
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;get all the actors to go to their new homes
KarsonEndler.GetActorRef().EvaluatePackage()

SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
IsaacStrum.GetActorRef().EvaluatePackage()
LouisKing.GetActorRef().EvaluatePackage()
Post20ThiefLoopScene.Stop()

;set the thieves back to Essential so the player can't be naughty :P 
IsaacStrum.GetActorRef().SetEssential(true)
LouisKing.GetActorRef().SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveFailed(35)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, City_NA_Z_SuspiciousGlobal.GetValueInt())
SetObjectiveCompleted(40)
SetObjectiveFailed(35)
SetObjectiveDisplayed(60)

IsaacStrum.GetActorRef().EvaluatePackage()
LouisKing.GetActorRef().EvaluatePackage()


SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
IsaacStrum.GetActorRef().Disable()
LouisKing.GetActorRef().Disable()
KarsonEndler.GetActorRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
KarsonEndler.GetActorRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property IsaacStrum Auto Const

ReferenceAlias Property LouisKing Auto Const

Faction Property PlayerEnemyFaction Auto Const

ReferenceAlias Property KarsonEndler Auto Const

MiscObject Property Credits Auto Const

Scene Property LoopingThievesScene Auto Const

Scene Property Post20ThiefLoopScene Auto Const

GlobalVariable Property City_NA_Z_SuspiciousGlobal Auto Const Mandatory
