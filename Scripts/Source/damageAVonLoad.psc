Scriptname damageAVonLoad extends ObjectReference Const
{NOTE - Not ready for primetime.  Right now this just cripples both legs on load...}

ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const


Event OnLoad()
    damageValue(LeftMobilityCondition,100)
    damageValue(RightMobilityCondition,100)
EndEvent
