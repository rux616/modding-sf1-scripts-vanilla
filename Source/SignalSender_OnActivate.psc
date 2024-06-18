Scriptname SignalSender_OnActivate extends SignalSenderScript
{Sends a Signal to SignalReceiverScripts.

SignalParameters.Ref1 = akActionRef  (from OnActivate event)

ConditionReferences.Subject = self
ConditionReferences.Target = akActionRef  (from OnActivate event)

}

Event OnActivate(ObjectReference akActionRef)
	SignalParameters signalParameters = new SignalParameters
	signalParameters.Ref1 = akActionRef

	ConditionReferences conditionReferences = new ConditionReferences
	conditionReferences.Subject = self
	conditionReferences.Target = akActionRef

	SendSignal(signalParameters, conditionReferences)
EndEvent