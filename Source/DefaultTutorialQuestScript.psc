Scriptname DefaultTutorialQuestScript extends Quest

Struct TutorialMessageDatum
	string asEvent
	{Note: if you want multiple messages showing "together" you will need to make each have a different asEvent string. As per the ShowAsHelpMessage() param}

	string asUserEventToEnd = "None"
	{The User Event (button press) we are listening for in order to end the tutorial early.}

	bool AlwaysShow = false
	{If True, then always show this Tutorial, even if the player has seen it before.}

	float DelayTime = -1.0
	{If set, it will delay this amount of time before showing the message}

	bool DelayFinished Hidden
	{will be set when the timer has delayed this, and we are ready to show it}

    bool TutorialSeen Hidden
    {tracks if the player has seen this tutorial already}

	string asEventNext
	{This is the next event to send immediately after this one (for multiple part messages), make sure there is a struct defined for it in this array as well AND make sure there is a DelayTime set so they don't bash.}

	message TutorialMessage
	{the message to display along with the objective which tells the player how to complete the objective}
	message TutorialMessageMouseAndKeyboardSpecific
	{the message to display along with the objective which tells the player how to complete the objective... if NONE (default), show TutorialMessage for both, othewise show this if PC}

	int AfDuration = 30
	{As per the ShowAsHelpMessage() param - how long to display}
	int AfInterval = 30
	{As per the ShowAsHelpMessage() param - how much time between intervals}
	int aiMaxTimes = 1
	{As per the ShowAsHelpMessage() param - how many times this message repeats. Defaults to only display once.}
	string asContext = ""
	{As per the ShowAsHelpMessage() param}
	int aiPriority = 0
	{As per the ShowAsHelpMessage() param}
EndStruct

Group TutorialProperty
	TutorialMessageDatum[] Property TutorialMessageData Auto Const Mandatory
	GlobalVariable Property TutorialAllowedGlobal Const Auto
	{if set, this global must be >= 1 to }
EndGroup

Event OnTimer(int aiTimerID)
	Debug.Trace(Self + "OnTimer() aiTimerID: " + aiTimerID)
    ;delayed tutorial message - uses index for ID
	TutorialMessageData[aiTimerID].DelayFinished = true
	ShowHelpMessage(TutorialMessageData[aiTimerID].asEvent)
EndEvent

Function ShowHelpMessage(String EventName)
	if TutorialAllowedGlobal && TutorialAllowedGlobal.GetValue() < 1
		RETURN
	endif


	Debug.Trace(Self + " ShowHelpMessage() EventName: " + EventName, 0)

;TEMP
	Debug.TraceStack()

	int iFound = TutorialMessageData.FindStruct("asEvent", EventName)

	if iFound > -1
		If TutorialMessageData[iFound].AlwaysShow == True
			;if we always want to see this tutorial, reset it
			ResetTutorial(EventName)
		EndIf

        If TutorialMessageData[iFound].TutorialSeen == True
           	;do nothing if we've already seen this tutorial
    	ElseIf TutorialMessageData[iFound].DelayTime > 0 && TutorialMessageData[iFound].DelayFinished == false
			Debug.Trace(self + " ShowHelpMessage() starting delay timer for TutorialMessageData[iFound]: " + TutorialMessageData[iFound], 0)
			StartTimer(TutorialMessageData[iFound].DelayTime, iFound)
		Else
            DoShowMessage(iFound)
            TutorialMessageData[iFound].TutorialSeen = True ;player has now seen the tutorial and shouldn't see it again
			TutorialMessageData[iFound].DelayFinished = false ;clear the flag in case we need to display it again with a delay

			if TutorialMessageData[iFound].asEventNext
				ShowHelpMessage(TutorialMessageData[iFound].asEventNext)
			EndIf
		endif
	endif

EndFunction

Function UnshowHelpMessage(String EventName)
	Debug.Trace(self + " StopHelpMessage() EventName: " + EventName)
	int iFound = TutorialMessageData.FindStruct("asEvent", EventName)

	if iFound > -1
		if TutorialMessageData[iFound].TutorialMessage
			TutorialMessageData[iFound].TutorialMessage.UnshowAsHelpMessage()
		endif
		if TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific
			TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific.UnshowAsHelpMessage()
		endif
	endif

EndFunction

Function DoShowMessage(Int iFound) private
	string 		asUserEventToEnd 						= TutorialMessageData[iFound].asUserEventToEnd
	message 	TutorialMessage 						= TutorialMessageData[iFound].TutorialMessage
	message 	TutorialMessageMouseAndKeyboardSpecific	= TutorialMessageData[iFound].TutorialMessageMouseAndKeyboardSpecific
	int 		AfDuration 								= TutorialMessageData[iFound].AfDuration
	int 		AfInterval 								= TutorialMessageData[iFound].AfInterval
	int 		aiMaxTimes 								= TutorialMessageData[iFound].aiMaxTimes
	string 		asContext 								= TutorialMessageData[iFound].asContext
	int 		aiPriority 								= TutorialMessageData[iFound].aiPriority

	;Clear any help messages that are currently on display. The most recent tutorial message should always win.
	Message.ClearHelpMessages()

	;display the help message. If there's a MKB vs GamePad message, then display the MKB message with an optional parameter to swap to the Gamepad message if we hot-swap
	if (TutorialMessageMouseAndKeyboardSpecific == None)
		TutorialMessage.ShowAsHelpMessage(asEvent = asUserEventToEnd, AfDuration = AfDuration, AfInterval = AfInterval, aiMaxTimes = aiMaxTimes, asContext = asContext, aiPriority = aiPriority)
	else
		TutorialMessageMouseAndKeyboardSpecific.ShowAsHelpMessage(asEvent = asUserEventToEnd, AfDuration = AfDuration, AfInterval = AfInterval, aiMaxTimes = aiMaxTimes, asContext = asContext, aiPriority = aiPriority, GamepadMsg=TutorialMessage)
	endif
endfunction	

Function ResetTutorial(String EventName)
	;reset this tutorial so it always displays
	int iFound = TutorialMessageData.FindStruct("asEvent", EventName)
	TutorialMessageData[iFound].TutorialSeen = False
	Message.ResetHelpMessage(TutorialMessageData[iFound].asUserEventToEnd)
EndFunction

Function ResetAll()
	int i = 0
	While (i < TutorialMessageData.length)
		ResetTutorial(TutorialMessageData[i].asEvent)
		i += 1
	EndWhile
EndFunction