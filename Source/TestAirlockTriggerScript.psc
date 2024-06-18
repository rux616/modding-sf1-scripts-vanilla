Scriptname TestAirlockTriggerScript extends ObjectReference Const

Keyword Property ArmorTypeHelmet Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	;do nothing if the door has no power
	If (self.GetLinkedRef() as TestAirlockScript01).bPowerered==False
		;do nothing
	Else
		;only do this if the door is closed and is unlocked
		If (self.GetLinkedRef().GetOpenState() == 3) && (self.GetLinkedRef().IsLocked()==False)
			If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet)
				;open door
				Self.GetLinkedRef().Activate(akActionRef, True)
			Else
				;do nothing
			EndIf
		EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;do nothing if the door has no power
	If (self.GetLinkedRef() as TestAirlockScript01).bPowerered==False
		;do nothing
	Else
		;if the airlock is still opening, wait until it's done
		While self.GetLinkedRef().GetOpenState() == 2
			Utility.Wait(0.25)
		EndWhile

		;if airlock is open, close it when all actors have left the trigger
		If self.GetLinkedRef().GetOpenState() == 1		
			If Self.GetTriggerObjectCount() == 0
				Self.GetLinkedRef().Activate(akActionRef, True)
			EndIf
		EndIf
	EndIf
EndEvent