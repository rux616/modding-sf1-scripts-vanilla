Scriptname SignalSenderScript extends ObjectReference hidden
{Sends signals to ObjectReferences with SignalReceiverScripts attached.

This script must be extended and call SendSignal from an event that should trigger the signal to be sent.}


Struct SignalSignature
;defines the main signature of a signal
;it will be constructed out of properties, packaged into this struct, then sent

	SignalSenderScript SendingRef

	keyword Signal

EndStruct

;Packages up parameters to go with the signal.
;Usually these are params from the Events that are triggering the Signal to be sent, as such you can infer their values from event params
;Detailed documentation will be found on the SignalSenderScript children that are sending the event.
Struct SignalParameters
	ObjectReference Ref1
	ActorValue AV1
EndStruct

;Used by children of SignalSenderScript to define which reference's they consider the Subject and Target of Conditions that should be run for them
Struct ConditionReferences
	ObjectReference Subject
	ObjectReference Target
EndStruct

struct SignalToSend
	keyword Signal
	ConditionForm Conditions
{optional: condition form that must be true before sending this signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form.}
endstruct


Group Signals
	int Property ListTypeEnum = 0 Const Auto 
{0 = Sequence (repeating)
1 = Stack [NOT IMPLEMENTED]
2 = Simultaneous [NOT IMPLEMENTED]}

	SignalToSend[] Property SignalsToSend Mandatory Const Auto
	{list of keywords (signals) and conditions (that must be true to send)}

	ConditionForm Property Conditions Const Auto
{optional: condition form that must be true before attempting to send any signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form.}

EndGroup

Group ReceiverConnection collapsed
{Sends to linkedRef by default... for additional settings DOUBLE LEFT-CLICK!}

	int Property ReceiverTypeEnum = 0 Const Auto 
;What kind of connection do we have to the Receiver?
{0 = LinkedRef  (default)
 1 = LinkedRefChain
 2 = LinkedRefChildren
 3 = Self (send to object THIS script is attached to) 
 4 = Self *AND* LinkedRef
 }

	keyword Property LinkedRefKeyword Const Auto
{optional: keyword for defining which LinkedRef(Chain) or LinkedRefChildren to send signal to.
Meaningless if ReceiverTypeEnum == 3 (self)}
EndGroup


;ReceiverTypeEnum
int Property iReceiverType_LinkedRef 			= 0  	AutoReadOnly ;default
int Property iReceiverType_LinkedRefChain 		= 1  	AutoReadOnly
int Property iReceiverType_LinkedRefChildren	= 2  	AutoReadOnly
int Property iReceiverType_Self 				= 3  	AutoReadOnly
int Property iReceiverType_SelfAndLinkedRef		= 4  	AutoReadOnly


;ListTypeEnum
int Property iListType_Sequence 	= 0  	AutoReadOnly ;default (repeating)
int Property iListType_Stack 		= 1  	AutoReadOnly ;NOT YET IMPLEMENTED - requires condition form
int Property iListType_Simultaneous	= 2  	AutoReadOnly ;NOT YET IMPLEMENTED - requestions condition form


int previousSignalIndex = -1

Event OnInit()
	Trace(self, "OnInit()")
EndEvent

;Will call ReceiverSignal() on its Receiver(s). SignalParameters can be None, but it is not optional so that children script writers remember that is a thing thay can do. Pass in None if there are no paramters to send.
Function SendSignal(SignalParameters SignalParameters, ConditionReferences ConditionReferences)
	Trace(self, "SendSignal() SignalParameters: " + SignalParameters + ", ConditionReferences: " + ConditionReferences)
	
	if Conditions == None || Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target)
		
		SignalToSend signalToSend = SignalsToSend[GetNextSignalIndex()] 
		Trace(self, "SendSignal signalToSend: " + signalToSend)

		;check specific signal conditions before sending...
		if signalToSend.Conditions == None || signalToSend.Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target)
			SignalSignature signalSignature = new SignalSignature
			signalSignature.SendingRef = self
			signalSignature.Signal = signalToSend.Signal
			Trace(self, "SendSignal() signalSignature: " + signalSignature + ", SignalParameters: " + SignalParameters)

			ObjectReference[] receiverRefs = GetPossibleReceiverRefs()
			Trace(self, "SendSignal() receiverRefs: " + receiverRefs)

			int i = 0
			While (i < receiverRefs.length)
				;here we cast things (which might be ObjectReferences withouth the SignalReceiverScript attached)
				SignalReceiverScript currentReceiverRef = receiverRefs[i] as SignalReceiverScript
				
				if currentReceiverRef  ;could be NONE if not castable to SignalReceiverScript
					Trace(self, "SendSignal() sending to currentReceiverRef: " + currentReceiverRef)
					currentReceiverRef.ReceiveSignal(SignalSignature, SignalParameters)
				endif

				i += 1
			EndWhile
		else
			Trace(self, "SendSignal() signalToSend.Conditions are not true. NOT sending signalToSend: " + signalToSend)
		endif
	else
		Trace(self, "SendSignal() Main Conditions are not true. NOT sending ANY signals. ")
	endif
	
EndFunction

int Function GetNextSignalIndex()
	Trace(self, "GetNextSignalIndex() ListTypeEnum: " + ListTypeEnum)

	int iNext = 0
	if ListTypeEnum == iListType_Sequence
		iNext = (previousSignalIndex + 1) % SignalsToSend.Length  ;constrains iNext to be 0 thru Length-1
	else
		Warning(self, "GetNextSignalIndex() found unexpected ListTypeEnum: " + ListTypeEnum)
	endif

	previousSignalIndex = iNext

	Trace(self, "GetNextSignalInded() returning iNext: " + iNext)
	return iNext

EndFunction

;POSSIBLE because these aren't yet cast to SignalReceiverScript
ObjectReference[] Function GetPossibleReceiverRefs()
	ObjectReference[] receiverRefs

	if ReceiverTypeEnum ==  iReceiverType_LinkedRef
		receiverRefs = GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()

	elseif ReceiverTypeEnum == iReceiverType_LinkedRefChain
		receiverRefs = GetLinkedRefChain(LinkedRefKeyword)

	elseif ReceiverTypeEnum == iReceiverType_LinkedRefChildren
		receiverRefs = GetRefsLinkedToMe(LinkedRefKeyword)

	elseif ReceiverTypeEnum == iReceiverType_Self
		receiverRefs = self.GetSingleRefArray()

	elseif ReceiverTypeEnum == iReceiverType_SelfAndLinkedRef
		receiverRefs = self.GetSingleRefArray()
		receiverRefs.add(GetLinkedRef(LinkedRefKeyword))

	else
		Warning(self, "GetPossibleReceiverRefs() found unexpected ReceiverTypeEnum: " + ReceiverTypeEnum)

	endif

	Trace(self, "GetPossibleReceiverRefs() returning receiverRefs: " + receiverRefs)
	return receiverRefs
EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Signal",  string SubLogName = "Sender", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Signal",  string SubLogName = "Sender", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction