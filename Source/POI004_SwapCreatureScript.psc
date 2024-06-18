Scriptname POI004_SwapCreatureScript extends ObjectReference

Keyword property POI004_MoltingShellKeyword auto const
Keyword property POI004_HiddenCreatureKeyword auto const

bool swapActivated = false

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == Game.GetPlayer() && !swapActivated)
        ObjectReference moltingShell = GetLinkedRef(POI004_MoltingShellKeyword)
        ObjectReference hiddenCreature = GetLinkedRef(POI004_HiddenCreatureKeyword)

        moltingShell.Disable()
        hiddenCreature.Enable()

        swapActivated = true
    endIf
EndEvent