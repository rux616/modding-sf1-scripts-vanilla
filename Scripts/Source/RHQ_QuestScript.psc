Scriptname RHQ_QuestScript extends Quest

float Property MaxStaggerTime = 0.5 Const Auto
{Max amount of time between staggered NPCs}

Function StaggerEVP(RefCollectionAlias akTargetColl)
    int i = akTargetColl.GetCount() - 1

    while i >= 0
        Actor currAct = akTargetColl.GetAt(i) as Actor

        if currAct != none && !currAct.IsDead() &&  currAct.IsEnabled()
            Utility.Wait(Utility.RandomFloat(0.0, MaxStaggerTime))
            currAct.EvaluatePackage()
        endif

        akTargetColl.RemoveRef(currAct)

        i -= 1
    endwhile
EndFunction