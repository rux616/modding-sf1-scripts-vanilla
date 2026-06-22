Scriptname TestAirlockScript01 extends ObjectReference 

Keyword Property ArmorTypeHelmet Auto Const Mandatory
Message Property TestAirlockMSG01 Auto Const Mandatory
bool Property bPowerered = True Auto

Event OnInit()
	BlockActivation()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	;this only works if the door has power
	If bPowerered
		;only do this if the door is closed
		If self.GetOpenState() == 3
			If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet)
				;open door
				Self.Activate(akActionRef, True)
			ElseIf (akActionRef == Game.GetPlayer())
				;pop message box with buttons
				int ButtonPressed
				ButtonPressed = TestAirlockMSG01.Show()
				If ButtonPressed == 1
					;player decides to open airlock anyway
					Self.Activate(akActionRef, True)
				EndIf
			Else
				;open door because an NPC wants in
				Self.Activate(akActionRef, True)
			EndIf
		Else
			;pass activation through if door is open
			Self.Activate(akActionRef, True)
		EndIf
	EndIf
EndEvent

Function PowerOff()
	Self.SetOpen()
	bPowerered = False
EndFunction

Function PowerOn()	
	Self.SetOpen(False)
	bPowerered = True
EndFunction