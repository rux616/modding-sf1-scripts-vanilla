Scriptname LC088_Key_RestrainingRefScript extends ObjectReference
{In LC088_Key, script for objects that are restraining actors.}
;
;In LC088_Key, actors are linked to objects with LC088_Key_LinkRestraintKeyword, and given Stay At Self Ignore Combat packages as long as they have those links.
;The restraining objects have this script. When they are entered (triggers), opened, or activated, we remove the links and release the actors.

Keyword property LC088_Key_LinkRestraintKeyword Auto Const Mandatory

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		ReleaseRestraint()
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		ReleaseRestraint()
	EndEvent

	Event OnOpen(ObjectReference akActionRef)
		ReleaseRestraint()
	EndEvent

	Function ReleaseRestraint()
		GoToState("Done")
		ObjectReference[] restrainedRefs = GetRefsLinkedToMe(LC088_Key_LinkRestraintKeyword)
		int i = 0
		While (i < restrainedRefs.Length)
			Actor currentActor = restrainedRefs[i] as Actor
			LC088_Key_RestrainingRefScript currentRestrainingRef = restrainedRefs[i] as LC088_Key_RestrainingRefScript
			if (currentActor != None)
				currentActor.SetLinkedRef(None, LC088_Key_LinkRestraintKeyword)
				currentActor.EvaluatePackage()
			ElseIf (currentRestrainingRef != None)
				currentRestrainingRef.ReleaseRestraint()
			EndIf
			i = i + 1
		EndWhile
	EndFunction
EndState

State Done
	;Do nothing.
EndState


Function ReleaseRestraint()
	;Do nothing.
EndFunction