Scriptname PDBoardroomDoorTriggerScript extends ObjectReference Const
{Opens linked door on trigger enter}

Quest Property DialogueParadiso Mandatory Const Auto
Quest Property DialogueECSConstant Mandatory Const Auto
Int Property PreReqStage = 305 Const Auto
Int Property FFConstantZ04DebugStage = 54 Const Auto
Float Property DoorTimerLength = 10.0 Const Auto

Function CloseBoardroomDoor()
    GetLinkedRef().SetOpen(False)
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
    Debug.Trace(self+"   Trigger Entered") 
    If DialogueParadiso.GetStageDone(PreReqStage) || DialogueECSConstant.GetStageDone(FFConstantZ04DebugStage)
        ObjectReference myDoor = GetLinkedRef()
        If myDoor.GetOpenState() >= 3
            myDoor.SetOpen()
            StartTimer(DoorTimerLength)
        EndIf
    EndIf
EndEvent


Event OnTimer(int aiTimerID)
    If !IsInTrigger(Game.GetPlayer())
        CloseBoardroomDoor()
    Else 
        StartTimer(DoorTimerLength)
    EndIf
EndEvent
