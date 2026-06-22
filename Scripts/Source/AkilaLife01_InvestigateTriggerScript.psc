Scriptname AkilaLife01_InvestigateTriggerScript extends ObjectReference Const

Event OnTriggerEnter(ObjectReference akActionRef)


	if AkActionRef == Game.GetPlayer()
		City_AkilaLife01_TriggerActive.SetValue(1)
		

	    ; Check to see if the quest is in the right state and it's night time
	    if ( City_AkilaLife01.GetStageDone(100) ) && (City_AkilaLife01.GetStageDone(150)==0)
	        if ( Game.GetLocalTime() > 20 || Game.GetLocalTime() < 4 )
       	     City_AkilaLife01.SetStage(StageToSet)
       	 Else
			StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
		endif
	endif
    	EndIf

EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef ==  Game.GetPlayer()
		if City_AkilaLife01_TriggerActive.GetValue() as int == 1
			City_AkilaLife01_TriggerActive.SetValue(0)
		endif
	endif

EndEvent

Event OnTimerGameTime(int TimerID)
       if ( Game.GetLocalTime() > 20 || Game.GetLocalTime() < 4 )
		if City_AkilaLife01_TriggerActive.GetValue() as int==1
			City_AkilaLife01.SetStage(StageToSet)
		else
			StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
		endif
	else
		StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID)
	endif

			
EndEvent

Quest Property City_AkilaLife01 Auto Const Mandatory

Int Property StageToSet Auto Const

Int Property TimerID Auto Const

GlobalVariable Property City_AkilaLife01_Timer Auto Const Mandatory

GlobalVariable Property City_AkilaLife01_TriggerActive Auto Const Mandatory
