Scriptname TestSendStoryEventOnActivateScript extends ObjectReference Const

Keyword Property StoryEventKeyword Mandatory Const Auto

GlobalVariable property GlobalToSet Const Auto

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        ; TEMP - set global so PCM can try to fill fossil target alias
        GlobalToSet.SetValue(1)
        StoryEventKeyword.SendStoryEventAndWait(GetCurrentLocation(), self)
        GlobalToSet.SetValue(0)
    endif
EndEvent