Scriptname UC02_TerrormorphFleeAliasScript extends ReferenceAlias const

Faction Property TerrormorphFaction Mandatory Const Auto
{Terrormorph faction}

RefCollectionAlias Property FleeingTerrormorph Mandatory Const Auto
{Collection for fleeing Terrormorphs}

int Property CheckTimerLength Mandatory Const Auto
{How frequently we check to see if the Terrormorph is out of range of the target}

GlobalVariable Property UC02_TerrormorphFleeDistance Mandatory Const Auto
{Global used to know how far Terrormorphs need to flee from this alias}

int iCheckTimerID = 1 const

Event OnTriggerEnter(ObjectReference akActionRef)
    Actor TriggerACT = akActionRef as Actor
    if TriggerACT && TriggerACT.IsInFaction(TerrormorphFaction)
        if FleeingTerrormorph.GetCount() <= 0
            StartTimerCheck()
        endif

        FleeingTerrormorph.Addref(TriggerACT)
        TriggerACT.EvaluatePackage()
    endif
EndEvent

Function StartTimerCheck()
    StartTimer(CheckTimerLength,iCheckTimerID)
EndFunction

Function CleanUpCollection()
    int i = 0
    int iCount = FleeingTerrormorph.GetCount()
    
    while i < iCount
        ObjectReference currMorph = FleeingTerrormorph.GetAt(i)

        if currMorph.GetDistance(GetRef()) <= UC02_TerrormorphFleeDistance.GetValue()
            FleeingTerrormorph.RemoveRef(currMorph)
        endif

        i += 1
    endwhile

    if FleeingTerrormorph.GetCount() > 0
        StartTimerCheck()
    endif
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iCheckTimerID
        CleanUpCollection()
    endif
EndEvent

Event OnUnload()
    CancelTimer(iCheckTimerID)
    FleeingTerrormorph.RemoveAll()
EndEvent