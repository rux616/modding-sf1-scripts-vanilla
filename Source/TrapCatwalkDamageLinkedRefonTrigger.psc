Scriptname TrapCatwalkDamageLinkedRefonTrigger extends ObjectReference Const
{Damages linked object when trigger is entered.}

float Property damageAmount = 200.0 Const Auto
WwiseEvent Property WwiseEvent_TRP_Catwalk_Creak_OneShot Const Auto
float Property TimeToBreak = 0.5 Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    WwiseEvent_TRP_Catwalk_Creak_OneShot.Play(GetLinkedRef())
    debug.trace(self + " Catwalk Damage Trigger Entered")
    StartTimer(TimeToBreak)
EndEvent

Event OnTimer(int aiTimerID)
    GetLinkedRef().DamageObject(damageAmount)
    self.disable()
EndEvent

