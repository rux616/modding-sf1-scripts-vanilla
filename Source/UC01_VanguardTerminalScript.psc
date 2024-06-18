Scriptname UC01_VanguardTerminalScript extends TerminalMenu Const

GlobalVariable Property UC01_UCCrimeGold_VanguardTerminal Auto Const Mandatory
Faction Property CrimeFactionUC Mandatory Const Auto
ReferenceAlias Property PlayerShip Mandatory Const Auto

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    UC01_UCCrimeGold_VanguardTerminal.SetValue(CrimeFactionUC.GetCrimeGold())
    akTerminalRef.AddTextReplacementValue("CrimeGold", UC01_UCCrimeGold_VanguardTerminal.GetValueInt())
    akTerminalRef.AddTextReplacementData("PlayerName", Game.GetPlayer())
    akTerminalRef.AddTextReplacementData("ShipName", PlayerShip.GetRef())
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction