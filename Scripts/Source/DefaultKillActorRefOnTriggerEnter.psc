Scriptname DefaultKillActorRefOnTriggerEnter extends ObjectReference Const
{Kills the selected reference when it enters this trigger, then disables/deletes the trigger.}

ObjectReference Property ActorReferenceToKill Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == ActorReferenceToKill
    	(akActionRef as Actor).Kill()
    	self.Disable()
    	self.Delete()
    endif
EndEvent