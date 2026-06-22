Scriptname UC08_SupplyCacheCollTriggerScript extends RefCollectionAlias

int Property AccessCachesObjIndex = 335 Const Auto
{Objective index for the "Access the supply caches" objective. We'll turn that off when the player has no
unexplored caches}

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        RemoveRef(akSenderRef)

        if GetCount() <= 0
            GetOwningQuest().SetObjectiveDisplayed(AccessCachesObjIndex, false, false)
        endif
    endif
EndEvent