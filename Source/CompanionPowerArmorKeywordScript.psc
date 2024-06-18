Scriptname CompanionPowerArmorKeywordScript extends Actor Const

Keyword Property pAttachPassenger Auto Const
Keyword Property pAttachSlot2 Auto Const
Keyword Property isPowerArmorFrame Auto Const

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)

	debug.trace("Putting on power armor")

	if akBaseObject.HasKeyword(isPowerArmorFrame) == 1
		debug.trace("Swapping vertibird seat keywords")		
		RemoveKeyword(pAttachPassenger)
		AddKeyword(pAttachSlot2)
	endif

endEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)

	if akBaseObject.HasKeyword(isPowerArmorFrame) == 1
		debug.trace("Swapping vertibird seat keywords back")		
		RemoveKeyword(pAttachSlot2)
		AddKeyword(pAttachPassenger)
	endif

endEvent