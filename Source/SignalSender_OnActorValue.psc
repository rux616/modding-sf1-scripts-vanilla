Scriptname SignalSender_OnActorValue extends SignalSenderScript
{Sends a Signal to SignalReceiverScripts

SignalParameters.Ref1 = self
SignalParameters.AV1 = TargetAV

ConditionReferences.Subject = self
ConditionReferences.Target = self

}

Group AdditionalData
	bool Property DoOnce = true Const Auto
	{Default: true; If false will re-up the registration for the actorvalue event}
	
	int Property ChangeTypeEnum = 1 Const Auto 
{The type of actorvalue 
0 = OnActorValueLessThan				= 0 const 
1 = OnActorValueLessThanOrEqualTo		= 1 const ;default
2 = OnActorValueChange					= 2 const 
3 = OnActorValueGreaterThanOrEqualTo	= 3 const 
4 = OnActorValueGreaterThan				= 4 const 

* NOTE: the OrEqualTo events are being faked right now by adding/subtracting .001 to the requested value until we have those events proper
GEN-296056 Papyrus: Actor value greater/less than events should have a "equals" option
}

	ActorValue Property TargetAV Mandatory Const Auto
	{the ActorValue to watch}


	float Property TargetValue Mandatory Const Auto
	{Value needed to send Signal}

EndGroup

;ChangeTypeEnum
int Property iChangeType_OnActorValueLessThan 				= 0  	AutoReadOnly 
int Property iChangeType_OnActorValueLessThanOrEqualTo 		= 1  	AutoReadOnly ;default
int Property iChangeType_OnActorValueChange 				= 2  	AutoReadOnly 
int Property iChangeType_OnActorValueGreaterThanOrEqualTo	= 3  	AutoReadOnly 
int Property iChangeType_OnActorValueGreaterThan			= 4  	AutoReadOnly 


State Done
	Event OnLoad()
		Trace(self, "OnLoad() in Done state. Doing nothing.")
	EndEvent

	Function RegisterForOnAVEvent()
		Trace(self, "RegisterForOnAVEvent() in Done state. Doing nothing.")
	EndFunction
EndState


Event OnLoad()
	Trace(self, "OnLoad() ")
	RegisterForOnAVEvent()
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
	CreateParmsAndSendSignalAndRegisterForEvent()
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
	CreateParmsAndSendSignalAndRegisterForEvent()
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
	CreateParmsAndSendSignalAndRegisterForEvent()	
EndEvent


Function RegisterForOnAVEvent()
	Trace(self, "RegisterForOnAVEvent() TargetAV: " + TargetAV + ", TargetValue: " + TargetValue)

	float value = TargetValue

	if ChangeTypeEnum ==  iChangeType_OnActorValueLessThan
		RegisterForActorValueLessThanEvent(self, TargetAV, value)

	elseif ChangeTypeEnum == iChangeType_OnActorValueLessThanOrEqualTo
		;TO DO change after:
		;GEN-296056 Papyrus: Actor value greater/less than events should have a "equals" option
		value += 0.001
		RegisterForActorValueLessThanEvent(self, TargetAV, value)
	
	elseif ChangeTypeEnum == iChangeType_OnActorValueChange
		RegisterForActorValueChangedEvent(self, TargetAV)
	
	elseif ChangeTypeEnum == iChangeType_OnActorValueGreaterThanOrEqualTo
		;TO DO change after:
		;GEN-296056 Papyrus: Actor value greater/less than events should have a "equals" option
		value -= 0.001 
		RegisterForActorValueGreaterThanEvent(self, TargetAV, value)
	
	elseif ChangeTypeEnum == iChangeType_OnActorValueGreaterThan
		RegisterForActorValueGreaterThanEvent(self, TargetAV, value)
	
	else
		Warning(self, "RegisterForOnAVEvent() found an unexpected value for ChangeTypeEnum. Can't register for event!")
	
	endif

EndFunction


Function CreateParmsAndSendSignalAndRegisterForEvent()
	SignalParameters signalParameters = new SignalParameters
	signalParameters.Ref1 = self
	signalParameters.AV1 = TargetAV


	ConditionReferences conditionReferences = new ConditionReferences
	conditionReferences.Subject = self
	conditionReferences.Target = self

	SendSignal(signalParameters, ConditionReferences)
	
	if DoOnce
		GotoState("Done")
	endif

	RegisterForOnAVEvent()
EndFunction

