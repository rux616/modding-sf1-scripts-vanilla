;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC01_SimShipTerminal_Di_0003D5E7 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(1)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).ApplyShipPerk(UC01_DebugBuff_Shields)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).TriggerUpgradeScene()

if UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
  UC01.SetStage(420)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(1)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).ApplyShipPerk(UC01_DebugBuff_Weapons)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).TriggerUpgradeScene()

if UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
  UC01.SetStage(420)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
UC01_ShipSim_AllySpawned_Basic.SetValue(1)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).SpawnPlayerAlly(UC01_LvlShip_UC_A_Fighter_PossibleAlly01)
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).TriggerUpgradeScene()

if UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
  UC01.SetStage(420)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC01_ShipSimulatorHelperQuest Auto Const Mandatory

SpaceshipBase Property UC01_LvlShip_UC_A_Fighter_PossibleAlly01 Auto Const

GlobalVariable Property UC01_ShipSim_AllySpawned_Basic Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const Mandatory

Perk Property UC01_DebugBuff_Weapons Auto Const Mandatory

Perk Property UC01_DebugBuff_Shields Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const Mandatory

Scene Property UC01_ShipSimQuest_400b_ShieldsIncreased Auto Const Mandatory

Scene Property UC01_ShipSimQuest_400c_ShipDamageIncreased Auto Const Mandatory

Scene Property UC01_ShipSimQuest_400d_Ally Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory
