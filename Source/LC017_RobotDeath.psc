Scriptname LC017_RobotDeath extends Actor Const
{Set Linked References to Unconcious On Death}

Keyword Property LinkRobotToTurret Const Auto

Event OnDeath(ObjectReference akKiller)
    ObjectReference[] LinkedRefs
    if(LinkRobotToTurret)
        LinkedRefs = GetLinkedRefChain(LinkRobotToTurret)
    Else
        LinkedRefs = GetLinkedRefChain()
    endif

    int i = 0
    while (i < LinkedRefs.length)
        (LinkedRefs[i] as Actor).SetUnconscious()
        i += 1
    endwhile
EndEvent