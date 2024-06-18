;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_SamCoe_Q01_00263262 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Teleport everyone to the temp cell
ObjectReference oTarg = Alias_SamCoe.GetRef()
ObjectReference oJaylen = Alias_DebugMarker.GetRef()
oTarg.Enable()
oTarg.MoveTo(oJaylen)

oTarg = Alias_CoraCoe.GetRef()
oTarg.Enable()
oTarg.MoveTo(oJaylen)

oTarg = Game.GetPlayer()
oTarg.MoveTo(oJaylen)

; Set up all Sam's AVs to be ready to start the quest
oTarg = Alias_SamCoe.GetRef()
debug.trace(self +  "Sam Coe -- oTarg:" + oTarg)
oTarg.SetValue(COM_StoryGatesCompleted, 6.0)
debug.trace(self +  "Sam Coe -- oTarg.GetValue(COM_StoryGatesCompleted):" + oTarg.GetValue(COM_StoryGatesCompleted))

oTarg.SetValue(COM_Affinity, COM_StoryGate_AffinityRequired_07_Standard.GetValue() as Float)
debug.trace(self +  "Sam Coe -- oTarg.GetValue(COM_Affinity):" + oTarg.GetValue(COM_Affinity))

oTarg.SetValue(COM_CurrentStoryGateTimerExpired, 1.0)
oTarg.SetValue(COM_TEMP_OnPlayerShip, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; If this quest starts, Sam was recruited by default
;   (Useful for testing - and it doesn't hurt anything if set)
if ( COM_SamCoeRecruited.GetValue() == 0 )
  COM_SamCoeRecruited.SetValue(1)
endif

; Make sure Sam is a companion (it shouldn't hurt anything, again - useful for testing)
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(Alias_SamCoe.GetActorRef())

;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_PQ_TxtReplace_QuestName_SamCoe)

SetObjectiveDisplayed(50)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

SetStage(700)

; Then move the player
Alias_CoraCoe.GetRef().MoveTo(LC123LandingREF)
Alias_SamCoe.GetRef().MoveTo(LC123LandingREF)
Game.GetPlayer().MoveTo(LC123LandingREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetStage(850)
SetObjectiveCompleted(850)
SetStage(1100)

; Then move the player
Alias_CoraCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF)
Alias_SamCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF)
Alias_LillianHart.GetRef().MoveTo(COM_SC_CacheEntranceREF)
Game.GetPlayer().MoveTo(COM_SC_CacheEntranceREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

if FC04.IsRunning() && !FC04.GetStageDone(900)
  SetStage(110)
else
  SetObjectiveDisplayed(75)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if !GetStageDone(300)
  SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(1)
  SetObjectiveDisplayed(110)

  ;Need to turn off the other objectives until FC04's done
  if IsObjectiveDisplayed(75) && !IsObjectiveCompleted(75)
    SetObjectiveDisplayed(75, false, false)
  endif

  if IsObjectiveDisplayed(100) && !IsObjectiveCompleted(100)
    SetObjectiveDisplayed(100, false, false)
  endif

  if IsObjectiveDisplayed(200) && !IsObjectiveCompleted(200)
    SetObjectiveDisplayed(200, false, false)
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(0)
SetObjectiveCompleted(110)

;Get the proper objectives displaying again
if !GetStageDone(400)
  if GetStageDone(200)
    SetObjectiveDisplayed(200)  
  elseif GetStageDone(150)
    SetObjectiveDisplayed(100)
  elseif GetStageDone(100)
    SetObjectiveDisplayed(75)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if SamCoe_Q01_JaylenPrice_BlockedByFC04.GetValue() < 1.0
  SetObjectiveCompleted(75)
  SetObjectiveDisplayed(100)
endif

Alias_SamCoe.GetActorRef().EvaluatePackage()

;"lock in" Cora to her follow as per her page
COM_Cora_FollowingAllowed.SetValue(1)
Alias_CoraCoe.GetActorRef().EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Let the player pick up the CI Clue
Alias_CI_Clue.GetRef().Enable()

; Jaylen updates his package - so he moves if he needs to
;   The Actor Value makes sure Jaylen won't behave badly for FC03
Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 1.0)
Alias_JaylenPryce.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Start up Sam's stall for time scene
COM_SamCoeQ01_0310_SamStallsForTime.Start()

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)
SetStage(400)

; Jaylen can now move around for FC03 if he likes
Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)

; End the stall scene
COM_SamCoeQ01_0310_SamStallsForTime.Stop()

; Play his closing snippet
if ( GetStageDone(310) )
  COM_SamCoeQ01_0311_SamStallsEnds.Start()
endif

; Get the papers in the next objective enabled
Alias_VictorCompoundPapers.GetRef().Enable()

;GEN-521271: If player bypassed Jaylen, proceed with the quest
if GetStageDone(110)
  SetStage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Elevator Activation
(Alias_ElevatorManagerApartment.GetRef()  as LoadElevatorManagerScript).SetElevatorOperational(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Check if Cora is there
If (Alias_CoraCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment)
Alias_CoraCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker)
EndIf

;Make sure Sam is there and make sure he isn't waiting
SQ_Followers.CommandFollow(Alias_SamCoe.GetActorRef())
If (Alias_SamCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment)
Alias_SamCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker)
EndIf

; Start the scene when you enter the CI's place
COM_SamCoeQ01_0510_ArrivedOutsideCI.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
; When the intro non-player scene ends - Sam Coe talks with the player
; TODO: Sam Coe needs to want to start the conversation by moving up to the PC
COM_SamCoeQ01_0520_CIDoorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
; Unlock and open the door
Alias_CI_Door.GetRef().Lock(FALSE)
Alias_CI_Door.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

;Stop Sam Follow Behavior
SQ_Followers.SetRoleInactive(Alias_SamCoe.GetActorReference())

; When you enter the room - play the murder scene
COM_SamCoeQ01_0600_MurderScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
COM_SamCoeQ01_0600_MurderScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)
SetObjectiveDisplayed(700)

; Now you can find Victor Compound
Alias_VictorMapMarker.GetRef().Enable()

;Return Sam to Follow
SQ_Followers.SetRoleActive(Alias_SamCoe.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(750)

; Move Sam and Cora to the player
ObjectReference oTarg = Alias_SamCoe.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04))
oTarg = Alias_CoraCoe.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04))

; Start this scene as soon as you land
COM_SamCoeQ01_0750_LillianAlert.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
SetObjectiveCompleted(750)
SetObjectiveDisplayed(775)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(775)
SetObjectiveDisplayed(800)

; 0 - Cora is following the player
; 1 - Cora is perched being the player's eyes and ears
; 2 - Cora has found Mom - go back to being a normal Elite Crew
; This variable determines which package Cora is in.
Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 1.0)
Alias_CoraCoe.GetActorRef().EvaluatePackage()
Alias_LillianHart.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
Actor aLillian = Alias_LillianHart.GetRef() as Actor

; Remove Lillian from the Alias which makes it so no one attacks her
Alias_LillianTempNonHostile.Clear()

COM_SamCoeQ01_0825_LillianShedsCover.Start()

; Then make her go hostile to the enemies
aLillian.SetValue(Aggression, 1.0)
aLillian.AddToFaction(PlayerAllyFaction)
aLillian.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(850)

; Flag that the player has met Lillian
COM_PlayerMet_LilianHart.SetValue(1.0)

; Refill the aliases for the scenes in the player ship
Alias_PlayerShipModule.RefillAlias()
Alias_LillianSceneMarker.RefillAlias()
Alias_CoraSceneMarker.RefillAlias()

; Have Lillian move
Alias_LillianHart.GetActorRef().EvaluatePackage()

; Spawn last wave of enemies
Alias_VictorCompoundFinalAmbush.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
; Move Lillian and Cora to their spots
Actor aTarg
aTarg = Alias_CoraCoe.GetActorRef()
aTarg.MoveTo(Alias_CoraSceneMarker.GetREF())
aTarg.EvaluatePackage()

aTarg = Alias_LillianHart.GetActorRef()
aTarg.MoveTo(Alias_LillianSceneMarker.GetREF())
aTarg.EvaluatePackage()
aTarg.SetOutfit(Outfit_FreestarRanger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0875_Item_00
Function Fragment_Stage_0875_Item_00()
;BEGIN CODE
; 0 - Cora is following the player
; 1 - Cora is perched being the player's eyes and ears
; 2 - Cora has found Mom - go back to being a normal Elite Crew
; This variable determines which package Cora is in.
Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 2.0)
Alias_CoraCoe.GetActorRef().EvaluatePackage()

; Play the scene
COM_SamCoeQ01_0875_LillianCoraReunion.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
; Get Cora to start moving so Sam can take her spot
Alias_CoraCoe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
; Spawn the Dumas's space cell
COM_Quest_SamCoe_Q01_SpaceEnc.Start()

; Start Lillian's scene talking to the Dumas
COM_SamCoeQ01_0920_DumasHailed.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
; It goes hostile
COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

; Lillian says she's ready for the next part
COM_SamCoeQ01_1000_DumasLooted.Start()

; Signal the Space Quest that it can shut down
COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;SetObjectiveDisplayed(1150)

; Let the Cache's Map Marker work
Alias_CacheMapMarker.GetRef().Enable()

;enable computer
Alias_CacheSecurity.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
; Move Lillian to the player - and get her package running
Actor aTarg = Alias_LillianHart.GetActorRef()
aTarg.MoveTo(Game.GetPlayer())
aTarg.EvaluatePackage()

; This stage is used for Lillian to follow the player
COM_SamCoeQ01_1150_LillianRepeatsMission.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
; If the player hasn't done the optional objective - skit ip
;if ( !IsObjectiveCompleted(1150) )
;   SetObjectiveSkipped(1150)
;endif
SetObjectiveDisplayed(1200)

; Pop up a message box
;SamCoe_AlarmMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
;Valerie Dead - add slate to her corpse
Alias_ValerieMosquera.GetActorRef().AddItem(Alias_ValerieSlate.GetRef())

;REDACTED Add Valerie to the second wave RefCollection
;Alias_SecondWaveEnemies.AddRef(Alias_ValerieMosquera.GetRef())
; TODO - Make a ship come in and drop off Syndicate goons
;Alias_SecondWaveEnemies.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1500)

;"release" Cora
COM_Cora_FollowingAllowed.SetValue(0)
Alias_CoraCoe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1575_Item_00
Function Fragment_Stage_1575_Item_00()
;BEGIN CODE
; This keyword makes it so Sam won't be in his follower package any more
Actor aTarg =Alias_SamCoe.GetActorRef()
aTarg.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Remove blocking keyword for Sam
Actor aTarg =Alias_SamCoe.GetActorRef()
aTarg.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)

; Then end the quest
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as CompanionActorScript, LockedIn = false)

;New Game Plus Support
Game.GetPlayer().SetValue(COM_Quest_SamCoe_Q01_Complete_AV, 1)

;tell the Companion quest that the personal quest is finished
(Alias_SamCoe.GetActorReference() as CompanionActorScript).COM_CompanionQuest.FinishedPersonalQuest()

;Cooldown on SE_Player_FAB07 to prevent it from spinning up too soon
float currentGameTime = Utility.GetCurrentGameTime()
SE_Player_FAB07_Timestamp.SetValue(currentGameTime + cooldownDays)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property COM_SamCoeQ01_0310_SamStallsForTime Auto Const Mandatory

ReferenceAlias Property Alias_JaylenPryce Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

Scene Property COM_SamCoeQ01_0311_SamStallsEnds Auto Const Mandatory

Scene Property COM_SamCoeQ01_0510_ArrivedOutsideCI Auto Const Mandatory

Scene Property COM_SamCoeQ01_0520_CIDoorScene Auto Const Mandatory

Scene Property COM_SamCoeQ01_0600_MurderScene Auto Const Mandatory

ReferenceAlias Property Alias_CI_Door Auto Const Mandatory

Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const Mandatory

GlobalVariable Property COM_SamCoeRecruited Auto Const Mandatory

Scene Property COM_SamCoeQ01_0920_DumasHailed Auto Const Mandatory

Scene Property COM_SamCoeQ01_1000_DumasLooted Auto Const Mandatory

ReferenceAlias Property Alias_DebugMarker Auto Const Mandatory

RefCollectionAlias Property Alias_FirstWaveEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_SecondWaveEnemies Auto Const Mandatory

ReferenceAlias Property Alias_ValerieMosquera Auto Const Mandatory

GlobalVariable Property COM_PlayerMet_LilianHart Auto Const Mandatory

ObjectReference Property LC123LandingREF Auto Const Mandatory

Scene Property COM_SamCoeQ01_0875_LillianCoraReunion Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01_SpaceEnc Auto Const Mandatory

SQ_CompanionsScript Property SQ_Companions Auto Const Mandatory

ObjectReference Property COM_SC_CacheEntranceREF Auto Const Mandatory

ReferenceAlias Property Alias_LillianHart Auto Const Mandatory

ReferenceAlias Property Alias_LillianTempNonHostile Auto Const Mandatory

Scene Property COM_SamCoeQ01_0825_LillianShedsCover Auto Const Mandatory

ActorValue Property COM_StoryGatesCompleted Auto Const Mandatory

GlobalVariable Property COM_StoryGate_AffinityRequired_07_Standard Auto Const Mandatory

ActorValue Property COM_Affinity Auto Const Mandatory

ActorValue Property COM_CurrentStoryGateTimerExpired Auto Const Mandatory

ActorValue Property COM_TEMP_OnPlayerShip Auto Const Mandatory

ActorValue Property COM_Quest_SamCoe_CoraState Auto Const Mandatory

ReferenceAlias Property Alias_CI_Clue Auto Const Mandatory

Scene Property COM_SamCoeQ01_1150_LillianRepeatsMission Auto Const Mandatory

ReferenceAlias Property Alias_CacheMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_VictorMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_LillianSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_CoraSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipModule Auto Const Mandatory

Outfit Property Outfit_FreestarRanger Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

ReferenceAlias Property Alias_VictorCompoundPapers Auto Const Mandatory

ActorValue Property COM_Quest_SamCoe_JaylenBusy Auto Const Mandatory

Keyword Property LinkCustom04 Auto Const Mandatory

Message Property SamCoe_AlarmMessage Auto Const Mandatory

Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const Mandatory

ReferenceAlias Property Alias_CacheSecurity Auto Const Mandatory

ActorValue Property COM_Quest_SamCoe_Q01_Complete_AV Auto Const Mandatory

ObjectReference Property COM_SCQ01_ApartmentOverrideMarker Auto Const Mandatory

Cell Property CityNeonSamCoeCIApartment Auto Const Mandatory

ReferenceAlias Property Alias_VictorCompoundFinalAmbush Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const

ReferenceAlias Property Alias_ElevatorManagerApartment Auto Const Mandatory

GlobalVariable Property COM_Cora_FollowingAllowed Auto Const Mandatory

ReferenceAlias Property Alias_ValerieSlate Auto Const Mandatory

Activator Property COM_PQ_TxtReplace_QuestName_SamCoe Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

GlobalVariable Property SE_Player_FAB07_Timestamp Auto Const Mandatory

GlobalVariable Property SamCoe_Q01_JaylenPrice_BlockedByFC04 Auto Const Mandatory

Quest Property FC04 Auto Const Mandatory
