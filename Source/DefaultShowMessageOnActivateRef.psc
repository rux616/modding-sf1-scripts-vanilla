scriptName DefaultShowMessageOnActivateRef extends ObjectReference Default Const
{Show the selected message when this REFERENCE is activate.}

Group Required_Properties
	Message Property MessageToShow Auto Const Mandatory
	{The message to show when I'm activated.}
EndGroup

Group Optional_Properties
	Quest Property QuestToSet Auto Const
	{The quest who's stage we will check to see if the message should show or not.
	ALSO, the quest we will set stages on if a specific button is checked.}

	Int Property Button0StageToSet Auto Const
	{Stage you want to set when Button 0 is clicked.}

	Int Property Button1StageToSet Auto Const
	{Stage you want to set when Button 1 is clicked.}

	Int Property Button2StageToSet Auto Const
	{Stage you want to set when Button 2 is clicked.}

	Int Property Button3StageToSet Auto Const
	{Stage you want to set when Button 3 is clicked.}

	Int Property MessageStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute (ie show MessageBox)}

	Bool Property ShowIfStageIsSet = FALSE Auto Const
	{(Default: false) If true, will show message if stage is set. If false will show message until stage is set.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnActivate(ObjectReference akActionRef)

	int iButton

	if (MessageToShow)
		if QuestToSet && MessageStage > -1

				; If stage IS set, and SHOULD be...
			if (QuestToSet.GetStageDone(MessageStage)) && ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is set on quest " + QuestToSet + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()
				; If stage IS'NT set, and SHOULDN'T be...
			elseif (!QuestToSet.GetStageDone(MessageStage)) && !ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is NOT set on quest " + QuestToSet + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()
				; If stage IS set and SHOULDN'T be...
			elseif (QuestToSet.GetStageDone(MessageStage)) && !ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is set on quest " + QuestToSet + ", and SHOULDN'T be, NOT showing message " + MessageToShow, ShowTraces)
				; If stage ISN'T set and SHOULD be...
			elseif (!QuestToSet.GetStageDone(MessageStage)) && ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is NOT set on quest " + QuestToSet + ", and SHOULDN be, NOT showing message " + MessageToShow, ShowTraces)
			endif

		else
			DefaultScriptFunctions.Trace(self, "Showing message " + MessageToShow, ShowTraces)
			iButton = MessageToShow.Show()
		endif
	else
		DefaultScriptFunctions.Trace(self, "ERROR: There is no message to show!", ShowTraces)
	endif

	if (QuestToSet)
		if (iButton == 0)
			DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button0StageToSet + " on quest " + QuestToSet, ShowTraces)
			QuestToSet.SetStage(Button0StageToSet)
		elseif (iButton == 1)
			DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button1StageToSet + " on quest " + QuestToSet, ShowTraces)
			QuestToSet.SetStage(Button1StageToSet)
		elseif (iButton == 2)
			DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button2StageToSet + " on quest " + QuestToSet, ShowTraces)
			QuestToSet.SetStage(Button2StageToSet)
		elseif (iButton == 3)
			DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button3StageToSet + " on quest " + QuestToSet, ShowTraces)
			QuestToSet.SetStage(Button3StageToSet)
		endif
	endif

EndEvent

