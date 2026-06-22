;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC01_SimShipTerminal_Di_0003D5F3 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
UC01_ShipSim_Debug_InifinitePerks.SetValue(1)
UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(1)
(UC01_ShipSimQuest as UC01_ShipSimulationQuestScript).ApplyShipPerk(UC01_DebugBuff_Shields)
UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(1)
(UC01_ShipSimQuest as UC01_ShipSimulationQuestScript).ApplyShipPerk(UC01_DebugBuff_Weapons)
(UC01_ShipSimQuest as UC01_ShipSimulationQuestScript).TriggerUpgradeScene()

if UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
  UC01.SetStage(425)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
UC01_ShipSim_Debug_AllySpawned_Debug.SetValue(1)
(UC01_ShipSimQuest as UC01_ShipSimulationQuestScript).SpawnPlayerAlly(UC01_Navy_Cruiser_C_Stroud_Vindicator01_PlayerAlly)
(UC01_ShipSimQuest as UC01_ShipSimulationQuestScript).TriggerUpgradeScene()

if UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630)
  UC01.SetStage(425)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Debug Auto Const Mandatory

Quest Property UC01_ShipSimQuest Auto Const Mandatory

SpaceshipBase Property UC01_Navy_Cruiser_C_Stroud_Vindicator01_PlayerAlly Auto Const

GlobalVariable Property UC01_ShipSim_Debug_InifinitePerks Auto Const Mandatory

Scene Property UC01_ShipSimQuest_400e_DebugAlly Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const Mandatory

Perk Property UC01_DebugBuff_Shields Auto Const Mandatory

Perk Property UC01_DebugBuff_Weapons Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory
