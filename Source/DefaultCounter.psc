ScriptName defaultCounter extends objectReference Default
{A simple counter. Place on an object, then increment with another script (such as defaultCounterIncrementOnDeath). When the target value is reached (or, optionally, exceeded), the counter:
 - Activates itself.
 - Optionally, sets a quest stage.
 - Optionally, performs a specified action on a specified linkedref.
}

Group Required_Properties
	int property TargetValue Auto Const Mandatory
	{The first value at which the counter will trigger.}
EndGroup

Group Optional_Properties
	Quest Property QuestToSet Auto Const
	{Quest containing the Stage to set}

	Int Property StageToSet = -1 Auto Const
	{Stage to Set}
	 
	Keyword property LinkedRefKeyword Auto Const
	{The keyword for the LinkedRef to perform the action on. Defaults to the unnamed linkedref.}

	int property LinkedRefAction Auto Const
	{Determines what action to perform on the object's linkedref.
	0: Activate (default)
	1: Toggle Enable/Disable
	2: Enable Only
	3: Disable Only}

	 bool property AllowDecrementing Auto Const
	 {(Default: false) If true, we Decrementing via calls to "Decrement()", undoing the specified action (where possible) if the value falls below the target.}
EndGroup

int count
bool hasHitThreshold

Auto STATE AllowCounting
	Function Increment()

		count = count + 1

			; Has count reached it's TargetValue?
		if (count >= TargetValue)
			hasHitThreshold = True
			if (!AllowDecrementing)
				GoToState("StopCounting")
			EndIf

			; It has, so activate myself and check if there's anything else I should do
			Self.Activate(Self)
			if (QuestToSet != None)
				QuestToSet.SetStage(StageToSet)
			EndIf
			if (LinkedRefAction == 0)
					;Activates Linked Ref
				Self.GetLinkedRef(LinkedRefKeyword).Activate(Self)
			ElseIf (LinkedRefAction == 1)
					; Toggles Enable/Disable
				if (Self.GetLinkedRef(LinkedRefKeyword).IsDisabled())
					Self.GetLinkedRef(LinkedRefKeyword).Enable()
				Else
					Self.GetLinkedRef(LinkedRefKeyword).Disable()
				EndIf	
			ElseIf (LinkedRefAction == 2)
					; Enables Only
				Self.GetLinkedRef(LinkedRefKeyword).Enable()
			ElseIf (LinkedRefAction == 3)
					; Disables Only
				Self.GetLinkedRef(LinkedRefKeyword).Disable()
			EndIf
		EndIf
		
	EndFunction

	Function Decrement()
		if (AllowDecrementing)
		;Decrement the counter (to a minimum of 0).
			count = count - 1
			if (count <= 0)
				count = 0
			EndIf

			;If we previously exceeded our threshold, and are now less than it, undo the threshold action if possible.
			if (count < TargetValue && hasHitThreshold)
				hasHitThreshold = False
				; Activate myself and check if there's anything else I should do
				Self.Activate(Self)
				;Can't Undo setting a stage.
				if (LinkedRefAction == 0)
						;Undo Activate Linked Ref: Activate it again.
					Self.GetLinkedRef(LinkedRefKeyword).Activate(Self)
				ElseIf (LinkedRefAction == 1)
						; Undo Toggle Enable/Disable: Toggle again.
					if (Self.GetLinkedRef(LinkedRefKeyword).IsDisabled())
						Self.GetLinkedRef(LinkedRefKeyword).Enable()
					Else
						Self.GetLinkedRef(LinkedRefKeyword).Disable()
					EndIf	
				ElseIf (LinkedRefAction == 2)
						; Undo Enable: Disable
					Self.GetLinkedRef(LinkedRefKeyword).Disable()
				ElseIf (LinkedRefAction == 3)
						; Undo Disable: Enable
					Self.GetLinkedRef(LinkedRefKeyword).Enable()
				EndIf
			EndIf
		EndIf
	EndFunction
EndSTATE

STATE StopCounting
	;Do Nothing
EndSTATE


Function Increment()
	;Do Nothing
EndFunction

Function Decrement()
	;Do Nothing
EndFunction