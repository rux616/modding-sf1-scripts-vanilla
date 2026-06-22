Scriptname Crew_RecruitQuestScript extends Quest hidden
{Used by extending scripts to set hire prices and hired states on actors.
***This script not intended to be used directly. Extending scripts must set CrewMemberRef before calling these functions.***}

Group Autofill
SQ_CrewScript Property SQ_Crew auto const mandatory
SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
GlobalVariable Property Crew_RecruitCost_TextReplacementValue Mandatory Const Auto
{this will hold the current value of what the player needs to pay to recruit for text replacement and condition functions
***IMPORTANT!***: Also add this to Text Display Variables on Quest Data Tab}
ActorValue Property Crew_HireSpeechChallengeAttempted Mandatory Const Auto
EndGroup

Group Properties
	ReferenceAlias Property Alias_CrewMember Mandatory Const Auto
	ReferenceAlias Property playerShip Const Auto
	Perk Property Trait_Taskmaster Const Auto
	float Property CostMult_Taskmaster = 2.0 Const Auto
EndGroup

Actor Property CrewMemberRef Auto hidden ;set and used by child scripts

Function SpeechChallengeAttempted()
	Trace(self, "SpeechChallengeAttempted() setting Crew_HireSpeechChallengeAttempted to 1 for " + CrewMemberRef)
	if CrewMemberRef
		CrewMemberRef.SetValue(Crew_HireSpeechChallengeAttempted, 1)
	Else
		Warning(self, "SpeechChallengeAttempted(): CrewMemberRef is NONE")
	endif
EndFunction

;find initial calls in child scripts
Function UpdateCost()
	Trace(self, "UpdateCost()")
	if CrewMemberRef
		int cost = SQ_Crew.GetRecruitCost(CrewMemberRef)

		Trace(self, "UpdateCost() setting Crew_RecruitCost_TextReplacementValue global to cost: " + cost)
		Crew_RecruitCost_TextReplacementValue.SetValue(cost)
		UpdateCurrentInstanceGlobal(Crew_RecruitCost_TextReplacementValue)
	Else
		Warning(self, "UpdateCost(): CrewMemberRef is NONE")
	EndIf
EndFunction

;Mult = 0.75 means a 25% discount from the normal cost. Default: 0.5
Function SetCostMultAndUpdateCost(float Mult = 0.5)
	Trace(self, "SetCostMultAndUpdateCost() Mult: " + Mult)
	if CrewMemberRef
		SQ_Crew.SetRecruitCostMult(CrewMemberRef, Mult)
		UpdateCost()
	Else
		Warning(self, "SetCostMultAndUpdateCost(): CrewMemberRef is NONE")
	EndIf
EndFunction

;called from dialogue info fragment
Function Recruited()
	if CrewMemberRef
		;only charge for the first time:
		if CrewMemberRef.IsInFaction(SQ_Crew.AvailableCrewFaction) == false
			int cost = SQ_Crew.GetRecruitCost(CrewMemberRef)
			MiscObject credits = Game.GetCredits()
			
			Trace(self, "Recruited() credits: " + credits + ", cost: " + cost)
			Game.GetPlayer().RemoveItem(credits, cost)
		endif

		SQ_Crew.SetRoleAvailable(CrewMemberRef, DisplayMessageIfChanged = true)
		;Show menu for assignment
		CrewMemberRef.ShowCrewAssign(true)
	Else
		Warning(self, "Recruited(): CrewMemberRef is NONE")
	EndIf
EndFunction

Function RecruitedUnasssigned()
	;Temporarily Assign/Unassign crew to initiate sandboxing on player ship if recruited but unassigned
	SpaceshipReference ShipRef = playerShip.GetShipRef()
	ShipRef.AssignCrew(CrewMemberRef)
	ShipRef.UnassignCrew(CrewMemberRef)
endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "Recruit", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "Recruit", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction