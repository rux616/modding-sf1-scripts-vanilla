Scriptname TestSendStoryEventOnLoad extends ObjectReference Const

Keyword Property StoryEventKeyword auto Const

Event OnLoad()
    StoryEventKeyword.SendStoryEventAndWait(GetCurrentLocation(), self, GetLinkedRef())
endEvent