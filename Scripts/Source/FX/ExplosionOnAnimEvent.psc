Scriptname FX:ExplosionOnAnimEvent extends ObjectReference Const
{Place an explosion on an animation event}

String[] Property sAnimEventList Auto Const Mandatory
Explosion Property PlacedExplosion Auto Const Mandatory


Function PlaceExplosion(Explosion PlacedExplosionRef)
	self.PlaceAtMe(PlacedExplosionRef)
EndFunction

Event OnLoad()
	if (Self.Is3DLoaded())
		int i = 0
		while (i < sAnimEventList.length)
			RegisterForAnimationEvent(self, sAnimEventList[i])
			i += 1
		EndWhile
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if sAnimEventList.Find(asEventName) < 0
	  return
	else
	  PlaceExplosion(PlacedExplosion)
	endIf
EndEvent

Event OnUnLoad()
	int i = 0
	while (i < sAnimEventList.length)
		UnRegisterForAnimationEvent(self, sAnimEventList[i])
		i += 1
	EndWhile
EndEvent