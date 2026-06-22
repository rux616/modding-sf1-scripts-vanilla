Scriptname DefaultOnEnterMultiActor extends ObjectReference Conditional Default
{script to test if one or more actors are in a trigger}

import game
import debug
import CommonArrayFunctions

Group Required_Properties
	ActorBase[] Property TriggerActors Auto Const
	{actors that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases	}

	ReferenceAlias[] property TriggerAliases Auto Const
	{Ref Aliases that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases}
endGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

;true when all targets are in trigger
bool Property bAllTargetsInTrigger = False Auto Conditional Hidden

;total targets currently in the trigger
int targetCountCurrent

;how many targets are we looking for? When targetCountCurrent reaches this, we trigger
int targetCountTotal

;custom event to broadcast when going from not full to full OR from full to not full
CustomEvent MultiActorTriggerReady

;do we need to send out the custom event?
bool bSendEvent = False

Event OnInit()
	; count the number of actors in each array
	int ActorArrayLength = TriggerActors.Length
	int AliasArrayLength = TriggerAliases.Length

	targetCountTotal = ActorArrayLength + AliasArrayLength
endEvent

auto STATE waiting

	EVENT onTriggerEnter(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			; increase ref count
			modTargetCount(1)
			; if all target refs are in the trigger, done
			if bAllTargetsInTrigger
				TriggerMe()
			endif
		endif
	endEVENT

	EVENT OnTriggerLeave(objectReference triggerRef)
		if CheckTriggerRef(triggerRef)
			; decrease ref count
			modTargetCount(-1)
		endif
	endEvent

endSTATE

function modTargetCount(int modValue)
	targetCountCurrent = targetCountCurrent + modValue
	; failsafe - don't go below 0, 
	; EDIT - cannot do this right now, since trigger leave could process before trigger enter
	;if targetCountCurrent < 0
	;	targetCountCurrent = 0
	;endif
	; update bAllTargetsInTrigger
	if targetCountCurrent >= targetCountTotal
		;if bAllTargetsInTrigger was FALSE before, send the event letting us know the state has changed
		If bAllTargetsInTrigger == False
			;set bAllTargetsInTrigger to True since we'll be sending that in the event
			bAllTargetsInTrigger = True
			bSendEvent = True
		Else
			bSendEvent = False
		EndIf
	else
		;if bAllTargetsInTrigger was TRUE before, send the event letting us know the state has changed
		If bAllTargetsInTrigger == True
			;set bAllTargetsInTrigger to False since we'll be sending that in the event
			bAllTargetsInTrigger = False
			bSendEvent = True
		Else
			bSendEvent = False
		EndIf
	endif

	; Send out the custom event
	If bSendEvent == True
		;define the array to send
		Var[] kargs = new Var[1]
		kargs[0] = bAllTargetsInTrigger
		SendCustomEvent("MultiActorTriggerReady", kargs)
	EndIf
endFunction

Bool function CheckTriggerRef(objectReference triggerRef)
		DefaultScriptFunctions.Trace(self, "CheckTriggerRef for " + triggerRef, ShowTraces)

		bool bSuccess = false

		if triggerRef
			Actor triggerActor = triggerRef as Actor
		
			if triggerActor
				; we have an actor, check if it matches any of our trigger actors
				ActorBase triggerActorBase = triggerActor.GetBaseObject() as ActorBase ; use editor base, since TriggerActors contains editor bases
				DefaultScriptFunctions.Trace(self, "CheckTriggerRef for " + triggerRef + ": actorbase=" + triggerActorBase, ShowTraces)
				if TriggerActors.Find(triggerActorBase) >= 0
					DefaultScriptFunctions.Trace(self, "CheckTriggerRef for " + triggerRef + ": MATCHED", ShowTraces)
					bSuccess = true
				else
					DefaultScriptFunctions.Trace(self, "CheckTriggerRef for " + triggerRef + ": failed to match " + TriggerActors, ShowTraces)
				endif
			endif
			; if we haven't already found something, check aliases
			if !bSuccess
				int AliasArrayElement = FindInReferenceAliasArray(triggerRef, TriggerAliases)
				If AliasArrayElement < 0
					bSuccess = False
				Else
					bSuccess = True
				EndIf

				If bSuccess == False
					DefaultScriptFunctions.Trace(self, "CheckTriggerRef for " + triggerRef + ": failed to match " + TriggerAliases, ShowTraces)
				EndIf
			endif
		endif

		return bSuccess
endFunction

; what happens when all my targets are in the trigger?
function TriggerMe()
	;override on child script to trigger specific behavior
endFunction