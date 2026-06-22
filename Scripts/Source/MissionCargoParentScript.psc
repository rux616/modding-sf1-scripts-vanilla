Scriptname MissionCargoParentScript extends MissionQuestScript conditional
{parent script for mission quests that involve player cargo space}

; updated by UpdatePlayerCargoSpace
Group CargoParentData
	GlobalVariable Property PlayerCargoSpaceCurrent Auto Const Mandatory
	{used for text replacement - needs to be updated when player ship inventory changes }

	GlobalVariable Property PlayerCargoSpaceTotal Auto Const Mandatory
	{used for text replacement }

    bool property hasCargoSpace = false auto hidden
    { updated by UpdatePlayerCargoSpace }

    bool property hasShieldedCargoSpace = true auto hidden
    { updated by UpdatePlayerCargoSpace }

    Keyword property LocTypeStarStation auto const mandatory
    { for checking for docking }

	Keyword property LocTypeStarstationExterior auto const mandatory
	{ keyword to check if you've docked with a starstation }
EndGroup

Function UpdatePlayerCargoSpace()
	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		; check if it has cargo space
		MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()
		; if so, load cargo and accept mission
		Trace(Self, " UpdatePlayerCargoSpace: cargo type marker=" + PrimaryRef.GetRef() + " ")
		if cargoContainerRef
			float cargoWeight = MissionIntValue01.GetValue()
			float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight()
			float cargoSpaceUsed = PlayerShipRef.GetWeightInContainer()
			float cargoSpace = cargoSpaceTotal - cargoSpaceUsed
			float cargoSpaceShielded = PlayerShipRef.GetValue(MissionParent.CarryWeightShielded) - PlayerShipRef.GetContrabandWeight(abCheckWholeShip = false)

			Trace(Self, " UpdatePlayerCargoSpace: cargoWeight=" + cargoWeight + " cargoSpace=" + cargoSpace + " cargoSpaceShielded=" + cargoSpaceShielded + " cargoSpaceTotal=" + cargoSpaceTotal + " cargoSpaceUsed=" + cargoSpaceUsed)
			hasCargoSpace = (cargoWeight <= cargoSpace)
			hasShieldedCargoSpace = (cargoWeight <= cargoSpaceShielded)

			PlayerCargoSpaceCurrent.SetValue(Math.Floor(cargoSpaceUsed))
			PlayerCargoSpaceTotal.SetValue(cargoSpaceTotal)
			UpdateCurrentInstanceGlobal(PlayerCargoSpaceCurrent)
			UpdateCurrentInstanceGlobal(PlayerCargoSpaceTotal)
		endif
	endif
EndFunction


MissionBoardCargoContainerScript Function GetCargoContainer()
    ; scripts that extend this need to fill this in with whatever they use as the cargo container
    return NONE
endFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "Cargo", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "Cargo", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction