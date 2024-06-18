Scriptname CF05_ActivateCardScript extends ReferenceAlias

{Script to prevent player from taking item that Guard is standing right in front of}

Scene Property BlockingScene Auto Const Mandatory

Int Property StageToCheck Auto Const Mandatory

Int Property AlarmStage Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Faction Property LC043SY01Faction Auto Const Mandatory

Float Property DistanceCheck = 4.0 Auto Const

Auto State Waiting
Event OnAliasInit()
    GetRef().BlockActivation(true, false)
EndEvent


Event OnActivate(ObjectReference akActionRef)
    GotoState("Busy")
    Quest myQuest = GetOwningQuest()
    if !myQuest.GetStageDone(StageToCheck) && !myQuest.GetStageDone(AlarmStage) && GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck && !Game.GetPlayer().IsinFaction(LC043SY01Faction)
        BlockingScene.Start()
        GoToState("Waiting")
    else
        Game.GetPlayer().AddItem(GetRef())
    endif
endEvent
EndState

State Busy
endState
