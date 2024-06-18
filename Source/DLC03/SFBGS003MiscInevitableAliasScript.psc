Scriptname DLC03:SFBGS003MiscInevitableAliasScript extends ReferenceAlias

Float Property DistanceToPlayerLessThan = 25.0 Const Auto
Float Property DistanceToPlayerGreaterThan = 30.0 Const Auto

Event OnAliasInit()
    RegisterForDistanceLessThanEvent(GetActorRef(), Game.GetPlayer(), DistanceToPlayerLessThan)
EndEvent

;Force Inevitable to evaluate her package so she delivers her line more promptly.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    Quest myQuest = GetOwningQuest()
    If !myQuest.GetStageDone((myQuest as SFBGS003MiscPointerQuestScript).InevitableSpokenToStage)
        Actor myPlayer = Game.GetPlayer()
        If akObj1 == myPlayer || akObj2 == myPlayer
            Actor myInevitable = GetActorRef()
            myInevitable.EvaluatePackage()
            RegisterForDistanceGreaterThanEvent(GetActorRef(), Game.GetPlayer(), DistanceToPlayerGreaterThan)
        EndIf
    EndIf
EndEvent


Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    RegisterForDistanceLessThanEvent(GetActorRef(), Game.GetPlayer(), DistanceToPlayerLessThan)
    Actor myInevitable = GetActorRef()
    myInevitable.EvaluatePackage()
EndEvent
