Scriptname UC_GG_Connect_ScannerRefColScript extends RefCollectionAlias

Keyword Property UC_GG_Connect_ActiveScanner_Unscanned_Keyword Auto Const Mandatory
{Check to see if this scanner is one of the ones that the courier failed to hit on his earlier trip}

Keyword Property UC_GG_Connect_ActiveScanner_Objective_Keyword Auto Const Mandatory
{Used to check if this scanner is still in the ref collection that grants the objectives}

Topic Property UC_GG_CheckIn_Scanned Auto Const Mandatory
{Topic to fire if this is one of the scanners the player or courier have not yet hit}

Topic Property UC_GG_CheckIn_Unscanned Auto Const Mandatory
{Topic to fire if this is one of the scanners the player or courier have hit already}

RefCollectionAlias Property UnvisitedScanPoints Mandatory Const Auto
{Ref collection containing the scan points that the courier never reached before their murder}

RefCollectionAlias Property ScanTargetsObjectives Mandatory Const Auto
{Ref collection containing the scan points that the courier never reached before their murder}

GlobalVariable Property UC_GG_Connect_StopsCompleted Mandatory Const Auto
{Global used to track how many triggers the player's entered}

int Property ObjectiveIndex = 200 Auto Const
{Objective index we're modifying as each one of these scanners is updated}

int Property PrereqStage = 200 Auto Const
{Only start allowing activation once this stage is set}

int Property ShutdownStage = 350 Auto Const
{Once this stage is set, we can stop checking (because the player's already found the right one)}

Function BlockScannerState(bool bEnable = false)
    int i = 0
    int iCount = GetCount()
    ObjectReference currRef

    while i < iCount
        currRef = GetAt(i)
        currRef.BlockActivation(bEnable, bEnable)

        i += 1
    endwhile
EndFunction

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        Quest OQ = GetOwningQuest()

        if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
    
            if akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Objective_Keyword)
                int iObjIndex = ScanTargetsObjectives.Find(akSenderRef)
                ObjectReference currObjScan = ScanTargetsObjectives.GetAt(iObjIndex)

                if currObjScan != none
                    ScanTargetsObjectives.RemoveRef(currObjScan)               
                    OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, aiObjectiveID = ObjectiveIndex)
                endif
            endif
        endif

        if akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Unscanned_Keyword)
            int iScanIndex = UnvisitedScanPoints.Find(akSenderRef)
            ObjectReference currScan = UnvisitedScanPoints.GetAt(iScanIndex)

            if currScan != none
                UnvisitedScanPoints.RemoveRef(currScan)
            endif

            akSenderRef.Say(UC_GG_CheckIn_Unscanned)
        else
            akSenderRef.Say(UC_GG_CheckIn_Scanned)
        endif
    endif
EndEvent