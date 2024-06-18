Scriptname EnableDisableOnItemRemoved extends ObjectReference 
{Enables or disables this object's linked ref when an item is removed from this container.}

Group Optional_Properties
	Keyword Property LinkKeyword Auto Const
	{If set, enable or disable the link with this keyword. Defaults to NONE.}

	Bool Property ShouldEnable = TRUE Auto Const
	{Default=TRUE. Should we disable or enable the linked ref?}

	Bool Property doOnce = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this will only run once.}

EndGroup

Auto State Waiting

Event onLoad()
	AddInventoryEventFilter(none)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
		if (ShouldEnable)
			Self.GetLinkedRef(LinkKeyword).Enable()
		Else
			Self.GetLinkedRef(LinkKeyword).Disable()
		EndIf
		if doOnce == TRUE
			gotoState("Done")
			RemoveInventoryEventFilter(none)
		endif
EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActionRef)
		;Do Nothing
	endEvent
EndState