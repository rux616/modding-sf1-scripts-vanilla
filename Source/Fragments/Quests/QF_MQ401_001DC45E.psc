;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401_001DC45E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;make sure other quests have started
MQ402.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef()
(ArmillaryREF as ArmillaryScript).MQ101ArmillaryComesTogether()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;only start the Lodge scene if we're not in a variant that still has this quest running
If MQ401_VariantCurrent.GetValueInt() == 0
  MQ401_001_LodgeIntro.Start()
EndIf

MQ101.SetObjectiveCompleted(180)
MQ101.SetObjectiveDisplayed(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE mq401questscript
Quest __temp = self as Quest
mq401questscript kmyQuest = __temp as mq401questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckChargenMenu()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
MQ401_002_AfterFaceGen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ101.SetStage(1800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
MQ101.CompleteAllObjectives()

PlayerREF.AddtoFaction(ConstellationFaction)
PlayerREF.additem(LodgeKey)
;make sure player can board the Eye
PlayerREF.addtoFaction(EyeBoardingFaction)

MQ401_SkipMQ.SetValueInt(1)

MQ101.SetStage(2100)

MQ402.SetStage(10)

CREW_EliteCrew_Vasco.SetStage(1)

COM_Companion_SamCoe_CoraCoe_Handler.Start()

if PlayerRef.HasPerk(Trait_KidStuff)
  TraitKidStuff.SetStageNoWait(25)
endif

; If the player has the Starter Home trait, queue up the quest
If PlayerRef.HasPerk(Trait_StarterHome)
  TraitStarterHome.SetStageNoWait(100)
Else
  TraitStarterHome.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SarahMorganREF)
(SarahMorganRef as CompanionActorScript).AllowStoryGatesAndRestartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

SarahMorganREF.SetValue(COM_NoRelationshipPostUnity, 1)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SarahMorganREF)
SarahMorganRef.RemoveKeyword(COM_PreventStoryGateScenes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()

(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(AndrejaREF)
(AndrejaREF as CompanionActorScript).AllowStoryGatesAndRestartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()

AndrejaREF.SetValue(COM_NoRelationshipPostUnity, 1)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(AndrejaREF)
AndrejaRef.RemoveKeyword(COM_PreventStoryGateScenes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()

(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(BarrettREF)
(BarrettREF as CompanionActorScript).AllowStoryGatesAndRestartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()

BarrettREF.SetValue(COM_NoRelationshipPostUnity, 1)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(BarrettREF)
BarrettREF.RemoveKeyword(COM_PreventStoryGateScenes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Actor SamCoeREF = Alias_SamCoe.GetActorRef()

(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SamCoeREF)
(SamCoeREF as CompanionActorScript).AllowStoryGatesAndRestartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
Actor SamCoeREF = Alias_SamCoe.GetActorRef()

SamCoeREF.SetValue(COM_NoRelationshipPostUnity, 1)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SamCoeREF)
SamCoeREF.RemoveKeyword(COM_PreventStoryGateScenes)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ401_002_AfterFaceGen Auto Const Mandatory

Scene Property MQ401_001_LodgeIntro Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ402 Auto Const Mandatory

GlobalVariable Property MQ401_VariantCurrent Auto Const Mandatory

ActorValue Property PlayerUnityTimesEntered Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory

Key Property LodgeKey Auto Const Mandatory

GlobalVariable Property MQ401_SkipMQ Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArmillary Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ActorValue Property COM_NoRelationshipPostUnity Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

Quest Property CREW_EliteCrew_Vasco Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

Keyword Property COM_PreventStoryGateScenes Auto Const Mandatory

Quest Property COM_Companion_SamCoe_CoraCoe_Handler Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
