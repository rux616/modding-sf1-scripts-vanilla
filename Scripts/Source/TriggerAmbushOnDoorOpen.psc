Scriptname TriggerAmbushOnDoorOpen extends ObjectReference Const

Event OnOpen(ObjectReference akActionRef)
    DefaultRefAmbushTrigger2 ambushTriggerVolume = GetLinkedRef() as DefaultRefAmbushTrigger2

    ambushTriggerVolume.TriggerAmbush()
EndEvent