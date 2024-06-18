Scriptname xxDefaultRefAmbushTrigger extends ObjectReference Const Default
{set the AmbushTriggered actor value on this ref when player enters}

Group Required_Properties
	ActorValue Property AmbushTriggered Auto Const Mandatory
	{ autofill }

	Keyword Property LinkAmbushTrigger Auto Const Mandatory
	{ autofill }
EndGroup

Group Optional_Properties
	bool Property TriggerIfAnyLinkedActorEntersCombat = true auto const
	{ TRUE = any linked actor that enters combat sets AmbushTriggered to 1
	  FALSE = only set AmbushTrigger to 1 if player enters me }
EndGroup


Event OnCellLoad()
	if TriggerIfAnyLinkedActorEntersCombat
    	Actor[] myChildren = GetRefsLinkedToMe(LinkAmbushTrigger) as Actor[]
    	int i = 0
    	while i < myChildren.Length
    		RegisterForRemoteEvent(myChildren[i], "OnCombatStateChanged")
    		i += 1
    	endWhile
    endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	; TODO - add array of other ways to trigger this (faction, etc.)
	if (akActionRef == Game.GetPlayer())
		TriggerAmbush()
	EndIf
EndEvent

Function TriggerAmbush()
	SetValue(AmbushTriggered, 1)
	Actor[] myChildren = GetRefsLinkedToMe(LinkAmbushTrigger) as Actor[]
    int i = 0
    While (i < myChildren.Length)
    	myChildren[i].EvaluatePackage()
    	i = i + 1
    EndWhile
EndFunction

; This was causing part of GEN-296983 "AI: Ambush procedure seems to be able to be overriden by ally going into combat"
; Adding this back in, only to trigger on combat, should only apply to actors linked to this ref.
Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
	if aeCombatState == 1
		SetValue(AmbushTriggered, 1)
	endif
EndEvent
