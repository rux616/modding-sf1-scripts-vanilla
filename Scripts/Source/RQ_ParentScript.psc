Scriptname RQ_ParentScript extends Quest

Group Autofill
	Quest Property SQ_PlayerShip Mandatory Const Auto

	Quest Property TestGoToSpaceQuest Mandatory Const Auto

	GlobalVariable Property RQ_Debug_SummonShipOnStart Mandatory Const Auto

	GlobalVariable Property PCM_VerifiedOnly Mandatory Const Auto

	GlobalVariable Property PCM_BlockCreation_DebugGlobal Mandatory Const Auto
EndGroup

;REMINDER: you need to have the Debug script compiled locally or use debug archives to get this to function
Function TestRQ(string QuestName = "RQ_OE_Rescue_01", 			\
				string TestPlanet = "Akila", 						\
				string Overlay1 = "OEDebugShipwreckOverlay", 	\
				string Overlay2 = "", 							\
				int PCM_BlockCreation_DebugGlobal_Value = 7,	\
				int Overlay1X = 1, 								\
				int Overlay1Y = 1, 								\
				int Overlay2X = 1, 								\
				int Overlay2Y = 3, 								\
				int PlayerX = 1, 								\
				int PlayerY = 1) DebugOnly
	; note: console commands send 0 to all unlisted parameters, so default values for these don't mean much here
	if Overlay1X == 0
		Overlay1X = 1
	EndIf
	if Overlay1Y == 0
		Overlay1Y = 1
	EndIf
	if Overlay2X == 0
		Overlay2X = 1
	EndIf
	if Overlay2Y == 0
		Overlay2Y = 3
	EndIf
	if PlayerX == 0
		PlayerX = 1
	EndIf
	if PlayerY == 0
		PlayerY = 1
	EndIf
	TestRQFull(QuestName, TestPlanet, Overlay1, Overlay2, PCM_BlockCreation_DebugGlobal_Value, Overlay1X, Overlay1Y, Overlay2X, Overlay2Y, PlayerX, PlayerY)
EndFunction

Function TestRQFull(string QuestName = "RQ_OE_Rescue_01", 			\
				string TestPlanet = "Akila", 						\
				string Overlay1 = "OEDebugShipwreckOverlay", 	\
				string Overlay2 = "", 							\
				int PCM_BlockCreation_DebugGlobal_Value = 7,	\
				int Overlay1X = 1, 								\
				int Overlay1Y = 1, 								\
				int Overlay2X = 1, 								\
				int Overlay2Y = 3, 								\
				int PlayerX = 1, 								\
				int PlayerY = 1) DebugOnly

	;initialize player ship
	TestGoToSpaceQuest.SetStage(20)

	;wait until ready
	float waitingFor
	float waitMax = 10
	float waitTime = 0.1
	While SQ_PlayerShip.IsRunning() == false && waitingFor < waitMax
		Utility.Wait(waitTime)
		waitingFor += waitTime
	EndWhile

	;get the player ship landing when quest starts
	RQ_Debug_SummonShipOnStart.SetValue(1)

	;overlay set up
	PCM_VerifiedOnly.SetValue(1)
	PCM_BlockCreation_DebugGlobal.SetValue(PCM_BlockCreation_DebugGlobal_Value)

	;console commands
	ExecuteCommand("SQAL " + QuestName + " 1")
	ExecuteCommand("SetDebugQuest " + QuestName + " 1 100")
	ExecuteCommand("AddWorldspaceToPlanet " + Overlay1 + " " + TestPlanet +  " " + Overlay1X + " " + Overlay1Y)

	if Overlay2
		if Overlay1X == Overlay2X && Overlay1Y == Overlay2Y
			; Invalid case; don't place 2 overlays at the same coordinates
			Overlay2Y += 3
		endif
		
		ExecuteCommand("AddWorldspaceToPlanet " + Overlay2 + " " + TestPlanet +  " " + Overlay2X + " " + Overlay2Y)
	endif
	ExecuteCommand("LOP " + TestPlanet + " " + PlayerX + " " + PlayerY)
EndFunction

Function ExecuteCommand(String aCommand)
	debug.trace(self + aCommand)
	debug.ExecuteConsole(aCommand)
EndFunction
