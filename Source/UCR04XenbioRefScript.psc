Scriptname UCR04XenbioRefScript extends Actor Const

Keyword Property UCR04XenoBiologistActive Mandatory Const Auto
{Keyword applied to this NPC if they're actively in UCR04. If they don't have it, they shouldn't be standing around}

Event OnUnload()
    if IsEnabled() && !HasKeyword(UCR04XenoBiologistActive)
        Disable()
    endif
EndEvent