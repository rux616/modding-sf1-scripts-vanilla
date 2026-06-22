;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Companion_Barrett_001C7187 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_Barrett.GetActorRef().SetValue(COM_Affinity, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
COM_Barrett_QuestEvent_FrontierDestroyed.Send()
Alias_BarrettShip.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_01
Function Fragment_Stage_0003_Item_01()
;BEGIN CODE
COM_Barrett_QuestEvent_FrontierDestroyed_Like.Send()
Alias_BarrettShip.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_03_Large)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_01
Function Fragment_Stage_0019_Item_01()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_02_Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_02
Function Fragment_Stage_0019_Item_02()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_01_Small)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Com_Quest_Barrett_Q01.SetStage(8301)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0069_Item_00
Function Fragment_Stage_0069_Item_00()
;BEGIN AUTOCAST TYPE COM_Barrett_EpilogueTimerScript
Quest __temp = self as Quest
COM_Barrett_EpilogueTimerScript kmyQuest = __temp as COM_Barrett_EpilogueTimerScript
;END AUTOCAST
;BEGIN CODE
COM_Quest_Barrett_Q01.SetStage(7401)
kmyQuest.StartCooldownTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN CODE
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0114_Item_00
Function Fragment_Stage_0114_Item_00()
;BEGIN CODE
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(Alias_Barrett.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0208_Item_00
Function Fragment_Stage_0208_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
COM_Quest_Barrett_Q02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
SetStage(216)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0216_Item_00
Function Fragment_Stage_0216_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, MediumCredits.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
If !GetStageDone(211)
   SetStage(21)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetStage(390)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0421_Item_00
Function Fragment_Stage_0421_Item_00()
;BEGIN CODE
SetStage(26)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, LargeCredits.GetValue() as Int)

SetStage(27)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
SetStage(390)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
SetStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetStage(540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
SetStage(540)

;Set stage 6-15
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetStage(540)
SetStage(560)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
SetStage(560)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(690)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0731_Item_00
Function Fragment_Stage_0731_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.StoryGateSceneCompleted()
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0732_Item_00
Function Fragment_Stage_0732_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
SetStage(750)
COM_Quest_Barrett_Q01.SetStage(7401)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
SetStage(690)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE COM_Barrett_EpilogueTimerScript
Quest __temp = self as Quest
COM_Barrett_EpilogueTimerScript kmyQuest = __temp as COM_Barrett_EpilogueTimerScript
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Float TimesRomanced = PlayerREF.GetValue(AV_TimesRomanced)

SetStage(740)
If GetStageDone(732)
   TimesRomanced = TimesRomanced + 1
   PlayerREF.SetValue(AV_TimesRomanced, TimesRomanced)
EndIf

kmyQuest.StartCooldownTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetStage(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0831_Item_00
Function Fragment_Stage_0831_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommitmentDesired()
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0832_Item_00
Function Fragment_Stage_0832_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommitmentDesired()
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
SetStage(740)
kmyquest.CommitmentDesired()

kmyquest.StartCommitmentQuest()

kmyquest.StoryGateSceneCompleted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
SetStage(840)
SetStage(870)

If GetStageDone(832)
   COM_Quest_Barrett_Commitment.SetStage(52)  ;Ellie officiates
Else
   COM_Quest_Barrett_Commitment.SetStage(51)  ;Vasco officiates
EndIf 

; Begin Quest
COM_Quest_Barrett_Commitment.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeNotRomantic()
kmyQuest.MakeNotCommitted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Float TimesMarried = PlayerREF.GetValue(AV_TimesMarried)

TimesMarried = TimesMarried + 1
PlayerREF.SetValue(AV_TimesMarried, TimesMarried)

kmyQuest.MakeCommitted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Generic Quest Variables
Quest Property SQ_Companions Auto Const Mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const Mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const Mandatory

; Credits
MiscObject Property Credits Auto Const Mandatory
GlobalVariable Property SmallCredits Auto Const Mandatory
GlobalVariable Property MediumCredits Auto Const Mandatory
GlobalVariable Property LargeCredits Auto Const Mandatory

; References
ReferenceAlias Property Alias_Barrett Auto Const Mandatory
ObjectReference Property Frontier_ModularREF Auto Const Mandatory

; Actor Values
ActorValue Property OnPlayerShip Auto Const Mandatory
ActorValue Property AV_TimesRomanced Auto Const Mandatory

ActorValue Property AV_TimesMarried Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q02 Auto Const Mandatory

Message Property BQ02_PQ_AdvancingQuestWarning Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Faction_01_Small Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Faction_02_Medium Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Faction_03_Large Auto Const Mandatory

GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const Mandatory

GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const Mandatory

GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const Mandatory

ActorValue Property COM_StoryGatesCompleted Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup Auto Const Mandatory

ActorValue Property COM_Affinity Auto Const Mandatory

AffinityEvent Property COM_Barrett_QuestEvent_FrontierDestroyed Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShip Auto Const Mandatory

AffinityEvent Property COM_Barrett_QuestEvent_FrontierDestroyed_Like Auto Const Mandatory

Perk Property Crew_Ship_Weapons_ParticleBeam Auto Const Mandatory

Perk Property Crew_Robotics Auto Const Mandatory

Perk Property CREW_Ship_StarshipEngineering Auto Const Mandatory
