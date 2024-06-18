Scriptname CF05_TerminalActivationScript extends ReferenceAlias

{Script to prevent player from taking item that Guard is standing right in front of}

Scene Property BlockingScene Auto Const Mandatory

Int Property AlarmStage Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Float Property DistanceCheck = 8.0 Auto Const

Faction Property LC043SY01Faction Auto Const Mandatory

Event OnAliasInit()
    GetRef().BlockActivation(true, false)
EndEvent


Event OnActivate(ObjectReference akActionRef)
    Quest myQuest = GetOwningQuest()
    Actor PlayerRef = Game.GetPlayer()
    if akActionRef == PlayerRef
        if !PlayerRef.IsInFaction(LC043SY01Faction) && !myQuest.GetStageDone(AlarmStage) && GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck
            BlockingScene.Start()
        else
            GetRef().Activate(PlayerRef, true)
        endif
    endif
endEvent

