Scriptname DefaultContainerAddRefsOnLoad extends ObjectReference Default
{On cell load, find all of the refs linked to or from this container with LinkAddItem, and add those items to the container.}

Group AutofillProperties
	Keyword property LinkAddItem Auto Const Mandatory
EndGroup

Auto State Waiting
	Event OnCellLoad()
		GoToState("Done")
		ObjectReference[] linkedRefs = GetLinkedRefChain(LinkAddItem)
		int i = 0
		While (i < linkedRefs.Length)
			AddItem(linkedRefs[i])
			i = i + 1
		EndWhile
		ObjectReference[] refsLinkedToMe = GetRefsLinkedToMe(LinkAddItem)
		i = 0
		While (i < refsLinkedToMe.Length)
			AddItem(refsLinkedToMe[i])
			i = i + 1
		EndWhile
	EndEvent
EndState

State Done
EndState