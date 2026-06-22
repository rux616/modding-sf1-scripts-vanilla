Scriptname PlaySoundOnActivate extends ObjectReference Conditional

WwiseEvent Property ActivateSound Auto Const
bool Property bCanPlayAgain = true Auto Conditional


Event OnActivate(ObjectReference akActionRef)
	if bCanPlayAgain == true
		bCanPlayAgain = false

		if ActivateSound.PlayAndWait(self)
			bCanPlayAgain = true
		else
			bCanPlayAgain = true
		endif

	endif

EndEvent

