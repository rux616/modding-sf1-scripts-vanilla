Scriptname UC01_ShipSimAliasScript extends ReferenceAlias

GlobalVariable Property UC01_ShipSim_PlayerKillCount Mandatory Const Auto
{Player's kill count of enemies}

GlobalVariable Property UC01_ShipSim_MinKillsRequired Auto Const Mandatory
{Mint threshold for progression}

Scene Property UC01_ShipSimulatorHelperQuest_600_PlayerDefeated Mandatory Const Auto
{Scene to play once the player has been defeated}

Event OnEnterBleedout()
    Trace(self, "Ship entered Bleedout!")
    UC01_ShipSimulationQuestScript myInst = GetOwningQuest() as UC01_ShipSimulationQuestScript
    myInst.PauseSequence()
    UC01_ShipSimulatorHelperQuest_600_PlayerDefeated.Start()
EndEvent

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction