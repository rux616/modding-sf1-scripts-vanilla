Scriptname NewAtlantisSecurityScannerScript extends ObjectReference Conditional

WwiseEvent Property SoundEventToPlay Auto Const
Quest Property PreReqQuest Auto Const


Event OnTriggerEnter(ObjectReference akActionRef)

if AkActionRef == Game.GetPlayer()
	if PreReqQuest.IsRunning()
		SoundEventtoPlay.PlayandWait(self)
		Self.Disable()
	endif
endif

EndEvent
