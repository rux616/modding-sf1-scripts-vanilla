Scriptname RI01_AdStartQuestScript extends ObjectReference Const

Quest Property RI01 Auto Const Mandatory
Message Property RI01_AdMessage Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	If !RI01.IsActive() && !RI01.IsCompleted()
		RI01_AdMessage.Show()
		RI01.Start()
	EndIf
EndEvent
