Scriptname SFBGS00D:SFFL_AnchorpointQuestRepeatManager extends Quest
{Updates the globals that gate repeitition of Anchorpoint's two Z quests}

; Properties
GlobalVariable Property SFFL_AnchorpointZ02_RepeatGlobal Auto Const Mandatory
GlobalVariable Property SFFL_AnchorpointZ04_RepeatGlobal Auto Const Mandatory
GlobalVariable Property SFFL_AnchorpointZ02_TimeGlobal Auto Const Mandatory
GlobalVariable Property SFFL_AnchorpointZ04_TimeGlobal Auto Const Mandatory
int z02TimerID = 20 const; The timer for AnchorpointZ02A
int z04TimerID = 40 const; The timer for AnchorpointZ04
 
Function StartRepeatTimer(int QuestTimerID)                
    if QuestTimerID == 2
	    int z02TimerValue = SFFL_AnchorpointZ02_TimeGlobal.GetValue() as int
 	    StartTimer(z02TimerValue, 20) ; Create the Z02 restart timer with a duration in seconds equal to the value of the associated global
    elseIf QuestTimerID == 4
        int z04TimerValue = SFFL_AnchorpointZ04_TimeGlobal.GetValue() as int
        StartTimer(z04TimerValue, 40) ; Create the Z04 restart timer with a duration in seconds equal to the value of the associated global
    endIf
EndFunction

Event OnTimer(int aiTimerID)		
    If aiTimerID == z02TimerID ; The AnchorpointZ02A timer just expired
        Debug.Trace(self + " AnchorpointZ02A timer ended.")
        if SFFL_AnchorpointZ02_RepeatGlobal.GetValue() == 1
            SFFL_AnchorpointZ02_RepeatGlobal.SetValue(2)
            debug.trace(self + " AnchorpointZ02A repeat global updated, the quest is now replayable.")
        endIf       
    elseIf aiTimerID == z04TimerID ; The AnchorpointZ04 timer just expired
        Debug.Trace(self + " AnchorpointZ04 timer ended.")
        if SFFL_AnchorpointZ04_RepeatGlobal.GetValue() == 1
            SFFL_AnchorpointZ04_RepeatGlobal.SetValue(2)
            debug.trace(self + " AnchorpointZ04 repeat global updated, the quest is now available again")
        endIf    
    endIf
EndEvent