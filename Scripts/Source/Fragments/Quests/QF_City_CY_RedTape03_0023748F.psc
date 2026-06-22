;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_CY_RedTape03_0023748F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(Alias_Trevor.GetRef())
myPlayer.AddPerk(BackgroundLongHauler)
myPlayer.AddPerk(BackgroundBouncer)
myPlayer.AddPerk(BackgroundGangster)
myPlayer.AddPerk(TRAIT_Empath)
myPlayer.AddPerk(TRAIT_Wanted)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Clint.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Trevor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Hank.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(Alias_Trevor.GetRef())
Actor myHank = Alias_Hank.GetActorRef()
If myHank.IsDead() == False
	myHank.Moveto(myPlayer)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(Alias_Booth.GetRef())
Alias_Hank.GetRef().Moveto(myPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Hank.GetRef().Disable()
SetObjectiveDisplayed(100)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)

Alias_HankShip.GetShipRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(100)
	SetObjectiveCompleted(100)
EndIf
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_01
Function Fragment_Stage_0400_Item_01()
;BEGIN CODE
If !IsObjectiveCompleted(100)
	SetObjectiveCompleted(100)
EndIf
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Move Hank to the bar
ObjectReference myHankRef = Alias_Hank.GetRef()
myHankRef.MoveTo(Alias_BarMarker.GetRef())
myHankRef.Enable()

Objectreference myHankActor = Alias_Hank.GetRef()
myHankActor.RemoveItem(Cutter)
myHankActor.AddItem(LLW_Ammo_UrbanEagle)

SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DrinkBottle_BeerAle_Md, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE CityCYRedTape03HankDistanceScript
Quest __temp = self as Quest
CityCYRedTape03HankDistanceScript kmyQuest = __temp as CityCYRedTape03HankDistanceScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

Actor myHank = Alias_Hank.GetActorRef()

;This just gets Hank to transition to his Follow package quicker.
myHank.EvaluatePackage()

;Equip Hank's gun
myHank.EquipItem(Alias_HankWeapon.GetRef())


;Register First Distance Check, for Hank's traveling dialogue
kmyQuest.StartDistanceCheck()

If Game.GetPlayer().GetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV) == 1
	myHank.SetEssential(False)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
;Clear Hank's Essential Flag so he can be killed.
Alias_Hank.GetActorRef().SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN AUTOCAST TYPE CityCYRedTape03HankDistanceScript
Quest __temp = self as Quest
CityCYRedTape03HankDistanceScript kmyQuest = __temp as CityCYRedTape03HankDistanceScript
;END AUTOCAST
;BEGIN CODE
Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking01Topic)

;Register Second Distance Check, for Hank's traveling dialogue
kmyQuest.StartDistanceCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0721_Item_00
Function Fragment_Stage_0721_Item_00()
;BEGIN AUTOCAST TYPE CityCYRedTape03HankDistanceScript
Quest __temp = self as Quest
CityCYRedTape03HankDistanceScript kmyQuest = __temp as CityCYRedTape03HankDistanceScript
;END AUTOCAST
;BEGIN CODE
Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking02Topic)

;Register Third Distance Check, for Hank's traveling dialogue
kmyQuest.StartDistanceCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0722_Item_00
Function Fragment_Stage_0722_Item_00()
;BEGIN CODE
Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking03Topic)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Clear Hank's Essential Flag so he can be killed.
Alias_Hank.GetActorRef().SetEssential(False)

City_CY_RedTape03_0800_Hank_Threaten.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV, 1)

Utility.Wait(2.5)
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0806_Item_00
Function Fragment_Stage_0806_Item_00()
;BEGIN CODE
;Remove the gun Hank is carrying and give one to the player.
Actor myHank = Alias_Hank.GetActorRef()
(myHank as ObjectReference).RemoveItem(Alias_HankWeapon.GetRef())
Game.GetPlayer().AddItem(LL_Weapon_UrbanEagle, 1)
myHank.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Make Hank hostile to the player
Actor myHank = Alias_Hank.GetActorRef()
myHank.RemoveFromAllFactions()
myHank.AddToFaction(CityCYRedTape03HankHostileFaction)
myHank.StartCombat(Game.GetPlayer())
myHank.EvaluatePackage()

SetObjectiveCompleted(800)
SetObjectiveDisplayed(850)

;If the player is also on City_CY_Psych01, end Hank's objective there
If City_CY_Psych01.IsRunning()
	If !City_CY_Psych01.GetStageDone(120)
		City_CY_Psych01.SetStage(121)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0855_Item_00
Function Fragment_Stage_0855_Item_00()
;BEGIN CODE
SetStage(900)
Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAtShipAV, 1)
City_CY_RedTape03_0855_Companion_HankDead.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(860)

;This just gets Hank to transition to his Follow package quicker.
Alias_Hank.GetActorRef().EvaluatePackage()

;If the player is also on City_CY_Psych01, end Hank's objective there
If City_CY_Psych01.IsRunning()
	If !City_CY_Psych01.GetStageDone(120)
		City_CY_Psych01.SetStage(121)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0861_Item_00
Function Fragment_Stage_0861_Item_00()
;BEGIN CODE
City_CY_RedTape03_HankMad.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0880_Item_00
Function Fragment_Stage_0880_Item_00()
;BEGIN CODE
SetStage(900)
Alias_JailDoor.GetRef().SetOpen(True)
City_CY_RedTape03_0880_Booth_Hank_Jail.Start()
Alias_Hank.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0881_Item_00
Function Fragment_Stage_0881_Item_00()
;BEGIN AUTOCAST TYPE CityCYRedTape03QuestScript
Quest __temp = self as Quest
CityCYRedTape03QuestScript kmyQuest = __temp as CityCYRedTape03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CloseJailCell()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0886_Item_00
Function Fragment_Stage_0886_Item_00()
;BEGIN AUTOCAST TYPE CityCYRedTape03QuestScript
Quest __temp = self as Quest
CityCYRedTape03QuestScript kmyQuest = __temp as CityCYRedTape03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CloseJailCell()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveCompleted(800)

If IsObjectiveDisplayed(850)
	SetObjectiveCompleted(850)
EndIf
If IsObjectiveDisplayed(860)
	If !GetStageDone(855)
		SetObjectiveCompleted(860)
	Else
		SetObjectiveFailed(860)
	EndIf
EndIf
;This just gets Hank to transition to his Follow package quicker.
If !GetStageDone(855)
	Alias_Hank.GetActorRef().EvaluatePackage()
EndIf
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN CODE
If GetStageDone(880)
	Alias_Hank.GetRef().MoveTo(Alias_HankJailMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
DialogueCydonia.SetStage(2600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)

Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAV, 1)

;Tell the Cydonia Dialogue quest that this quest series is complete 
;so City_CY_Runaway can start 
DialogueCydonia.SetStage(1120)

;This is really only for debugging when completing the quest through 
;the console, but it can't hurt to run it here just in case, anyway.
ObjectReference myHank = Alias_Hank.GetRef()
If myHank.IsDisabled() == True
	myHank.Enable()
EndIf

;Tell the Cydonia Dialogue quest that this quest series is complete 
;so the mining equipment can be swapped.
DialogueCydonia.SetStage(1120)

ObjectReference myHankActor = Alias_Hank.GetRef()
myHankActor.RemoveItem(Alias_HankWeapon.GetRef())
If !GetStageDone(880)
	myHankActor.AddItem(Cutter)
EndIf


Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Trevor Auto Const Mandatory

ReferenceAlias Property Alias_Clint Auto Const Mandatory

ReferenceAlias Property Alias_Hank Auto Const Mandatory

ReferenceAlias Property Alias_BarMarker Auto Const Mandatory

Potion Property DrinkBottle_BeerAle_Md Auto Const Mandatory

Faction Property CityCYRedTape03HankHostileFaction Auto Const Mandatory

Scene Property City_CY_RedTape03_0880_Booth_Hank_Jail Auto Const Mandatory

Scene Property City_CY_RedTape03_0800_Hank_Threaten Auto Const Mandatory

ReferenceAlias Property Alias_Booth Auto Const Mandatory

GlobalVariable Property City_CY_RedTape03_HankMad Auto Const Mandatory

Quest Property City_CY_Psych01 Auto Const Mandatory

ReferenceAlias Property Alias_HankJailMarker Auto Const Mandatory

Quest Property DialogueCydonia Auto Const Mandatory

Scene Property City_CY_RedTape03_0855_Companion_HankDead Auto Const Mandatory

ActorValue Property City_CY_RedTape03_Foreknowledge_HankAV Auto Const Mandatory

ActorValue Property City_CY_RedTape03_Foreknowledge_HankAtShipAV Auto Const Mandatory

ActorValue Property City_CY_RedTape03_Foreknowledge_HankInBarAV Auto Const Mandatory

Topic Property City_CY_RedTape03_Hank_Walking01Topic Auto Const Mandatory

Topic Property City_CY_RedTape03_Hank_Walking02Topic Auto Const Mandatory

Topic Property City_CY_RedTape03_Hank_Walking03Topic Auto Const Mandatory

ReferenceAlias Property Alias_HankShip Auto Const Mandatory

Perk Property BackgroundLongHauler Auto Const Mandatory

Perk Property BackgroundBouncer Auto Const Mandatory

Perk Property BackgroundGangster Auto Const Mandatory

Perk Property TRAIT_Empath Auto Const Mandatory

Perk Property TRAIT_Wanted Auto Const Mandatory

Weapon Property Cutter Auto Const Mandatory

LeveledItem Property LL_Weapon_UrbanEagle Auto Const Mandatory

LeveledItem Property LLW_Ammo_UrbanEagle Auto Const Mandatory

Weapon Property UrbanEagle Auto Const Mandatory

ReferenceAlias Property Alias_HankWeapon Auto Const Mandatory

ReferenceAlias Property Alias_JailDoor Auto Const Mandatory
