Scriptname TestKurtInfoSendStoryEventScript extends TopicInfo

keyword property StoryEventKeyword auto const mandatory

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    debug.trace(self + " sending story event " + StoryEventKeyword)
    StoryEventKeyword.SendStoryEvent(akref1=akSpeakerRef)
EndEvent