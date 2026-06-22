Scriptname LC165MarkerLoadedScript extends ObjectReference
{Script for a marker. On load, sets LC165MarkerLoadedValue to 1, to flag that the marker has been loaded at least once before.}

ActorValue property LC165MarkerLoadedValue Auto Const Mandatory

Auto State Initial
    Event OnLoad()
        GoToState("Done")
        SetValue(LC165MarkerLoadedValue, 1)
    EndEvent
EndState

State Done
EndState