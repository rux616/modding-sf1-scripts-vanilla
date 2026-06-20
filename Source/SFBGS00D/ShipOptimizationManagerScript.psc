Scriptname SFBGS00D:ShipOptimizationManagerScript extends Quest
{Script that manages Ship Optimizations on the player.}

;Properties
ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto
Perk[] Property ShipOptimizationPerks Mandatory Const Auto

Event OnQuestInit()
    RegisterForActorValueChangedEvent(Game.GetPlayer(), PlayerUnityTimesEntered)
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
    ;Removes Ship Optimization Perks from the player when they go through the unity
    int i = 0
    If (akObjRef == Game.GetPlayer() && akActorValue == PlayerUnityTimesEntered)
        While (i < ShipOptimizationPerks.Length)
            Game.GetPlayer().RemovePerk(ShipOptimizationPerks[i])
            i += 1
        EndWhile
    EndIf
EndEvent