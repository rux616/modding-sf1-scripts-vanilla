Scriptname AudioRepeaterActivator extends ObjectReference
{Repeats a given sound's playback}

Import Utility
Import Debug

WwiseEvent Property SoundDescriptor const auto
{WwiseEvent that this script will play}

float property delayMin = 1.0 const auto
float property delayMax = 5.0 const auto
Bool bRunning = True

int iPlaySoundTimerID = 1 const

EVENT OnCellAttach()
	;debug.trace("Audio Debug: loaded successfully "+self)
	bRunning = isEnabled()
	if (bRunning)
		StartTimer(GetWaitTime(), iPlaySoundTimerID)
	endIf
EndEvent

Event OnCellDetach()
	bRunning = false
	CancelTimer(iPlaySoundTimerID)
	;debug.trace("Audio Debug: turning loop off "+self)
EndEvent

Event OnTimer(int aiTimerID)
	if (aiTimerID == iPlaySoundTimerID)
		SoundDescriptor.Play (self)
		if (bRunning && isEnabled())
			StartTimer(GetWaitTime(), iPlaySoundTimerID)
		endIf
	endIf
EndEvent

float Function GetWaitTime()
	return RandomFloat (DelayMin,DelayMax)
endFunction