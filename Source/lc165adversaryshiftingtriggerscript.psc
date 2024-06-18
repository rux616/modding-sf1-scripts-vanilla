Scriptname LC165AdversaryShiftingTriggerScript extends ObjectReference
{Script for the shifting triggers during the Adversary Battle in LC165, Buried Temple.}

Group ReferenceProperties
	String property ShiftName Auto Const ;MandatoryOnRef
	{The name of the shift this trigger was associated with.}

	bool property ShouldShiftPlayer = True Auto Const
	{Optional. Should this trigger shift the player and their allies if they enter it?}

	bool property ShouldShiftAdversary = True Auto Const
	{Optional. Should this trigger shift the adversaries if they enter it?}

	bool property ShouldShiftOtherActors = True Auto Const
	{Optional. Should this trigger shift other actors if they enter it?}

	bool property ShouldPlayVFXForOtherActors = True Auto Const
	{Optional. Should this trigger play the shifting vfx when shifting other actors?}
EndGroup

Group AutofillProperties CollapsedOnRef
	LC165QuestScript property MQ302B Auto Const Mandatory
EndGroup

Event OnTriggerEnter(ObjectReference akTriggerRef)
	MQ302B.StarbornAdversaryShiftingTriggerEntered(self, akTriggerRef as Actor, GetLinkedRef())
EndEvent