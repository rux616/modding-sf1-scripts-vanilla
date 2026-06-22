scriptName DefaultShowMessageOnActivateAlias extends ReferenceAlias Default Const
{Show the selected message when this ALIAS is activate.}

Group Required_Properties
	Message Property MessageToShow Auto Const Mandatory
	{The message to show when I'm activated.}
EndGroup

Group Optional_Properties
	Int Property Button0StageToSet = -1 Auto Const
	{Stage you want to set when Button 0 is clicked.}

	Int Property Button1StageToSet = -1 Auto Const
	{Stage you want to set when Button 1 is clicked.}

	Int Property Button2StageToSet = -1 Auto Const
	{Stage you want to set when Button 2 is clicked.}

	Int Property Button3StageToSet = -1 Auto Const
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
		if MessageStage >= 0
				; If stage IS set, and SHOULD be...
			if (GetOwningQuest().GetStageDone(MessageStage)) && ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is set on quest " + GetOwningQuest() + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()

				; If stage IS'NT set, and SHOULDN'T be...
			elseif (!GetOwningQuest().GetStageDone(MessageStage)) && !ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is NOT set on quest " + GetOwningQuest() + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()

				; If stage IS set and SHOULDN'T be...
			elseif (GetOwningQuest().GetStageDone(MessageStage)) && !ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is set on quest " + GetOwningQuest() + ", and SHOULDN'T be, NOT showing message " + MessageToShow, ShowTraces)

				; If stage ISN'T set and SHOULD be...
			elseif (!GetOwningQuest().GetStageDone(MessageStage)) && ShowIfStageIsSet
				DefaultScriptFunctions.Trace(self, "Stage" + MessageStage + " is NOT set on quest " + GetOwningQuest() + ", and SHOULDN be, NOT showing message " + MessageToShow, ShowTraces)
				
			endif
		else
			DefaultScriptFunctions.Trace(self, "Showing message " + MessageToShow, ShowTraces)
			iButton = MessageToShow.Show()
		endif
	else
		DefaultScriptFunctions.Trace(self, "ERROR: There is no message to show!", ShowTraces)
	endif

	if (iButton == 0)
		DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button0StageToSet + " on quest " + GetOwningQuest(), ShowTraces)
		If Button0StageToSet > -1
			GetOwningQuest().SetStage(Button0StageToSet)
		EndIf
	elseif (iButton == 1)
		DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button1StageToSet + " on quest " + GetOwningQuest(), ShowTraces)
		If Button1StageToSet > -1
			GetOwningQuest().SetStage(Button1StageToSet)
		EndIf
	elseif (iButton == 2)
		DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button2StageToSet + " on quest " + GetOwningQuest(), ShowTraces)
		If Button2StageToSet > -1
			GetOwningQuest().SetStage(Button2StageToSet)
		EndIf
	elseif (iButton == 3)
		DefaultScriptFunctions.Trace(self, "Button #" + iButton + " was pressed, setting stage " + Button3StageToSet + " on quest " + GetOwningQuest(), ShowTraces)
		If Button3StageToSet > -1
			GetOwningQuest().SetStage(Button3StageToSet)
		EndIf
	endif
	
EndEvent

