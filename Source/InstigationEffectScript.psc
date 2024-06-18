Scriptname InstigationEffectScript extends ActiveMagicEffect Const
{cancel effect on bleedout for essential actors}

Event OnEnterBleedout()
    Actor akTarget = GetTargetActor()
    debug.trace(self + " OnEnterBleedout on " + akTarget)
    if akTarget && akTarget.IsEssential()
        ; dispel this effect
        Dispel()
    endif
EndEvent

