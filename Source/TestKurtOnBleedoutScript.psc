Scriptname TestKurtOnBleedoutScript extends Actor Const

keyword property StoryEventKeyword auto const

Event OnEnterBleedout()
    debug.trace(self + " entering bleedout: IsBleedingOut=" + IsBleedingOut())
    if StoryEventKeyword
        StoryEventKeyword.SendStoryEvent(akref1=self)
    endif
EndEvent

Event OnRecoverFromBleedout()
    debug.trace(self + " recovering from bleedout: IsBleedingOut=" + IsBleedingOut())
EndEvent

