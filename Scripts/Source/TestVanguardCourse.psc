Scriptname TestVanguardCourse extends ObjectReference

ObjectReference Property Button1 auto mandatory const
ObjectReference Property Button2 auto mandatory const
ObjectReference Property Button3 auto mandatory const
ObjectReference Property CheatButton auto mandatory const
ObjectReference Property ExitDoor auto mandatory const

Bool But1p
Bool But2p
Bool But3p
Bool ButCh
Int curTime = 0

Event OnInit()
    RegisterForRemoteEvent(Button1, "OnActivate")
    RegisterForRemoteEvent(Button2, "OnActivate")
    RegisterForRemoteEvent(Button3, "OnActivate")
    RegisterForRemoteEvent(CheatButton, "OnActivate")
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    debug.trace(self + " OnActivate akActionRef=" + akActionRef)
    CourseTime()
EndEvent

Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
		if akSender == Button1 && But1p == false
            debug.trace("Activated by " + akSender)
            But1p = true
            exitTest()
        EndIf
        if akSender == Button2 && But2p == false
            debug.trace("Activated by " + akSender)
            But2p = true
            exitTest()
        EndIf
        if akSender == Button3 && But3p == false
            debug.trace("Activated by " + akSender)
            But3p = true
            exitTest()
        EndIf
        if akSender == CheatButton && ButCh == false
            debug.trace("Activated by " + akSender)
            ButCh = true
            ;curTime = 0
        EndIf
EndEvent

Function ExitTest()
    if (But1p && But2p && But3p)
        ExitDoor.SetOpen()
        if Butch == true
            debug.Notification("your time was $RECORDTIME$-1 seconds")
        Else
            debug.Notification("your time was " + curtime + " seconds")
        EndIf
    EndIf
EndFunction

Function CourseTime()
    while (But1p == false) && (But2p == false) && (But3p == false)
        Utility.Wait(1)
        curTime = curTime + 1
    EndWhile
EndFunction