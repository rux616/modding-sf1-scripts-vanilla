Scriptname LC088QuestScript extends Quest
{Quest script for LC088, the Crimson Fleet Final Battle.}
;
;LC088 provides convenience quickstart functions and handles some coordination among the three subquests.

Group AutofillProperties
	Quest property LC088_Space Auto Const Mandatory
	Quest property LC088_Vigilance Auto Const Mandatory
	Quest property LC088_Key Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Rokov Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Mathis Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Adler Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Huan Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Estelle Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const Mandatory
	ActorValue property CFSD01EvidenceTotal Auto Const Mandatory
	ActorValue property CFSD01EvidenceMax Auto Const Mandatory
EndGroup

;Local Consts
;Stage Consts
int CONST_LC088Space_DebugModeStage = 30 Const
int CONST_LC088Space_PlayerSetupDoneStage = 32 Const

;Standard values for the CF Captain State globals.
int CONST_CaptainState_Active = 0 Const
int CONST_CaptainState_Inactive = 1 Const
int CONST_CaptainState_Dead = 2 Const
int CONST_CaptainState_Imprisoned = 3 Const
int CONST_CaptainState_Freed = 4 Const

int CONST_EstelleDifficulty_Default = 3 Const


;Quickstart for LC088_Space
Function QuickstartSpace(int stage, int missingEvidenceFragments=0, int rokovState=0, int mathisState=0, int naevaState=0, int adlerState=0, int huanState=0, int estelleState=0, int estelleDifficulty=0)
	Start()
	UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
	Game.GetPlayer().SetValue(CFSD01EvidenceTotal, Math.Max(0, Game.GetPlayer().GetValue(CFSD01EvidenceMax) - missingEvidenceFragments))
	LC088_Space.SetStage(stage)
EndFunction

;Quickstart for LC088_Vigilance
Function QuickstartVigilance(int stage, int rokovState=0, int mathisState=0, int naevaState=0, int adlerState=0, int huanState=0, int estelleState=0, int estelleDifficulty=0)
	Start()
	UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
	LC088_Vigilance.SetStage(stage)
EndFunction

;Quickstart for LC088_Key
Function QuickstartKey(int stage, int rokovState=0, int mathisState=0, int naevaState=0, int adlerState=0, int huanState=0, int estelleState=0, int estelleDifficulty=0)
	Start()
	UpdateCaptainStates(rokovState, mathisState, naevaState, adlerState, huanState, estelleState, estelleDifficulty)
	LC088_Key.SetStage(stage)
EndFunction

;Sets all of the Captain State globals to the specified values.
Function UpdateCaptainStates(int rokovState=0, int mathisState=0, int naevaState=0, int adlerState=0, int huanState=0, int estelleState=0, int estelleDifficulty=0)
	CrimsonFleetCaptainState_Rokov.SetValue(rokovState)
	CrimsonFleetCaptainState_Mathis.SetValue(mathisState)
	CrimsonFleetCaptainState_Naeva.SetValue(naevaState)
	CrimsonFleetCaptainState_Adler.SetValue(adlerState)
	CrimsonFleetCaptainState_Huan.SetValue(huanState)
	CrimsonFleetCaptainState_Estelle.SetValue(estelleState)
	if (estelleDifficulty == 0)
		estelleDifficulty = CONST_EstelleDifficulty_Default
	EndIf
	CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(estelleDifficulty)
EndFunction