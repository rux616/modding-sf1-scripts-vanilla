Scriptname DefaultAliasReadWhileSittingScript extends ReferenceAlias Const Default
{script to get an NPC to read in a chair}

Package[] Property ReadingPackages Auto Const
{ list of packages where you want the NPC reading while sitting}

Idle Property IdleBookReadStart const auto

Event OnSit(ObjectReference akFurniture)
	debug.trace(self + " OnSit " + akFurniture)
	Actor theActor = GetActorRef()
	if theActor
	    Package currentPackage = GetActorRef().GetCurrentPackage()
	    int packageIndex = ReadingPackages.Find(currentPackage)
	    if packageIndex > -1
	    	debug.trace(self + " found valid package, start reading")
	    	; valid package, so make me read
	    	theActor.PlayIdle(IdleBookReadStart)
	    endif
	endif
EndEvent
