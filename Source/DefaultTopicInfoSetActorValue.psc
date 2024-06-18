Scriptname DefaultTopicInfoSetActorValue extends TopicInfo Const Default
{Sets or mods an actor value on the topic info target and/or on the player}

Group Data
bool Property OnEnd = true Auto Const
{Set to true if you want this to fire on the of the line. Otherwise, it'll trigger on start}

bool Property SetOnSpeaker = true Auto Const
{Set to true if you want the value to be set on the line's speaker.}

bool Property SetOnPlayer = false Auto Const
{Set to true if you want the value to be set on the line's player.

NOTE: topic infos in scenes will NOT have a target.}

ActorValue Property ValueToModify Auto Const Mandatory
{ The Actor Value to set }

float Property NewValue = 1.0 Auto Const
{The new value for the given actor value}

bool Property SetActorValueToNewValue = true auto const
{
                TRUE = will call SetValue(ValueToModify, newValue)
                FALSE = will call ModValue(ValueToModify, newValue)
}
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    debug.trace(self + " OnBegin: onEnd=" + onEnd)
    if !OnEnd
        HandleActorValueChange(akSpeakerRef)
    endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    debug.trace(self + " OnEnd: onEnd=" + onEnd)
    if OnEnd
        HandleActorValueChange(akSpeakerRef)
    endif
EndEvent

Function HandleActorValueChange(ObjectReference akSpeakerRef)
    debug.trace(self + " HandleActorValueChange")
    if SetOnSpeaker
        ChangeActorValue(akSpeakerRef)
    endif

    if SetOnPlayer
        ChangeActorValue(Game.GetPlayer())
    endif
EndFunction

function ChangeActorValue(ObjectReference refToModify)
    debug.trace(self + " ChangeActorValue " + refToModify + " SetActorValueToNewValue=" + SetActorValueToNewValue + " NewValue=" + NewValue)
    if SetActorValueToNewValue
        refToModify.SetValue(ValueToModify, NewValue)
    else
        refToModify.ModValue(ValueToModify, NewValue)
    endif
EndFunction
