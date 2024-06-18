Scriptname DefaultCrowdEventTIF extends TopicInfo const
{Used to send CrowdEvents from DefaultCrowdEventManager script
This script will use GetOwningQuest() and cast it as a DefaultCrowdEventManager to do the sending of the events.
So the DefaultCrowdEventManager script must be attached to the quest that owns this topic info
}

Keyword Property EventToSend const auto
{What even are we sending?
Likely  the keyword is named:
CrowdEvent_<EventName>
}

bool Property SendOnBegin = false const auto
bool Property SendOnEnd = true const auto

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SendOnBegin
		debug.trace(self + "OnBegin() will send:" + EventToSend)
		(GetOwningQuest() as DefaultCrowdEventManager).SendCrowdEvent(EventToSend, akSpeakerRef, None)
		
	endif
endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SendOnEnd
		debug.trace(self + "OnEnd() will send:" + EventToSend)	
		(GetOwningQuest() as DefaultCrowdEventManager).SendCrowdEvent(EventToSend, akSpeakerRef, None)

	endif
endEvent