Scriptname LC102PassengerCombatStateChangeScript extends RefCollectionAlias

int property StageToSet auto Const

auto State Waiting

    Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)
        GotoState("Done")
        Quest owningQuest = GetOwningQuest()
        owningQuest.SetStage(StageToSet)
    EndEvent
EndState

State Done
  Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)
  EndEvent
EndState