Scriptname CityNewAtlantisSalinasTriggerScript extends ObjectReference Const



GlobalVariable Property UC_NA_SalinasVendorActive const auto

GlobalVariable Property UC_NA_SalinasVendorTimer const auto

GlobalVariable Property GameDaysPassed const auto


Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	if UC_NA_SalinasVendorActive.GetValue() == 1
		UC_NA_SalinasVendorActive.SetValue(0)
		UC_NA_SalinasVendorTimer.SetValue(GameDaysPassed.GetValue() + 0.2)
    		;debug.Trace(UC_SalinasVendorTimer + " set to " + UC_NA_SalinasVendorTimer.GetValue())
	endif
    endif
EndEvent