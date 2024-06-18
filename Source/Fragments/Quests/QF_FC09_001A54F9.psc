;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC09_001A54F9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_RonHope.GetRef().MoveTo(FC09_IntroSceneMarker_Hope)
Alias_Cosette.GetRef().MoveTo(FC09_IntroSceneMarker_Cosette)
Alias_BirgitMacDougall.GetRef().MoveTo(FC09_IntroSceneMarker_Hope)
Alias_GuardF01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardF01)
Alias_GuardM01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardM01)

;Disable the workers that are in the way of the scene
Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[]
int i = 0
while (i < workers.length)
    workers[i].DisableNoWait()
    i += 1
EndWhile

FC01.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetobjectiveCompleted(50)
SetobjectiveDisplayed(100)

; Recalc guard level
Alias_AllGuards.ResetAll()
Alias_RonHope.GetRef().Reset()
Alias_Cosette.GetRef().Reset()

Alias_Cosette.GetActorRef().AddToFaction(HT_GenericSecurityFaction)

;Disable the workers that are in the way of the scene
Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[]
int i = 0
while (i < workers.length)
    workers[i].DisableNoWait()
    i += 1
EndWhile

; Move actors into position
Alias_RonHope.GetRef().MoveTo(FC09_IntroSceneMarker_Hope)
Alias_Cosette.GetRef().MoveTo(FC09_IntroSceneMarker_Cosette)
Alias_BirgitMacDougall.GetRef().MoveTo(FC09_IntroSceneMarker_Birgit)
Alias_GuardM01.GetRef().MoveTo(FC09_GuardM01TravelMarker)
Alias_GuardF01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardF01)

; Remove the keyword from the FC08 space locations so they can spawn SEs again
SArcturus_PArcturusII_Orbit.RemoveKeyword(LocTypeSENotAllowed)
scLC053Location.RemoveKeyword(LocTypeSENotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
FC09_RonHopeInitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
; Set when the intro scene ends

; EVP everyone
Alias_RonHope.GetActorRef().EvaluatePackage()
Alias_Cosette.GetActorRef().EvaluatePackage()
Alias_BirgitMacDougall.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Give the player credits
Alias_PLayer.GetActorRef().AddItem(Credits, 10,000)

SetobjectiveCompleted(100)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set from stages 310 and 320
; Tracking stage to show the player took either bribe
; Used as condition in companion dialogue/reaction
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Give money
int PayoffSmall = FC09_PayoffAmountSmall.GetValue() as int
Alias_Player.GetActorRef().AddItem(Credits, PayoffSmall)

; Advance quest
SetObjectiveCompleted(100)
SetStage(300)
SetStage(700)

; Start companion reaction scene
FC09_CompanionBribeReactScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Give money
int PayoffBig = FC09_PayoffAmountBig.GetValue() as int
Alias_Player.GetActorRef().AddItem(Credits, PayoffBig)

; Take slate
Alias_PLayer.GetActorRef().RemoveItem(Alias_EvidenceSlate.GetRef())

; Advance quest
SetObjectiveCompleted(100)
SetStage(300)
SetStage(700)

; Start companion reaction scene
FC09_CompanionBribeReactScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Set at the end of HopeProsecuteBranch scene

; Take slate
Alias_PLayer.GetActorRef().RemoveItem(Alias_EvidenceSlate.GetRef())

; Advance quest
SetObjectiveCompleted(100)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
; Set in stage 9 of Hope's first greet scene
; Conditions the firt 9 phases so the player doesn't have to repeat them
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
SetObjectiveDisplayed(220)

; Remove essential status from Ron Hope and Cosette
Alias_RonHope.GetActorRef().SetEssential(False)
Alias_Cosette.GetActorRef().SetEssential(False)

; Push Hope into player enemy faction
Alias_RonHope.GetActorRef().AddToFaction(PlayerEnemyFaction)

; Add eveyone to combat music faction
Alias_RonHope.GetActorRef().AddToFaction(FC09_CombatMusicFaction)
Alias_AllGuards.AddToFaction(FC09_CombatMusicFaction)

; Strip combatants from crime and custom guard factions
Alias_AllGuards.RemoveFromFaction(GuardFaction)
Alias_AllGuards.RemoveFromFaction(HT_GenericSecurityFaction)
Alias_AllGuards.RemoveFromFaction(CrimeFactionFreestar)
Alias_RonHope.GetActorRef().RemoveFromFaction(CrimeFactionFreestar)
Alias_Cosette.GetActorRef().RemoveFromFaction(CrimeFactionFreestar)
Alias_Cosette.GetActorRef().RemoveFromFaction(HT_GenericSecurityFaction)

SetStage(525)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
; Make player an enemy of the guards
Alias_Player.GetActorRef().AddToFaction(FC09_HopeTechEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(220)

if GetStageDone(600)
  SetStage(610)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetobjectiveCompleted(200)

if GetStageDone(550)
  SetStage(610)
endif

; Queue up a SSNN News Story interview
RAD02.SetStage(500)

Alias_BirgitMacDougall.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetobjectiveDisplayed(250)

Alias_BirgitMacDougall.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
Alias_BirgitMacDougall.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(250)
  SetobjectiveCompleted(250)
endif

; Remove essential status from Birgit
Alias_BirgitMacDougall.GetActorRef().SetEssential(False)

SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_01
Function Fragment_Stage_0700_Item_01()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Alias_Player.GetActorRef().AddItem(FreestarRangerBadge_Ranger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Everyone cheers fo rthe newly-promoted player
FC09_CheerForPlayerPromotionScene.Start()

;make Autumn recruitable as Elite Crew
AutumnEliteCrewQuest.SetStage(1)

;SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; Set MQ305 variable for Ron Hope being dead
MQ305_FSC_RonHopeKilled.SetValue(1)

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC09_Completed, 1)

; Tell RAD02 this quest is finis
RAD02.SetStage(505)

;Re-enable all of the workers who were disabled at the beginning of the quest
Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[]
int i = 0
while (i < workers.length)
    workers[i].EnableNoWait()
    i += 1
EndWhile

; Promote the player to Ranger rank
Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 2)

CompleteAllObjectives()

; Give reward items
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_01)
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Helmet_01)
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Backpack_01)
Alias_Player.GetActorRef().AddItem(clothes_ranger_vested)
Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersRifle)

; Give reward ship
SpaceshipReference myShip = Alias_RewardShip.GetShipRef()
myShip.SetValue(SpaceshipCrew, 0)
myShip.SetValue(SpaceshipRegistration, 1)

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(myShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(myShip)

FC09_ShipRewardMessage.Show()

;Achievement Unlocked
Game.AddAchievement(16)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int z = 0
while z < Alias_Companions.Length
    Alias_Companions[z].GetActorRef().SetValue(COM_WantsToTalk_FreestarCollective_Cooldown, cooldownTime) 
    z += 1
endwhile
COM_WantsToTalkEvent_FreestarCollective.Send()

;Cooldown on SE_FAB23 to prevent it from spinning up too soon
SE_FAB23_Timestamp.SetValue(currentGameTime + cooldownDays)

FC_EvidenceSlateHolderQuest.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_01
Function Fragment_Stage_2000_Item_01()
;BEGIN CODE
;Re-enable all of the workers who were disabled at the beginning of the quest
Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[]
int i = 0
while (i < workers.length)
    workers[i].EnableNoWait()
    i += 1
EndWhile

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC09_Completed, 1)

; Start cheer scene
SetStage(900)

; Set MQ305 variable for the player accepting Hoipe's bribe and letting him live
if GetStageDone(300)
  MQ305_FSC_RonHopeBribeAccepted.SetValue(1)
else
; Otherwise, set the variable for Ron Hope being alive because the player was compassionate toward his workers
; Note that the player DOES NOT accept any bribe in this case
  MQ305_FSC_RonHopeJailed.SetValue(1)
endif

; Tell RAD02 this quest is finis
RAD02.SetStage(505)

; Promote the player to Ranger rank
Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 2)

; Give reward items
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_01)
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Helmet_01)
Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Backpack_01)
Alias_Player.GetActorRef().AddItem(clothes_ranger_vested)
Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersRifle)

; Give reward ship
SpaceshipReference myShip = Alias_RewardShip.GetShipRef()
myShip.SetValue(SpaceshipCrew, 0)
myShip.SetValue(SpaceshipRegistration, 1)

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(myShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(myShip)

FC09_ShipRewardMessage.Show()

CompleteAllObjectives()

;Achievement Unlocked
Game.AddAchievement(16)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int z = 0
while z < Alias_Companions.Length
    Alias_Companions[z].GetActorRef().SetValue(COM_WantsToTalk_FreestarCollective_Cooldown, cooldownTime) 
    z += 1
endwhile
COM_WantsToTalkEvent_FreestarCollective.Send()

;Cooldown on SE_FAB22 to prevent it from spinning up too soon
SE_FAB22_Timestamp.SetValue(currentGameTime + cooldownDays)

FC_EvidenceSlateHolderQuest.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RonHope Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_AllGuards Auto Const Mandatory

Faction Property FC09_HopeTechEnemyFaction Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property FC09_RonHopeInitialScene Auto Const Mandatory

Key Property FreestarRangerBadge_Ranger Auto Const Mandatory

ObjectReference Property FC09_PT1 Auto Const Mandatory

Faction Property GuardFaction Auto Const Mandatory

ObjectReference Property FC09_IntroSceneMarker_Hope Auto Const Mandatory

ObjectReference Property FC09_IntroSceneMarker_Cosette Auto Const Mandatory

ObjectReference Property FC09_IntroSceneMarker_Birgit Auto Const Mandatory

ReferenceAlias Property Alias_Cosette Auto Const Mandatory

ReferenceAlias Property Alias_BirgitMacDougall Auto Const Mandatory

ReferenceAlias Property Alias_GuardM01 Auto Const Mandatory

ReferenceAlias Property Alias_GuardF01 Auto Const Mandatory

ObjectReference Property FC09_IntroSceneMarker_GuardF01 Auto Const Mandatory

ObjectReference Property FC09_IntroSceneMarker_GuardM01 Auto Const Mandatory

Scene Property FC09_CompanionBribeReactScene Auto Const Mandatory

Faction Property HT_GenericSecurityFaction Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

RefCollectionAlias Property Alias_WorkersToDisable Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

ReferenceAlias Property Alias_EvidenceSlate Auto Const Mandatory

Scene Property FC09_CheerForPlayerPromotionScene Auto Const Mandatory

ActorValue Property FreestarRangerRank Auto Const Mandatory

Quest Property FC_EvidenceSlateHolderQuest Auto Const Mandatory

Quest Property AutumnEliteCrewQuest Auto Const

ActorValue Property FC09_Completed Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const Mandatory

Armor Property Spacesuit_Ranger_01 Auto Const Mandatory

Armor Property Spacesuit_Ranger_Helmet_01 Auto Const Mandatory

Armor Property Spacesuit_Ranger_Backpack_01 Auto Const Mandatory

GlobalVariable Property FC09_PayoffAmountBig Auto Const Mandatory

GlobalVariable Property FC09_PayoffAmountSmall Auto Const Mandatory

Armor Property Clothes_Ranger_Vested Auto Const Mandatory

LeveledItem Property LL_Weapon_FreestarRangersRifle Auto Const Mandatory

ReferenceAlias Property Alias_RewardShip Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_FreestarCollective Auto Const Mandatory

ObjectReference Property FC09_GuardM01TravelMarker Auto Const Mandatory

Message Property FC09_ShipRewardMessage Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory

Float Property cooldownDays Auto Const

GlobalVariable Property SE_FAB23_Timestamp Auto Const Mandatory

GlobalVariable Property SE_FAB22_Timestamp Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_FreestarCollective_Cooldown Auto Const Mandatory

Keyword Property LocTypeSENotAllowed Auto Const Mandatory

Location Property SArcturus_PArcturusII_Orbit Auto Const Mandatory

Location Property scLC053Location Auto Const Mandatory

Faction Property FC09_CombatMusicFaction Auto Const Mandatory
