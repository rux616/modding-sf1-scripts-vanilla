Scriptname DLC03:SFTA00AliasFollowerObjectiveScript extends ReferenceAlias

Float Property GreaterDistance = 200.0 Const Auto
Float Property LesserDistance = 30.0 Const Auto
Int Property FollowerObjective Mandatory Const Auto
Int Property TurnOffStageDone Mandatory Const Auto


Function StartFollow()
    RegisterGreaterThan()
EndFunction

Function RegisterGreaterThan()
    RegisterForDistanceGreaterThanEvent(GetActorRef(), Game.GetPlayer(), GreaterDistance)
EndFunction

Function RegisterLessThan()
    RegisterForDistanceLessThanEvent(GetActorRef(), Game.GetPlayer(), LesserDistance)
EndFunction

Function Unregister()
    UnregisterForDistanceEvents(GetActorRef(), Game.GetPlayer())
EndFunction


;When the player gets out of range of their follower, display the objective to return to them.
Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    Quest myQuest = GetOwningQuest()
    If !myQuest.GetStageDone(TurnOffStageDone)
        myQuest.SetObjectiveDisplayed(FollowerObjective, True, True)
        RegisterLessThan()
    EndIf

EndEvent

;When the player gets into range of their follower, remove the objective to return to them.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    Quest myQuest = GetOwningQuest()
    If !myQuest.GetStageDone(TurnOffStageDone)
        myQuest.SetObjectiveDisplayed(FollowerObjective, False)
        RegisterGreaterThan()
    EndIf
EndEvent