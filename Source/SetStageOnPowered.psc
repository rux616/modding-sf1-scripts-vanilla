Scriptname SetStageOnPowered extends ObjectReference Const
{Set a quest stage when all linked elements are powered.}

Quest Property myQuest Mandatory Const Auto
int Property questStage Mandatory Const Auto
Int Property prereqQuestStage = -1 Const Auto
keyword Property LinkToPoweredReferences Mandatory Const Auto

Event OnCellLoad()
    ObjectReference[] refsLinkedToMe = GetRefsLinkedToMe(LinkToPoweredReferences)
    int i = 0
    While (i < refsLinkedToMe.Length)
        RegisterForRemoteEvent(refsLinkedToMe[i], "OnPowerOn")
        i = i + 1
    EndWhile
    Debug.Trace(self + " There are " + refsLinkedToMe.Length + " references linked to me.")
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
    bool allPowered = true
    int i = 0
    ObjectReference[] refsLinkedToMe = GetRefsLinkedToMe(LinkToPoweredReferences)
    While (i < refsLinkedToMe.Length)
        if(refsLinkedToMe[i])
            if(refsLinkedToMe[i].IsPowered() == false)
                Debug.Trace(refsLinkedToMe[i] + " does not have power.")
                allPowered = false
            EndIf
        Else
            Debug.Trace(refsLinkedToMe[i] + " does not exist.")
        EndIf
        i = i + 1
    EndWhile
    if(allPowered == true)
        If (PreReqQuestStage == -1) || (myQuest.GetStageDone(PrereqQuestStage))
            myQuest.SetStage(questStage)
        EndIf
        Debug.Trace("All Powered is True")
    EndIf
EndEvent

Event OnUnload()
    UnregisterForAllEvents()
EndEvent


