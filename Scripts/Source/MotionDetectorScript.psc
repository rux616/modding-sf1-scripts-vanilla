Scriptname MotionDetectorScript extends ObjectReference Const

Keyword Property LinkCustom01 Mandatory Const Auto
{Link from pivot to Trigger}

Keyword Property LinkCustom02 Mandatory Const Auto
{Link from pivot to Motion Detector}

;bool Property doOnce Mandatory Const Auto

Keyword Property LinkCustom03 Mandatory Const Auto

;Add ability to send event on detection.
;Add choice between opening only, toggle, etc.

bool Property UnlockOnOpen = false Mandatory Const Auto


Event OnLoad()
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTriggerEnter")
EndEvent

Event OnUnload()
    UnregisterForAllRemoteEvents()
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    debug.trace(self + "Trigger Entered")
    ObjectReference LinkedDoor = GetLinkedRef(LinkCustom03)
    if(LinkedDoor)
        if(UnlockOnOpen || LinkedDoor.isLocked() == false)
            LinkedDoor.SetOpen(true)
        EndIf
    endif
EndEvent
