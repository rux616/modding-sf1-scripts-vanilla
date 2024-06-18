Scriptname SignalReceiver_TestPipeGasSpray extends SignalReceiverScript

Group CustomReceiveSignal_Properties
	Keyword Property Signal_SwitchOn Mandatory Const Auto
	Keyword Property Signal_SwitchOff Mandatory Const Auto
	Keyword Property Signal_ObjectDamaged Mandatory Const Auto
	
	Message Property TestSprayMessage Mandatory Const Auto
EndGroup


bool SwitchOn
bool Damaged
bool IsSpraying

;Override in children scripts
;SignalParameters will contain members whose values represent the various that came in from the Event that triggered the Signal being sent.
;See each SignalSenderScript child script for details.
Function ReceiveSignalCustom(SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "ReceiveSignalCustom() SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)

	IsSpraying = false

	if SignalSignature.Signal == Signal_SwitchOn
		SwitchOn = true
		SprayIfAppropriate()
	elseif SignalSignature.Signal == Signal_SwitchOff
		SwitchOn = false
		SprayIfAppropriate()
	elseif SignalSignature.Signal == Signal_ObjectDamaged
		Damaged = true
		SprayIfAppropriate()
	endif

EndFunction


Function SprayIfAppropriate()
	Trace(self, "SprayIfAppropriate() SwitchOn: " + SwitchOn + ", Damaged: " + Damaged)

	If SwitchOn && Damaged
		IsSpraying = true

		;example of HandleCustomResult - you would do more here than just show a message.
		TestSprayMessage.Show()
	Else
		IsSpraying = false
	EndIf

EndFunction


;Override in children scripts
;SignalParameters will contain members whose values represent the various that came in from the Event that triggered the Signal being sent.
;See each SignalSenderScript child script for details.
Function HandleCustomResult(Result Result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "ReceiveSignalRef() SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)

	;example of HandleCustomResult, not nessassarily the best way to do this.
	If IsSpraying && SignalSignature.Signal == Signal_SwitchOff
		(Result.FormParam1 as Message).Show()
	EndIf

EndFunction
