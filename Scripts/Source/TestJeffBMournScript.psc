Scriptname TestJeffBMournScript extends Actor Conditional

Bool Property isParentDead = FALSE Auto Conditional
Bool Property amParent = FALSE Auto
;ObjectReference Property myParent Auto
Keyword Property myKeyword Auto

Actor myParent
Actor player
Event OnLoad()
	if(amParent == FALSE)
		myParent = getLinkedRef(myKeyword) as Actor
		RegisterForRemoteEvent(myParent, "OnDeath")
	EndIf
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akActionRef)
	isParentDead = True
	stopcombat()
	EvaluatePackage()
endEvent