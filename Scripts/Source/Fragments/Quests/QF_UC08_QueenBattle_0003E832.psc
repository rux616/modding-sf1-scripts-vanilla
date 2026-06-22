;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC08_QueenBattle_0003E832 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE UC08_QueenBattle_QuestScript
Quest __temp = self as Quest
UC08_QueenBattle_QuestScript kmyQuest = __temp as UC08_QueenBattle_QuestScript
;END AUTOCAST
;BEGIN CODE
ObjectReference StrongREF = Alias_SignalMarkerStrong.GetRef()
Alias_ActiveSignalMarker.ForceRefTo(StrongREF)
StrongREF.Enable()

;Imply the Anomaly's pulling the thralls back at the Aceles plant away
;so turn all those critters off now
kmyquest.CleanUpPlantThralls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE UC08_QueenBattle_QuestScript
Quest __temp = self as Quest
UC08_QueenBattle_QuestScript kmyQuest = __temp as UC08_QueenBattle_QuestScript
;END AUTOCAST
;BEGIN CODE
;First wave turned on
DefaultRefAmbushTrigger2 WaveOneRef = Alias_WaveOneAmbushTrigger.GetRef() as DefaultRefAmbushTrigger2
WaveOneRef.Enable()
Alias_ThrallWaveOne.EnableAll()
WaveOneRef.TriggerAmbush()

;Tower ambushes turned on
Alias_TowerAmbushes.EnableAll()
kmyquest.StartSignalIntroTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
if !GetStageDone(900)
  UC08_QueenBattle_Percival_SignalIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
if !GetStageDone(900)
  UC08.SetStage(526)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
(Alias_ThrallWaveTwo as UC08_AB_HostileThrallCollScript).TriggerWave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE UC08_QueenBattle_QuestScript
Quest __temp = self as Quest
UC08_QueenBattle_QuestScript kmyQuest = __temp as UC08_QueenBattle_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_ActiveSignalMarker.GetReF().Disable()

kmyquest.RemoveMindControlSpell()

UC08_QueenBattle_Percival_SignalIntro.Stop()
UC08_QueenBattle_PercivalHad_FirstSwitch.Stop()
UC08_QueenBattle_PercivalHad_SecondSwitch.Stop()
UC08_QueenBattle_PercivalHad_ThirdSwitch.Stop()

if !GetStageDone(531)
  UC08_QueenBattle_Hadrian_WrapUp.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_ThrallWaveOne Auto Const Mandatory

RefCollectionAlias Property Alias_ThrallWaveTwo Auto Const Mandatory

Scene Property UC08_QueenBattle_Percival_SignalIntro Auto Const Mandatory

Scene Property UC08_QueenBattle_Percival_EnemiesInbound Auto Const Mandatory

Quest Property UC08 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Queen Auto Const Mandatory

Scene Property UC08_QueenBattle_Hadrian_WrapUp Auto Const Mandatory

RefCollectionAlias Property Alias_TowerAmbushes Auto Const Mandatory

ReferenceAlias Property Alias_ActiveSignalMarker Auto Const Mandatory

ReferenceAlias Property Alias_SignalMarkerStrong Auto Const Mandatory

ReferenceAlias Property Alias_WaveOneAmbushTrigger Auto Const Mandatory

Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const Mandatory

Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const Mandatory

Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const Mandatory

RefCollectionAlias Property Alias_AcelesPlantThralls Auto Const Mandatory
