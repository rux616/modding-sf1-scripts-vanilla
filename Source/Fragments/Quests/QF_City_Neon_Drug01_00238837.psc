;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Drug01_00238837 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Move people
Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef())
Game.GetPlayer().MoveTo(Alias_NesharStart.GetRef())

SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; As soon as the quest starts - go straight to pointing to Neshar
SetStage(100)

; Start off the Syndicate as unaggressive
Float fAggression = 0.0 ;Unaggressive=0, Aggressive=1, VeryAggressive=2, Frenzied=3
Alias_BadGuys.SetValue(Aggression, fAggression)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(700)

; Move people
Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef())
Alias_Neshar.GetRef().Disable()
Game.GetPlayer().MoveTo(Alias_Yannick.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)


Drug01_NesharDoorRef.Lock()
Drug01_NesharDoorRef.SetLockLevel(254)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Move Neshar where he belongs - and make him sad
Alias_Neshar.GetRef().Enable()
Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef())
Alias_Neshar.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; The Sleep Crate is no longer plot locked
Alias_C153Container.GetRef().Unlock()
Neon_Drug01_NesharCrateDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;modding global for sleepcrate minigame
Neon_EvictedSleepcrate_Global.Mod(1)
SleepcrateMinigameQuest.SetStage(10)

; The Sleep Crate is no longer plot locked
Alias_C203Container.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Toggle off all of Yannick's standard Neon Greet Scene stuff
DialogueFCNeon.SetStage(490)

; Enable Felix
Alias_Felix.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Take away the package and give the player some credits
Game.GetPlayer().RemoveItem(Alias_NesharsPackage.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Extra reward
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Enable the bad guys
Alias_BadGuys.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetStage(575)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

; Make the bad guys start to fight
Alias_BadGuys.StartCombatAll(Game.GetPlayer())
Float fAggression = 1.0 ;Unaggressive=0, Aggressive=1, VeryAggressive=2, Frenzied=3
Alias_BadGuys.SetValue(Aggression, fAggression)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Make Felix appear now
Alias_Felix.GetRef().Enable()
Alias_Felix.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

Alias_Felix.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
; Felix goes hostile
(Alias_Felix.GetRef() as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
; Here are the research mats the player needs to discover the recipe to Amp
Game.GetPlayer().AddItem(Drug02_AmpResearch)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_Drug01_QuestScript
Quest __temp = self as Quest
City_Neon_Drug01_QuestScript kmyQuest = __temp as City_Neon_Drug01_QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Neon Maintenance
Drug01_NesharDoorRef.Unlock()
Drug01_NesharDoorRef.SetLockLevel(0)
Alias_Neshar.GetActorRef().Disable()
kmyQuest.UnregisterForExteriorDoorEvents()

; Start up Drug02
City_Neon_Drug02.Start()
City_Neon_Drug02.SetActive()

;unlock Xenofresh Fisheries door and replace Xenofresh guards with
;Neon Security that won't get mad at you for trespassing
Alias_XenofreshFisheriesDoor.GetRef().Unlock()
Alias_XenofreshGuard00.GetRef().Disable()
Alias_XenofreshGuard01.GetRef().Disable()
Alias_XenofreshGuard_NoTrespass.GetRef().Enable()
Alias_XenofreshGuard_NoTrespass01.GetRef().Enable()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Remove Felix and Neshar - bye bye, guys
Alias_Felix.GetRef().Disable()
Alias_Neshar.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_C153Container Auto Const Mandatory

RefCollectionAlias Property Alias_BadGuys Auto Const Mandatory

ReferenceAlias Property Alias_Felix Auto Const Mandatory

ReferenceAlias Property Alias_Yannick Auto Const Mandatory

Quest Property City_Neon_Drug02 Auto Const Mandatory

ReferenceAlias Property Alias_NesharStart Auto Const Mandatory

ReferenceAlias Property Alias_Neshar Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_C203Container Auto Const Mandatory

MiscObject Property Neon_Drug01_Package Auto Const Mandatory

LeveledItem Property Drug02_AmpResearch Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory

Scene Property Drug01_550_SyndicateGreeting Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property Neon_EvictedSleepcrate_Global Auto Const Mandatory

Quest Property SleepcrateMinigameQuest Auto Const

ReferenceAlias Property Alias_XenofreshFisheriesDoor Auto Const Mandatory

ReferenceAlias Property Alias_XenofreshGuard00 Auto Const Mandatory

ReferenceAlias Property Alias_XenofreshGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_XenofreshGuard_NoTrespass Auto Const Mandatory

ReferenceAlias Property Alias_XenofreshGuard_NoTrespass01 Auto Const Mandatory

ReferenceAlias Property Alias_NesharsPackage Auto Const Mandatory

ObjectReference Property Neon_Drug01_NesharCrateDoor Auto Const Mandatory

ObjectReference Property Drug01_NesharDoorRef Auto Const Mandatory
