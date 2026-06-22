Scriptname SEDebugScript extends Quest
{Quest script for SEDebug, the Space Encounter Debug quest.}

Struct SEDebugLocationDatum
	String DebugName
	Location DebugLocation
EndStruct

Group AutofillProperties
	ReferenceAlias property PlayerShip Auto Const Mandatory
	GlobalVariable property SEChanceGlobal Auto Const Mandatory
	GlobalVariable property Se_ChanceRareGlobal Auto Const Mandatory
	GlobalVariable property Se_ChanceUniqueGlobal Auto Const Mandatory
	GlobalVariable property SE_Player_ChanceCommonGlobal Auto Const Mandatory
	GlobalVariable property SE_Player_ChanceRareGlobal Auto Const Mandatory
	GlobalVariable property SE_Player_ChanceUniqueGlobal Auto Const Mandatory
	GlobalVariable property SEDebugGlobal Auto Const Mandatory
	GlobalVariable property SE_SystemCountChance Auto Const Mandatory
	GlobalVariable property SE_Chance_CivilizedInUncivilizedSpace Auto Const Mandatory
	GlobalVariable property SE_Chance_UncivilizedInCivilizedSpace Auto Const Mandatory
EndGroup

SEDebugLocationDatum[] property SEDebugData Auto Const Mandatory


Function TestSE(String questName, String locationName)

	SEChanceGlobal.SetValue(100)
	Se_ChanceRareGlobal.SetValue(100)
	Se_ChanceUniqueGlobal.SetValue(100)
	SE_Player_ChanceCommonGlobal.SetValue(100)
	SE_Player_ChanceRareGlobal.SetValue(100)
	SE_Player_ChanceUniqueGlobal.SetValue(100)
	SE_SystemCountChance.SetValue(0)
	Debug.ExecuteConsole("Set SE_Chance_CivilizedInUncivilizedSpace to 100")
	Debug.ExecuteConsole("Set SE_Chance_UncivilizedInCivilizedSpace to 100")
	;SE_Chance_CivilizedInUncivilizedSpace.SetValue(100)
	;SE_Chance_UncivilizedInCivilizedSpace.SetValue(100)

	;SEDebugGlobal.SetValue(1) ; turn on debug node that has all quests in it
	
	Debug.ExecuteConsole("SetDebugQuest " + questName + " 1 1")

	if ((locationName == "") || (locationName == "0"))
		SpaceshipReference currentShip = PlayerShip.GetShipRef()
		int i = 0
		While (i < SEDebugData.Length)
			if (currentShip.GetCurrentLocation() != SEDebugData[i].DebugLocation)
				Debug.ExecuteConsole("mtp " + SEDebugData[i].DebugName)
				Return
			EndIf
			i = i + 1
		EndWhile
	Else
		Debug.ExecuteConsole("mtp " + locationName)
	EndIf

	Reset()

	
EndFunction

Function TestFAB09(String locationName)

	SEChanceGlobal.SetValue(0)
	Se_ChanceRareGlobal.SetValue(100)
	Se_ChanceUniqueGlobal.SetValue(0)
	SE_Player_ChanceCommonGlobal.SetValue(0)
	SE_Player_ChanceRareGlobal.SetValue(0)
	SE_Player_ChanceUniqueGlobal.SetValue(0)
	;SEDebugGlobal.SetValue(1) ; turn on debug node that has all quests in it
	
	Debug.ExecuteConsole("SetDebugQuest SE_KMK02 1 1")

	if ((locationName == "") || (locationName == "0"))
		SpaceshipReference currentShip = PlayerShip.GetShipRef()
		int i = 0
		While (i < SEDebugData.Length)
			if (currentShip.GetCurrentLocation() != SEDebugData[i].DebugLocation)
				Debug.ExecuteConsole("mtp " + SEDebugData[i].DebugName)
				Return
			EndIf
			i = i + 1
		EndWhile
	Else
		Debug.ExecuteConsole("mtp " + locationName)
	EndIf

	
EndFunction