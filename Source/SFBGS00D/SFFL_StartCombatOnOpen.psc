Scriptname SFBGS00D:SFFL_StartCombatOnOpen extends ObjectReference
{Tells the linked ref to start combat with specific actor by their own linked ref}

Keyword Property TargetActorKeyword Auto Const Mandatory

Auto State Ready
    Event OnOpen(ObjectReference akActionRef)

    GotoState("Busy") ;since this needs to happen only once, send this script into a busy state and leave it there
        
        Actor targetActor = getlinkedRef(TargetActorKeyword) as Actor
        if(targetActor != None)
            targetActor.StartCombat(targetActor.getLinkedRef(TargetActorKeyword) as Actor)
        endif
    EndEvent
EndState

State Busy
    Event OnOpen(ObjectReference akActionRef)
        ;do nothing
    EndEvent
EndState