Scriptname GunRangeCounter extends ObjectReference
{Receives info from GunRangeTarget}

;******************************************************

Group Required_Properties
	Int Property ScoreLimit = -1 Auto Const
		{Score to reach}
	Float Property TimeLimit = 10.0 Auto Const
		{Time limit in seconds}
EndGroup

;******************************************************

Group Optional_Properties
	Quest Property QuestToSet Auto Const
		{Quest containing the Stage to set}
	Int Property StageToActivateButton = -1 Auto Const
		{Stage to Set}
	Int Property StageToStartCompetition = -1 Auto Const
		{Stage to Set}
	Int Property StageToSetSuccess = -1 Auto Const
		{Stage to Set}
	Int Property StageToSetFail = -1 Auto Const
		{Stage to Set}
	ObjectReference Property ScoreText Auto
		{Debug text to show score}
	ObjectReference Property TimerText Auto
		{Debug text to show timer}
EndGroup

;******************************************************

;Empty State
Function GunRangeCompetition(int ScorePerHit)
EndFunction
;Event OnUpdate()
;EndEvent

;Local Variables
int CurrentScore
float fStartTime
int competitionTimerID = 1 Const

;******************************************************

Event OnActivate(ObjectReference akActionRef)
	Debug.Trace("Stage is " + QuestToSet.GetCurrentStageID())
	If (QuestToSet.GetCurrentStageID() == StageToActivateButton)
		Debug.Notification("Start!")

		;Reset Values
		QuestToSet.SetStage(StageToStartCompetition)
		ScoreText.SetDebugTextString(" ")
		TimerText.SetDebugTextString(" ")
		CurrentScore = 0

		GoToState("AllowCounting")
	Endif
EndEvent

STATE AllowCounting

	Event OnBeginState(string asOldState)
		fStartTime = Utility.GetCurrentRealTime()
		StartTimer(0.5, competitionTimerID)
	EndEvent	

	Event OnTimer(int aiTimerID)
		If (aiTimerID == competitionTimerID)

			int timeDisplay = ((TimeLimit - (Utility.GetCurrentRealTime() - fStartTime)) as int)
			timeDisplay = math.Ceiling(timeDisplay)
			TimerText.SetDebugTextString(timeDisplay + ".0")

			If((Utility.GetCurrentRealTime() - fStartTime) > TimeLimit)		
				If (CurrentScore < ScoreLimit)
					Debug.Notification("Failed")
					If (QuestToSet != None)
						Debug.Trace("Testing stage is " + QuestToSet.GetCurrentStageID())
						QuestToSet.SetStage(StageToSetFail)
						Debug.Trace("After stage is " + QuestToSet.GetCurrentStageID())
					EndIf	
				Else					
					Debug.Notification("Success")
					If (QuestToSet != None)
						Debug.Trace("Testing stage is " + QuestToSet.GetCurrentStageID())
						QuestToSet.SetStage(StageToSetSuccess)
						Debug.Trace("After stage is " + QuestToSet.GetCurrentStageID())
					EndIf	
				EndIf

				GoToState("StopCounting")	
			Else
				StartTimer(0.5, competitionTimerID)	
			EndIf
		EndIf
	EndEvent

	Function GunRangeCompetition(int ScorePerHit)
			CurrentScore += ScorePerHit
			ScoreText.SetDebugTextString(CurrentScore)
			Debug.Trace("Score was set to " + CurrentScore)
	EndFunction

EndSTATE

;******************************************************

STATE StopCounting
EndSTATE