Scriptname OE_MissionTerminalAliasScript extends ReferenceAlias

State Done
    Event OnActivate(ObjectReference akActionRef)
    EndEvent
EndState

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        GotoState("Done")
        (GetOwningQuest() as OE_MissionTerminalQuestScript).PlayerActivateMissionTerminal()
    endif
EndEvent
