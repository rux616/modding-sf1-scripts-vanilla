Scriptname RETriggerSecondaryScript extends ObjectReference
{use for triggers linked to other RETriggers
mainly useful for triggers which use OnTrigger to fire
}

; 	Log Variables
	String LocalScriptName 	= "RETriggerSecondaryScript"	; Filled by OEScript, if used.
	RETriggerScript myLinkedTrigger = None 	

Event OnCellLoad()
	myLinkedTrigger = GetLinkedRef() as RETriggerScript

	if myLinkedTrigger && myLinkedTrigger.TriggerOnLoad
		myLinkedTrigger.Trace(self, "OnCellLoad - calling StartEncounter on linked trigger " + myLinkedTrigger)
		myLinkedTrigger.OnCellLoad()
	endif
endEvent


Event OnTriggerEnter(ObjectReference akActionRef)
	myLinkedTrigger = GetLinkedRef() as RETriggerScript
	Trace(self, "OnTriggerEnter - akActionRef " + akActionRef)
	if akActionRef != Game.GetPlayer()
		return
	EndIf

	if myLinkedTrigger && !myLinkedTrigger.TriggerOnLoad
		myLinkedTrigger.Trace(self, "OnTriggerEnter - calling StartEncounter on linked trigger " + myLinkedTrigger)
		myLinkedTrigger.OnTriggerEnter(akActionRef)
	endif
EndEvent

;--------------------------------------------------------------------------------------------------
; TRACE LOGS 
;       Standard Trace Functions for handling logs and other formatting functions for readability. 
;--------------------------------------------------------------------------------------------------
;	Trace and warning functions
    Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) DebugOnly
		asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
		if myLinkedTrigger
			myLinkedTrigger.Trace(CallingObject, asTextToPrint, aiSeverity)
		Else
			Debug.Trace(CallingObject + " " + asTextToPrint, aiSeverity)
		endif
    EndFunction

	Function Warning(ScriptObject CallingObject, string asTextToPrint, bool DebugTrace=False, int aiSeverity=2, bool bShowNormalTrace=false, bool bShowWarning=True, bool bPrefixTraceWithLogNames=True) BetaOnly
		asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
		if myLinkedTrigger
			myLinkedTrigger.Warning(CallingObject, asTextToPrint)
		Else
			Debug.Trace(CallingObject + " " + asTextToPrint, aiSeverity)
		endif
	EndFunction


