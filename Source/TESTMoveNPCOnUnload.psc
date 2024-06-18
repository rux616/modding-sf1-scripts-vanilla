Scriptname TESTMoveNPCOnUnload extends ReferenceAlias
{Test script to jump an NPC between various interior/exterior locations that aren't finished yet}

Struct MoveData
    int StageToCheck
    ObjectReference TeleportMarker
EndStruct

MoveData[] Property MoveDataArray Auto
{Array for the set stages and the locations to jump the NPC to}

Event OnUnload()
    int i = 0
    int iLength = MoveDataArray.Length
    Quest myInst = GetOwningQuest()

    while i < iLength
        MoveData currData = MoveDataArray[i]
        int currStage = currData.StageToCheck

        if myInst.GetStageDone(currStage)
             GetRef().MoveTo(currData.TeleportMarker)
             MoveDataArray.Remove(i)
             return
        EndIf

        i += 1
    endwhile
EndEvent
