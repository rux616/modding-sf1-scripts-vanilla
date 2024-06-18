;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC09_001FC858 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(19)

Game.GetPlayer().MoveTo(UC09_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)

Game.GetPlayer().MoveTo(UC09_DebugMarker02)

SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)

Game.GetPlayer().MoveTo(UC09_DebugMarker03)

SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(310)
UC09_300_CabinetMainScene.Stop()
UC01.SetStage(100)
UC01.SetStage(1000)

Game.GetPlayer().MoveTo(UC09_DebugMarker04)
Alias_Hadrian.GetRef().MoveTo(UC09_DebugMarker04)
UC02.Stop()
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Alias_Hadrian.GetRef().Enable()
Actor PlayACT = Game.GetPlayer()
PlayACT.AddPerk(BackgroundDiplomat)
PlayACT.AddPerk(BackgroundIndustrialist)
PlayACT.AddPerk(TraitEmpath)
PlayACT.AddPerk(BackgroundXenobiologist)

;Get the player into subsection 7
Alias_VVDoor.GetRef().Unlock()
(Alias_SS7FloorManager.GetRef() as LoadElevatorFloorScript).SetAccessible(true)

;Plug in the emergency recorded into the quest alias
Game.GetPlayer().AddAliasedItem(UC08_VV_AudioLog, Alias_EmergencyRecording)

;Set up Hadrian to be ready to sandbox post-quest
UC05_HadrianSandboxing_PostUC05.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()

;Disable the NPCs that wander around the MAST conference room
Alias_NPCsToDisable.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
UC08_AnomalyBattle.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Also, we lock all the doors back on Londinion at this point
int Count = Alias_LondinionDoors.GetCount()
int i = 0

while i < Count
  ObjectReference currDoor = Alias_LondinionDoors.GetAt(i)
  currDoor.SetOpen(false)
  currDoor.Lock()

  i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN CODE
;Also get VV rotated to face the player if he hasn't already
SetStage(124)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
UCR05_Bonus.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0124_Item_00
Function Fragment_Stage_0124_Item_00()
;BEGIN CODE
Alias_VaeVictis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(UC09_Foreknowledge_VVCommittedTheAttacksAV, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
DialogueUCFactionNewAtlantis.SetStage(1011)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.SetOutfit(Outfit_Clothes_Colonist_CroppedVest_Hadrian, true)
HadACT.SetValue(ActorShouldShowSpacesuitCosmetic_AV, 0.0)
HadACT.SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 0.0)
Alias_Jakob.GetActorRef().SetOutfit(Outfit_Clothes_ScienceLabTec)
kmyquest.GetNPCsInPlace()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;Get Hadrian's ship turned back off
Alias_HadrianShip.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
UC_PlayerMentionedVVToHadrian.SetValue(1)
UC07_HadrianKnowsVVLives.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(229)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Alias_Hadrian.GetActorRef().EvaluatePackage()
Alias_Jakob.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
UC09_300_CabinetMainScene.Start()

;Turn on the "Continue Address" trigger so the player can get back in
Alias_ContinueAddressTrigger.GetRef().Enable()

;Bring back the NPCs that were turned off earlier
Alias_NPCsToDisable.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
UC09_HadsMad.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Used for Sarah Morgan's conversation with Logan
UC_LoganKnowsPlayerLearnedOfVaeVictis.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_EmergencyRecording.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
UC09_LazarusPlantResult.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0367_Item_00
Function Fragment_Stage_0367_Item_00()
;BEGIN CODE
UC09_LazarusPlantResult.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0369_Item_00
Function Fragment_Stage_0369_Item_00()
;BEGIN CODE
UC09_LazarusPlantResult.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0371_Item_00
Function Fragment_Stage_0371_Item_00()
;BEGIN CODE
UC09_LazarusPlantResult.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
UC09_DEBUG_AdditionalUC05Variations.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
;Turn off the "Continue Address" trigger
Alias_ContinueAddressTrigger.GetRef().Disable()

kmyquest.StaggeredEvalPackages()

;Set the right global for the post-quest gameplay
if GetStageDone(401)
  ;Player chose to kill with the microbe
  UC09_PlayerChoiceResult.SetValue(2)
  MQ305_UC_PlagueEnding.SetValue(1)
elseif GetStageDone(402)
  ;Player chose to sterilize with the microbe
  UC09_PlayerChoiceResult.SetValue(3)
  MQ305_UC_SterilizationEnding.SetValue(1)
else
  ;Player chose the Aceles
  UC09_PlayerChoiceResult.SetValue(1)
  MQ305_UC_AcelesEnding.SetValue(1)
endif

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;If the player ratted out VV, disable him and turn on the scene trigger for him
;Otherwise, turn on UCR05
if GetStageDone(320)
  Alias_VaeVictis.GetRef().Disable()
  Alias_PostQuestSlate.GetRef().Enable()
  Alias_VVCellDoor.GetRef().Unlock()
  Alias_SS7_CompanionWaitTrigger.GetRef().Disable()
else
  UCR05_Enabled.SetValue(1)
endif

;Start up Hadrian's post-quest scene
UC09_PostQuestline_HadrianScene.Start()

;Get the extra Marines turned on at FB441
Alias_FB441MarineEnableMarker.GetRef().Enable()

;Get the Red Devils HQ bustling
DialogueRedDevilsHQ.SetStage(30)

;Turn Hadrian's ship back on there
Alias_HadriansShip_RHQ.GetRef().Enable()

;Turn on the FC Observers if appropriate
if GetStageDone(367) || GetStageDone(371)
  DialogueRedDevilsHQ.SetStage(32)
  Alias_FCObserverEnableMarker.GetRef().Enable()
  UC09_TellFreestarAboutLazPlant.SetValue(1)
endif

;If the player decided to wipe out the Lazarus Plant, mark that here
if GetStageDone(369) || GetStageDone(371)
  UC09_CleanUpLazarusPlant.SetValue(1.0)
endif

;Kick off the misc objective to Tuala
DialogueUCNewAtlantisUCFaction.SetStage(500)

;Achievement Unlocked
Game.AddAchievement(13)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_UnitedColonies_Cooldown, cooldownTime) 
    i += 1
endwhile

COM_WantsToTalkEvent_UnitedColonies.Send()

;Make sure we removed the "Use Custom Follow" keyword from Hadrian
Actor HadACT = Alias_Hadrian.GetActorRef()

if HadACT.HasKeyword(SQ_Followers_UseFollowPlayerCustom)
  HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueUCNewAtlantisUCFaction Auto Const Mandatory

GlobalVariable Property UC09_PlayerChoiceResult Auto Const Mandatory

ObjectReference Property UC09_DebugMarker01 Auto Const Mandatory

ObjectReference Property UC09_DebugMarker02 Auto Const Mandatory

ObjectReference Property UC09_DebugMarker03 Auto Const Mandatory

ObjectReference Property UC09_DebugMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

Message Property UC09_DEBUG_ExpansionPoint Auto Const Mandatory

Message Property UC09_DEBUG_SpeechChallenge Auto Const Mandatory

ReferenceAlias Property Alias_Jakob Auto Const Mandatory

Scene Property UC09_300_CabinetMainScene Auto Const Mandatory

Message Property UC09_DEBUG_AdditionalUC05Variations Auto Const Mandatory

Message Property UC09_DEBUG_SpeakToTuala Auto Const Mandatory

GlobalVariable Property UC_PlayerMentionedVVToHadrian Auto Const Mandatory

GlobalVariable Property UC09_HadsMad Auto Const Mandatory

GlobalVariable Property UC09_CleanUpLazarusPlant Auto Const Mandatory

ReferenceAlias Property Alias_VaeVictis Auto Const Mandatory

ReferenceAlias Property Alias_FB441MarineEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_FCObserverEnableMarker Auto Const Mandatory

Quest Property UC09_PostQuestline_HadrianScene Auto Const Mandatory

GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const Mandatory

ReferenceAlias Property Alias_PostVVSceneTrigger Auto Const Mandatory

Perk Property BackgroundDiplomat Auto Const Mandatory

Perk Property TraitEmpath Auto Const Mandatory

Perk Property BackgroundIndustrialist Auto Const Mandatory

Perk Property BackgroundXenobiologist Auto Const Mandatory

GlobalVariable Property UCR05_Bonus Auto Const Mandatory

RefCollectionAlias Property Alias_LondinionDoors Auto Const Mandatory

ReferenceAlias Property Alias_ContinueAddressTrigger Auto Const Mandatory

GlobalVariable Property UC09_TellFreestarAboutLazPlant Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

GlobalVariable Property MQ305_UC_AcelesEnding Auto Const Mandatory

GlobalVariable Property MQ305_UC_PlagueEnding Auto Const Mandatory

GlobalVariable Property UC09_LazarusPlantResult Auto Const Mandatory

GlobalVariable Property UC_LoganKnowsPlayerLearnedOfVaeVictis Auto Const Mandatory

ActorValue Property UC09_Foreknowledge_VVCommittedTheAttacksAV Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShip Auto Const Mandatory

RefCollectionAlias Property Alias_NPCsToDisable Auto Const Mandatory

ReferenceAlias Property Alias_EmergencyRecording Auto Const Mandatory

GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const Mandatory

ReferenceAlias Property Alias_ChiefSarkin Auto Const Mandatory

ReferenceAlias Property Alias_Abello Auto Const Mandatory

ReferenceAlias Property Alias_ChiefYasin Auto Const Mandatory

ReferenceAlias Property Alias_ChiefKulkarni Auto Const Mandatory

ReferenceAlias Property Alias_AdmiralLogan Auto Const Mandatory

ReferenceAlias Property Alias_VVDoor Auto Const Mandatory

ReferenceAlias Property Alias_SS7FloorManager Auto Const Mandatory

Book Property UC08_VV_AudioLog Auto Const Mandatory

Quest Property DialogueUCFactionNewAtlantis Auto Const Mandatory

GlobalVariable Property UCR05_Enabled Auto Const Mandatory

ReferenceAlias Property Alias_PostQuestSlate Auto Const Mandatory

Quest Property UC08_QueenBattle Auto Const Mandatory

Quest Property UC08_AnomalyBattle Auto Const Mandatory

ReferenceAlias Property Alias_HadriansShip_RHQ Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory

ReferenceAlias Property Alias_VVCellDoor Auto Const Mandatory

ReferenceAlias Property Alias_SS7_CompanionWaitTrigger Auto Const Mandatory

Outfit Property Outfit_Clothes_Colonist_CroppedVest_Hadrian Auto Const Mandatory

Outfit Property Outfit_Clothes_ScienceLabTec Auto Const Mandatory

ActorValue Property ActorShouldShowSpacesuitCosmetic_AV Auto Const Mandatory

ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Auto Const Mandatory

GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_UnitedColonies Auto Const Mandatory

Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_UnitedColonies_Cooldown Auto Const Mandatory
