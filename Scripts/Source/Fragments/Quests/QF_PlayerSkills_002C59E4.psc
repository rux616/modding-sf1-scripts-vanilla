;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PlayerSkills_002C59E4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
; set AV to bank autoattempts to 2
Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
;setting prior stage as failsafe
SetStage(201)

Actor player = Game.GetPlayer()
player.SetValue(SecurityMenuRingHighlightingEnabled, 1)
; set AV to bank autoattempts to 3
player.SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
;setting prior stage as failsafe
SetStage(202)

Actor player = Game.GetPlayer()

; set AV to bank autoattempts to 4
player.SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
;Setting prior stage as failsafe
SetStage(203)

Actor player = Game.GetPlayer()
player.SetValue(SecurityMenuAutoattemptPointsMultiplier, 2) ; or, we could ramp up to this on all ranks
player.SetValue(SecurityMenuDisableUnusedKeysOptionEnabled, 1)
; set AV to bank autoattempts to 5
player.SetValue(SecurityMenuMaxAutoattemptPoints, (Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,WellnessBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,WellnessBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0303_Item_00
Function Fragment_Stage_0303_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,WellnessBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0304_Item_00
Function Fragment_Stage_0304_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,WellnessBonus*2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(BotanyRank, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(BotanyRank, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(BotanyRank, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(BotanyRank, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
; NOTE - additional common and uncommon harvesting now handled by the flora LL
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0502_Item_00
Function Fragment_Stage_0502_Item_00()
;BEGIN CODE
; NOTE - additional rare harvesting now handled by the flora LL
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN CODE
; NOTE - additional exotic harvesting now handled by the flora LL
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(ScanningPowerLevel,1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0602_Item_00
Function Fragment_Stage_0602_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(ScanningPowerLevel,2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0603_Item_00
Function Fragment_Stage_0603_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(ScanningPowerLevel,3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0604_Item_00
Function Fragment_Stage_0604_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(ScanningPowerLevel,4.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
Outpost_BuildLimit_CargoLinks.Mod(OutpostManagementCargoLinksBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0702_Item_00
Function Fragment_Stage_0702_Item_00()
;BEGIN CODE
Outpost_BuildLimit_Robots.Mod(OutpostManagementBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_00
Function Fragment_Stage_0703_Item_00()
;BEGIN CODE
Outpost_BuildLimit_CrewStations.Mod(OutpostManagementBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(ZoologyRank, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(ZoologyRank, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0803_Item_00
Function Fragment_Stage_0803_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(ZoologyRank, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0804_Item_00
Function Fragment_Stage_0804_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(ZoologyRank, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(OutpostMaxDeployed,12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0902_Item_00
Function Fragment_Stage_0902_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(OutpostMaxDeployed,16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0903_Item_00
Function Fragment_Stage_0903_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(OutpostMaxDeployed,20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0904_Item_00
Function Fragment_Stage_0904_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(OutpostMaxDeployed,24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(GalaxyBodyScanAbility,1.0)
Skill_Astrophysics_DiscoverTraitChance.SetValueInt(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1102_Item_00
Function Fragment_Stage_1102_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(GalaxyBodyScanAbility, 2.0)
Skill_Astrophysics_DiscoverTraitChance.SetValueInt(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1103_Item_00
Function Fragment_Stage_1103_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0)
Skill_Astrophysics_DiscoverTraitChance.SetValueInt(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1104_Item_00
Function Fragment_Stage_1104_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0) ; deliberately the same as rank 3 - just in case this gets set by itself
Skill_Astrophysics_DiscoverTraitChance.SetValueInt(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1201_Item_00
Function Fragment_Stage_1201_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(SurveyingPowerLevel, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1202_Item_00
Function Fragment_Stage_1202_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(SurveyingPowerLevel, 2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1203_Item_00
Function Fragment_Stage_1203_Item_00()
;BEGIN CODE
Actor playerRef = game.GetPlayer()
playerRef.SetValue(SurveyingPowerLevel, 3.0)
playerRef.SetValue(SurveyingTraitBonus, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1204_Item_00
Function Fragment_Stage_1204_Item_00()
;BEGIN CODE
Actor playerRef = game.GetPlayer()
playerRef.SetValue(SurveyingPowerLevel, 4.0)
playerRef.SetValue(SurveyingTraitBonus, 2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1302_Item_00
Function Fragment_Stage_1302_Item_00()
;BEGIN CODE
float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue()
float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue()
float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue()
float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue()
float costMult = 0.75

SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive*costMult) as int)
SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive*costMult) as int)
SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap*costMult) as int)
SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap*costMult) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1303_Item_00
Function Fragment_Stage_1303_Item_00()
;BEGIN CODE
float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue()
float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue()
float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue()
float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue()
float costMult = 0.5

SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive*costMult) as int)
SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive*costMult) as int)
SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap*costMult) as int)
SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap*costMult) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1401_Item_00
Function Fragment_Stage_1401_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(PayloadLevel,1.0)

float piracyLow = Ships_Piracy_Low_Base.GetValue()
float piracyHigh = Ships_Piracy_High_Base.GetValue()

; 10% better chance on both sides
float piracyMult = 1.1

float piracyLowNew = piracyLow * piracyMult  ; makes them surrender at higher strength
Ships_Piracy_Low.SetValue(piracyLowNew)

float piracyHighNew = piracyHigh * piracyMult  ; makes them need to be stronger to refuse speech challenge
Ships_Piracy_High.SetValue(piracyHighNew)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1402_Item_00
Function Fragment_Stage_1402_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(PayloadLevel, 2.0)

float piracyLow = Ships_Piracy_Low_Base.GetValue()
float piracyHigh = Ships_Piracy_High_Base.GetValue()

; 20% better chance on both sides
float piracyMult = 1.2

float piracyLowNew = piracyLow * piracyMult  ; makes them surrender at higher strength
Ships_Piracy_Low.SetValue(piracyLowNew)

float piracyHighNew = piracyHigh * piracyMult  ; makes them need to be stronger to refuse speech challenge
Ships_Piracy_High.SetValue(piracyHighNew)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1403_Item_00
Function Fragment_Stage_1403_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(PayloadLevel, 3.0)

float piracyLow = Ships_Piracy_Low_Base.GetValue()
float piracyHigh = Ships_Piracy_High_Base.GetValue()

; 30% better chance on both sides
float piracyMult = 1.3

float piracyLowNew = piracyLow * piracyMult  ; makes them surrender at higher strength
Ships_Piracy_Low.SetValue(piracyLowNew)

float piracyHighNew = piracyHigh * piracyMult  ; makes them need to be stronger to refuse speech challenge
Ships_Piracy_High.SetValue(piracyHighNew)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1404_Item_00
Function Fragment_Stage_1404_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(PayloadLevel, 4.0)

float piracyLow = Ships_Piracy_Low_Base.GetValue()
float piracyHigh = Ships_Piracy_High_Base.GetValue()

; 50% better chance on both sides
float piracyMult = 1.5

float piracyLowNew = piracyLow * piracyMult  ; makes them surrender at higher strength
Ships_Piracy_Low.SetValue(piracyLowNew)

float piracyHighNew = piracyHigh * piracyMult  ; makes them need to be stronger to refuse speech challenge
Ships_Piracy_High.SetValue(piracyHighNew)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Health Auto Const Mandatory

ActorValue Property CarryWeight Auto Const Mandatory

ActorValue Property Oxygen Auto Const Mandatory

Int Property WellnessBonus Auto Const Mandatory

Int Property FitnessBonus Auto Const Mandatory

Int Property WeightLiftingBonus Auto Const Mandatory

Int Property BotanyBonus Auto Const Mandatory

Int Property GeologyBonus Auto Const Mandatory

ActorValue Property ScanningPowerLevel Auto Const Mandatory

ActorValue Property ZoologyRank Auto Const Mandatory

ActorValue Property BotanyRank Auto Const Mandatory

GlobalVariable Property Outpost_BuildLimit_CrewStations Auto Const

Int Property OutpostManagementBonus = 1 Auto Const

GlobalVariable Property Outpost_BuildLimit_CargoLinks Auto Const

Int Property OutpostManagementCargoLinksBonus Auto Const

ActorValue Property OutpostMaxDeployed Auto Const

Int Property OutpostMaxDeployedBonus = 20 Auto Const

ActorValue Property PayloadLevel Auto Const

ActorValue Property SecurityMenuRingHighlightingEnabled Auto Const Mandatory

ActorValue Property SecurityMenuDisableUnusedKeysOptionEnabled Auto Const Mandatory

ActorValue Property SecurityMenuAutoattemptPointsMultiplier Auto Const Mandatory

ActorValue Property SecurityMenuMaxAutoattemptPoints Auto Const Mandatory

GlobalVariable Property Outpost_BuildLimit_Robots Auto Const

ActorValue Property GalaxyBodyScanAbility Auto Const Mandatory

ActorValue Property SurveyingPowerLevel Auto Const Mandatory

ActorValue Property SurveyingTraitBonus Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeHighImportance_Cheap Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeHighImportance_Expensive Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeLowImportance_Cheap Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeLowImportance_Expensive Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeHighImportance_CheapBase Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeHighImportance_ExpensiveBase Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeLowImportance_CheapBase Auto Const Mandatory

GlobalVariable Property SpeechChallengeBribeLowImportance_ExpensiveBase Auto Const Mandatory

GlobalVariable Property FloraPlantRareMin Auto Const Mandatory

GlobalVariable Property FloraMineralRareMin Auto Const Mandatory

GlobalVariable Property Ships_Piracy_Low Auto Const Mandatory

GlobalVariable Property Ships_Piracy_High Auto Const Mandatory

GlobalVariable Property Ships_Piracy_High_Base Auto Const Mandatory

GlobalVariable Property Ships_Piracy_Low_Base Auto Const Mandatory

GlobalVariable Property Skill_Astrophysics_DiscoverTraitChance Auto Const Mandatory
