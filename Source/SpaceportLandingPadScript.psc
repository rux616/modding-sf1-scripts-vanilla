Scriptname SpaceportLandingPadScript extends ObjectReference 
{Script for driving the animation of both the main elevator and the exit lounges.}

float Property OffsetDistance = 8.0 auto const 
Static Property xMarker auto const
ObjectReference Property elevatorRef auto const

ObjectReference LastRaisedExit
bool elevatorIsUp = True

Activator selfAsActivator

Event onTriggerEnter(objectReference triggerRef)

	selfAsActivator = self.GetBaseObject() as Activator

	Debug.Trace("Landing Pad Trigggered by: " + triggerRef)

	if triggerRef == Game.GetPlayer()
		ObjectReference bestExit = GetBestExitLounge()

		Debug.Trace("Best Elevator Ref is: " + bestExit)

		;Handle the temp elevator logic.
		if bestExit == LastRaisedExit
			bestExit.PlayAnimation("Stage1")
			LastRaisedExit = none
		Elseif LastRaisedExit
			bestExit.PlayAnimation("Stage2")
			LastRaisedExit.PlayAnimation("Stage1")
			LastRaisedExit = bestExit
		Else
			bestExit.PlayAnimation("Stage2")
			LastRaisedExit = bestExit
		endif

		if elevatorIsUp == True
			elevatorIsUp = False
			elevatorRef.PlayAnimation("Stage2")
		EndIf
	EndIf
EndEvent

; Find the best (closest) exit lounge that is not colliding with anything.
ObjectReference Function GetBestExitLounge() 

	ObjectReference[] LinkedRefs = GetRefsLinkedToMe()
	ObjectReference player = game.getplayer()
	ObjectReference markerLocation = Player.PlaceAtMe(xMarker)

	Float posX = player.GetPositionX()
	Float posY = player.GetPositionY()
	Float playerAngle = player.GetAngleZ()

	markerLocation.SetPosition( (posX + math.sin(playerAngle) * OffsetDistance), (posY + (math.cos(playerAngle) * OffsetDistance)), player.GetPositionZ() )

;TODO: Need to test collision, but it is breaking things in the animated prototype.

	int j = LinkedRefs.length - 1  ;Loop backwards because we are attempting to remove things from the array as we go.
	while (j >= 0)
		bool isRemoved = False
		if LinkedRefs[j].GetTriggerObjectCount() > 0
			LinkedRefs.remove(j)
			isRemoved = True
		EndIf
		Debug.Trace("The object count in the trigger " + j + " is " + LinkedRefs[j].GetTriggerObjectCount() + " therefore the activation of the elevator is " + !isRemoved)
		j -= 1
	endwhile

	ObjectReference ClosestRef = LinkedRefs[0]

	int i = 1 ;Starting at 1 since 0 is the default.
	while (i < LinkedRefs.length)
		;Debug.Trace("Linked Refs include: " + LinkedRefs[i])
		ClosestRef = CloserOfTwo(markerLocation, LinkedRefs[i], ClosestRef)
		i += 1
	endwhile
	return ClosestRef

	markerLocation.Delete()
EndFunction

;/ Function CalculateHeadingOffset(float angle, float OffsetDistance, float posX, float posY)
	posX += math.sin(angle) * OffsetDistance
	posY += math.cos(angle) * OffsetDistance
EndFunction /;

;/ Float Function GetXYPosDistance(float x1, float y1, float x2, float y2)

EndFunction  /;

ObjectReference Function CloserOfTwo(ObjectReference TestRef, ObjectReference a, ObjectReference b)
	float distA = TestRef.GetDistance(a)
	if Math.Min(distA, TestRef.GetDistance(b)) == distA
		return a
	Else
		return b
	endif
EndFunction

