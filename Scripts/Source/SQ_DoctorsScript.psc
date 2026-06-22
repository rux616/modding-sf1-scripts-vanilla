Scriptname SQ_DoctorsScript extends Quest

Group Autofill
	ReferenceAlias Property PrimaryAliasDoctor Mandatory Const Auto
	GlobalVariable Property SQ_Doctors_Price_Wounds Mandatory Const Auto
	GlobalVariable Property SQ_Doctors_Price_Afflictions Mandatory Const Auto
	GlobalVariable Property SQ_Doctors_Price_Addictions Mandatory Const Auto
	GlobalVariable Property SQ_Doctors_Price_Everything Mandatory Const Auto
	Spell Property SQ_Doctors_CureAll Mandatory Const Auto
	Spell Property CureAddictions Mandatory Const Auto
EndGroup

Actor PlayerRef
MiscObject Credits

int iHealMax = 999999999

Event OnQuestInit()
	PlayerRef = Game.GetPlayer()
	Credits = Game.GetCredits()
EndEvent

Function BuySupplies()
	Trace(self, "BuySupplies() ")
	PrimaryAliasDoctor.GetActorReference().ShowBarterMenu()
EndFunction

Function HealWounds()
	Trace(self, "HealWounds()")
	PayForService(SQ_Doctors_Price_Wounds)
	PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax)
EndFunction

Function HealAfflictions()
	Trace(self, "HealAfflictions()")
	PayForService(SQ_Doctors_Price_Afflictions)
	SQ_Doctors_CureAll.Cast(PlayerRef, PlayerRef)
EndFunction

Function HealAddictions()
	Trace(self, "HealAddictions()")
	PayForService(SQ_Doctors_Price_Addictions)
	CureAddictions.Cast(PlayerRef, PlayerRef)
EndFunction

Function HealEverything()
	Trace(self, "HealEverything()")
	PayForService(SQ_Doctors_Price_Everything)
	PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax)
	CureAddictions.Cast(PlayerRef, PlayerRef)
	SQ_Doctors_CureAll.Cast(PlayerRef, PlayerRef)
EndFunction

Function CannotPay()
	Trace(self, "CannotPay()")
EndFunction

Function PayForService(GlobalVariable CostGlobal)
	Trace(self, "PayForService() CostGlobal: " + CostGlobal)
	PlayerRef.RemoveItem(Credits, CostGlobal.GetValueInt())
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Doctors",  string SubLogName = "SQ_DoctorsScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Doctors",  string SubLogName = "SQ_DoctorsScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction