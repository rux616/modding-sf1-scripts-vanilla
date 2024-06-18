Scriptname CuttableWallScript extends ObjectReference

Keyword Property LinkCustom01 Mandatory Const Auto
{Link to the Bolts, a LinkRefChain}
Keyword Property LinkCustom02 Mandatory Const Auto
{Link to the panel}

WwiseEvent Property DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut Mandatory Const Auto

Auto State Initial
    Event OnCellLoad()
        IntializeCuttableWall()
    EndEvent
EndState

Event ObjectReference.OnDestroyed(ObjectReference akSender, ObjectReference akDestroyer)
    
    DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut.Play(akSender) ;Break Pin Audio

    ObjectReference[] Bolts = GetLinkedRefChain(LinkCustom01)
    bool allBoltsDestroyed = true
    int index = 0
    While (index < Bolts.Length)
        if (!(Bolts[index].isDestroyed()))
            allBoltsDestroyed = false
        EndIf
        index += 1
    EndWhile

    if(allBoltsDestroyed)
        ReleasePanel()
    EndIf
EndEvent

Function ReleasePanel()
    ;Wall panel falls out. Open because it is a door.
    GetLinkedRef(LinkCustom02).SetOpen()
EndFunction

Function IntializeCuttableWall()
        ObjectReference[] Bolts = GetLinkedRefChain(LinkCustom01)
        int index = 0
        While (index < Bolts.Length)
            Bolts[index].ClearDestruction()
            RegisterForRemoteEvent(Bolts[index], "OnDestroyed")
            index += 1
        EndWhile
        GetLinkedRef(LinkCustom02).SetOpen(false)
        GoToState("Done")
EndFunction

Event OnReset()
    Debug.Trace("This object was reset")

    GoToState("Initial")
    if game.GetPlayer().GetParentCell() == GetParentCell()
        IntializeCuttableWall()
    endif
EndEvent

State Done
    ; Do nothing
endState