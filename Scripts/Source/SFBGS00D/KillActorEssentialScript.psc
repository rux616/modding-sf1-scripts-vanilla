Scriptname SFBGS00D:KillActorEssentialScript extends ObjectReference Const
{Kills the selected reference when it enters this trigger, then disables/deletes the trigger.}

ReferenceAlias Property ActorReferenceToKill Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == ActorReferenceToKill.GetRef()
    	(akActionRef as Actor).KillEssential()
	Game.AddAchievement(80)
    	self.Disable()
    	self.Delete()
    endif
EndEvent