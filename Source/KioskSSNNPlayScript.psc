Scriptname KioskSSNNPlayScript extends ObjectReference Const

Quest Property DialgoueSSNNScenes Auto Const Mandatory
ReferenceAlias Property RadioHost Auto Const
Scene Property SSNN_00_StoryManager Auto Const Mandatory
GlobalVariable Property BlockingGlobal Auto Const
{OPTIONAL: Used to block individual kiosks from playing when the specified global is set to 1.0}

Event OnLoad()
    if (BlockingGlobal == none || BlockingGlobal.GetValue() <= 0.0)
        Debug.Trace(SELF + ": Kiosk has loaded.")
        RegisterForDistanceLessThanEvent(SELF, Game.GetPlayer(), 30.0)
    endif
EndEvent

Event OnUnload()
    UnregisterForDistanceEvents(SELF, Game.GetPlayer())
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    if (BlockingGlobal == none || BlockingGlobal.GetValue() <= 0.0)
        Debug.Trace(SELF + ": Kiosk is close to player. Fire scene.")
        ; Once you get close enough to the SSNN Kiosk - play it's message
        RadioHost.ForceRefTo(SELF)
        SSNN_00_StoryManager.Start()
    endif
EndEvent

