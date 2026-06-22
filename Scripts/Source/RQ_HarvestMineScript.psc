Scriptname RQ_HarvestMineScript extends RQScript conditional

Group HarvestMineGroup
    ActorValue Property ProduceUses Auto Const Mandatory
    
    Int Property RockCurrent Auto conditional
    
    GlobalVariable Property RQ_Settlement_HarvestMiner_01_CurrentCount auto const mandatory
    GlobalVariable Property RQ_Settlement_HarvestMiner_01_MaxCount auto const mandatory
    GlobalVariable Property RQ_Settlement_HarvestMiner_01_QTCount auto const mandatory

    RefCollectionAlias Property RocksCollection Auto Const

    int property HarvestCountRequiredMax = 15 auto Const
    { max to harvest required (even if there are more than that in the cave)}

    int property HarvestCountRequiredMin = 8 auto Const
    { max to harvest required (even if there are more than that in the cave)}

    float property QTCountPercentage = 0.65 auto Const
    { at what % of total do QTs start appearing? }

    int property RockCollectionObjective = 100 auto const 

    Int Property RocksCollectedStage = 300 Auto Const 
    {Stage to set when all minerals have been collected.}

    Int Property ShutdownStage = 999 Auto Const 
    {Stage to set when all minerals have been collected.}
EndGroup

import Utility 

float RegisterRocksCollectionTimer = 1.0 Const
int RegisterRocksCollectionTimerID = 1 Const

int harvestTotalMin = 0 ; randomly rolled between HarvestCountRequiredMin and Max at quest start

; override parent function
function QuestStartedSpecific()
    harvestTotalMin = Utility.RandomInt(HarvestCountRequiredMin, HarvestCountRequiredMax)
    debug.trace(self + " harvestTotalMin=" + harvestTotalMin)

    UpdateRocksCollection()
    If RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt() == 0 
        Debug.Trace(self + "RocksCollection is empty. Shutdown." )
        SetStage(ShutdownStage)
    Else
    	RegisterForRemoteEvent(RocksCollection, "OnAliasChanged")
    EndIf 
EndFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, bool abRemove)
    ; if RocksCollection alias changes, wait and update again
    debug.trace(self + " OnAliasChanged akObject=" + akObject + " abRemove=" + abRemove)
    ; unregister and run timer - we only need to do this once
   	UnregisterForRemoteEvent(RocksCollection, "OnAliasChanged")

    StartTimer(RegisterRocksCollectionTimer, RegisterRocksCollectionTimerID)
EndEvent


Event OnTimer(int aiTimerID)
    if aiTimerID == RegisterRocksCollectionTimerID
        RegisterRocks()
    endif
EndEvent


function UpdateRocksCollection(bool checkProduceUses = false)
    debug.trace(self + " UpdateRocksCollection: checking RocksCollection")
    Int i = RocksCollection.GetCount() - 1

    ; make sure we have some rocks that haven't been harvested
    While i >= 0
        ObjectReference rockRef = RocksCollection.GetAt(i)
        Form rockBase = rockRef.GetBaseObject()

        debug.trace(self + " checking " + rockRef + " baseObject=" + rockBase)

        if rockRef.IsDisabled() || (rockRef.Is3DLoaded() && (rockBase is Flora) == false)
            ; remove this - didn't calc or isn't the Flora part of the packin
            debug.trace(self + " removing " + rockRef)
            RocksCollection.RemoveRef(rockRef)
        EndIf
        i -= 1  ; decrement
    EndWhile    
    int rockTotal = RocksCollection.GetCount()
    rockTotal = Math.Min(harvestTotalMin, rockTotal) as int
    debug.trace(self + " rockTotal=" + rockTotal)

    RQ_Settlement_HarvestMiner_01_MaxCount.SetValueInt(rockTotal)
    RQ_Settlement_HarvestMiner_01_CurrentCount.SetValueInt(0)
    RQ_Settlement_HarvestMiner_01_QTCount.SetValueInt((rockTotal*QTCountPercentage) as int)
    UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_MaxCount)
    UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_CurrentCount)
EndFunction

guard RegisterRocksGuard ProtectsFunctionLogic

Function RegisterRocks()
    LockGuard RegisterRocksGuard
        UpdateRocksCollection()
        int rockTotal = RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt()
        If RockTotal == 0 
            Debug.Trace(self + "RocksCollection is empty. Complete rock collection objective." )
            SetStage(RocksCollectedStage)
        Else
            ; The rocks are flora - and the way to track to see if they've been disabled is via registering an actor value event
            Int i
            Debug.Trace(self + "Starting registering rocks.")
            While i < RocksCollection.GetCount()
                ObjectReference rockRef = RocksCollection.GetAt(i)
                Debug.Trace(self + "Rock added: " + rockRef )
                RegisterForActorValueLessThanEvent(rockRef, ProduceUses, 1)
                i += 1
            EndWhile    
        EndIf 
    EndLockGuard

EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Debug.Trace(self + "Mined one deposit " + akObjRef)
    ModObjectiveGlobal(1, RQ_Settlement_HarvestMiner_01_CurrentCount, RockCollectionObjective)

    If RQ_Settlement_HarvestMiner_01_CurrentCount.GetValueInt() >= RQ_Settlement_HarvestMiner_01_MaxCount.GetValue()
        SetStage(RocksCollectedStage)
    EndIf
EndEvent