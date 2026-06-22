;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UCR01_001EBDD5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(Alias_DebugTarget.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;See if it's going to be a 1 or 2 morph affair
if Utility.RandomFloat(0.0, 100.0) <= UCR01_ExtraMorphChance.GetValue()
  Actor ExREF = Alias_ExtraMorph.GetActorRef()
  ExREF.SetValue(DMP_ReleaseHoldPosition, 1.0)
  Alias_AllMorphs.AddRef(ExREF)
  Alias_TerrormorphFriendCollection.AddRef(ExRef)
  ExRef.Enable()
  SetStage(105)
endif

;See if we're going to have an Aceles show up
if UC09_PlayerChoiceResult.GetValue() == 1 && UCR01_TimesCompleted.GetValue() >= 1 && (Utility.RandomFloat(0.0, 100.0) <= UCR01_AcelesChance.GetValue())
  SetStage(110)
endif

Actor SuperREF = Alias_TerrormorphSuperBug.GetActorRef()
Alias_TerrormorphFriendCollection.AddRef(SuperRef)
Alias_AllMorphs.AddRef(SuperREF)
SuperRef.SetValue(DMP_ReleaseHoldPosition, 1.0)
SuperRef.Enable()
SetObjectiveDisplayed(100)

;If we're starting up a UC radiant quest for the first time, close out Tuala's 
; intro scene
if !DialogueUCFaction.GetStageDone(550)
  DialogueUCFaction.SetStage(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Aceles.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Alias_TerrormorphFriendCollection.RemoveAll()

;If we've got an Aceles, make him an enemy of the Morphs
if GetStageDone(110)
  Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_TerrormorphFriendCollection.RemoveAll()

;If we've got an Aceles, make him an enemy of the Morphs
if GetStageDone(110)
  Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(110)

Alias_Terrormorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor ACRef = Alias_Aceles.GetActorRef()
ACRef.IgnoreFriendlyHits()
ACRef.EvaluatePackage()

SetStage(125)
Alias_Terrormorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
UCR01_TimesCompleted.SetValue(UCR01_TimesCompleted.GetValue() + 1.0)
CompleteAllObjectives()

;Have the Marine Officer say a farewell line
Actor MarineOffACT = Alias_MarineOfficer.GetActorRef()
if !MarineOffACT.IsDisabled()

  ;Get the TM to hold still
  Actor TMRef = Alias_Terrormorph.GetActorRef()
  TMRef.SetValue(UCR01_QuestComplete, 1.0)
  TMRef.EvaluatePackage()

  Utility.Wait(2.0)

  Alias_MarineOfficer.GetActorRef().StopCombatAlarm()
  Alias_Marine.GetActorRef().StopCombatAlarm()
  Alias_Aceles.GetActorRef().StopCombatAlarm()

  if GetStageDone(175)
    MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_Losses)
  else
    MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_NoLosses)
  endif
endif

Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DebugTarget Auto Const Mandatory

GlobalVariable Property UC09_PlayerChoiceResult Auto Const Mandatory

GlobalVariable Property UCR01_TimesCompleted Auto Const Mandatory

ReferenceAlias Property Alias_MarineOfficer Auto Const Mandatory

ReferenceAlias Property Alias_Marine Auto Const Mandatory

ReferenceAlias Property Alias_Aceles Auto Const Mandatory

ReferenceAlias Property Alias_TerrorMorph Auto Const Mandatory

ReferenceAlias Property Alias_TerrorMorphSuperBug Auto Const Mandatory

Quest Property UC09 Auto Const Mandatory

Quest Property DialogueUCNewAtlantisUCFaction Auto Const Mandatory

Faction Property UCR01_AcelesTeamEnemy Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphEssential Auto Const Mandatory

Quest Property DialogueUCFaction Auto Const Mandatory

Topic Property UCR01_MarineOfficer_QuestComplete_Losses Auto Const Mandatory

Topic Property UCR01_MarineOfficer_QuestComplete_NoLosses Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphFriendFaction Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

ActorValue Property UCR01_QuestComplete Auto Const Mandatory

GlobalVariable Property UCR01_AcelesChance Auto Const Mandatory

GlobalVariable Property UCR01_ExtraMorphChance Auto Const Mandatory

ReferenceAlias Property Alias_ExtraMorph Auto Const Mandatory

RefCollectionAlias Property Alias_AllMorphs Auto Const Mandatory

RefCollectionAlias Property Alias_TerrormorphFriendCollection Auto Const Mandatory

ActorValue Property DMP_ReleaseHoldPosition Auto Const Mandatory
