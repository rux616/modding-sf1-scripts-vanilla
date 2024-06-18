Scriptname City_GG_Mark_QuestScript extends Quest

ReferenceAlias Property Bonifac Mandatory Const Auto
ReferenceAlias Property Maldonado Mandatory Const Auto

Function StopCombatOnNPCs()
    Game.GetPlayer().StopCombat()
    Actor BonACT = Bonifac.GetActorRef()
    BonACT.StopCombatAlarm()
    BonACT.StopCombat()
    Actor MalACT = Maldonado.GetActorRef()
    MalACT.StopCombatAlarm()
    MalACT.StopCombat()
EndFunction