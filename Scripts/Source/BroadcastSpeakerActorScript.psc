Scriptname BroadcastSpeakerActorScript extends Actor Const

Keyword Property LinkedRefBroadcastSpeaker const auto
{Autofill}

ObjectReference[] Property SpeakerRefs const auto

Function ToggleSpeakers(bool ShouldTurnOn = True)
	;ShouldTurnOn false = turn of the speakers
	
	int i = 0
	while (i < SpeakerRefs.length)
		if ShouldTurnOn
			SetLinkedRef(SpeakerRefs[i], LinkedRefBroadcastSpeaker)
		else
			SetLinkedRef(none, LinkedRefBroadcastSpeaker)
		endif

		i += 1
	endwhile

EndFunction