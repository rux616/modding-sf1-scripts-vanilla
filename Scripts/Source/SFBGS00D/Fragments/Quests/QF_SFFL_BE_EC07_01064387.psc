;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC07_01064387 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Setup Cockpit Door
ObjectReference cockpitDoor = Alias_CockpitDoor.GetRef()
cockpitDoor.Lock()
cockpitDoor.SetLockLevel(75)
cockpitDoor.SetFactionOwner(PlayerFaction) ;This is to prevent ship NPCs unlocking the door
Alias_AccessCard.GetRef().SetLinkedRef(cockpitDoor,CockpitAccessKeyword,true)

;Make Hannah and Ruby friends of the player to avoid fighting them
Actor Hannah = Alias_HannahFrye.GetActorRef()
Hannah.IgnoreFriendlyHits()
PlayerFaction.SetAlly(HannahFaction,true,true)

Actor Ruby = Alias_RubyKrause.GetActorRef()
Ruby.IgnoreFriendlyHits()
PlayerFaction.SetAlly(RubyFaction,true,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Starts scene where Hannah comes close to the cockpit door
Alias_HannahFrye.GetActorRef().EvaluatePackage()
Utility.Wait(1.5)
Scene_100_HannahDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Utility.Wait(3.0)
Alias_HannahFrye.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SpaceEncounterQuest.SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SpaceEncounterQuest.SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_HannahFrye.GetActorRef().EvaluatePackage()
Alias_RubyKrause.GetActorRef().EvaluatePackage()
Scene_200_HannahRubyDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
;Sets stage on SE to display "Talk to Ruby" objective
SpaceEncounterQuest.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
Actor Hannah = Alias_HannahFrye.GetActorRef()
Hannah.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SpaceEncounterQuest.SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;Update stage and objectives in corresponding SE
SpaceEncounterQuest.SetStage(230)
SpaceEncounterQuest.SetObjectiveSkipped(220)
SpaceEncounterQuest.SetObjectiveDisplayed(230)

Alias_HannahFrye.GetActorRef().EvaluatePackage()
Alias_RubyKrause.GetActorRef().EvaluatePackage()

;If Ruby is already on player's ship, register Hannah as a passenger
if (SpaceEncounterQuest.IsStageDone(350))
    SpaceEncounterQuest.SetStage(360)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SpaceEncounterQuest.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Safety in case the ship is still in the space cell
Alias_GalBankShip.GetRef().Disable()

if (!IsStageDone(230))
    Alias_HannahFrye.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CockpitDoor Auto Const Mandatory

Quest Property SpaceEncounterQuest Auto Const Mandatory

Scene Property Scene_100_HannahDialogue Auto Const Mandatory

ReferenceAlias Property Alias_HannahFrye Auto Const Mandatory

ReferenceAlias Property Alias_RubyKrause Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCorpses Auto Const Mandatory

ReferenceAlias Property Alias_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_AccessCard Auto Const Mandatory

Keyword Property CockpitAccessKeyword Auto Const Mandatory

Scene Property Scene_200_HannahRubyDialogue Auto Const Mandatory

Faction Property GalBank_Faction Auto Const Mandatory

ReferenceAlias Property Alias_ModuleCockpit Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

Faction Property HannahFaction Auto Const Mandatory

Faction Property RubyFaction Auto Const Mandatory

ReferenceAlias Property Alias_GalBankShip Auto Const Mandatory
