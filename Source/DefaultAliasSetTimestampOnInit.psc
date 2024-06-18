Scriptname DefaultAliasSetTimestampOnInit extends ReferenceAlias const default
{sets a specified AV as a timestamp (with a specified offset from current time) OnAliasInit}

ActorValue property TimestampAV auto const mandatory
{ actor value used to stamp GameDaysPassed + TimestampOffset on the ref in this alias }

float property TimestampOffset = 0.0 auto Const
{ how much to add to GameDaysPassed when setting TimestampAV }

Event OnAliasInit()
    ObjectReference myRef = GetRef()
    float timestamp = Utility.GetCurrentGameTime() + TimestampOffset
    myRef.SetValue(TimestampAV, timestamp)
EndEvent