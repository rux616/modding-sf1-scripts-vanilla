Scriptname Book_SanctumUniversum01_Script extends ObjectReference Const

Quest Property City_NA_Aquilus01 Auto Const Mandatory

GlobalVariable Property City_NA_Aquilus01_BookRead Auto Const Mandatory


Event OnActivate(ObjectReference ActionRef)

	If ActionRef == Game.GetPlayer()

		If City_NA_Aquilus01.GetStageDone(100)==1
			City_NA_Aquilus01.SetStage(300)
		endif
	endif


EndEvent


Event OnRead()

	if City_NA_Aquilus01_BookRead.GetValue() == 0
		City_NA_Aquilus01_BookRead.SetValue(1)
	endif

EndEvent