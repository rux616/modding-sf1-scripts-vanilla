Scriptname UC09_InvasivePestRefScript extends UC09_HeatleechRefScript

Keyword property ActorTypeHeatleech Auto Const Mandatory
{Heetleech keyword.}

Event OnCellLoad()
    if (HasKeyword(ActorTypeHeatleech))
        Parent.OnCellLoad()
    EndIf
EndEvent