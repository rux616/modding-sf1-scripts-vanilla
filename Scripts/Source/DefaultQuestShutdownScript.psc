Scriptname DefaultQuestShutdownScript extends Quest Const Default 

{shuts the quest down when a timer expires}

Int Property StartTimerStage = 10 Auto Const
{quest stage which will start the shutdown timer}

float Property ShutdownTimerDuration = 1.0 Auto Const
{time (in game hours) before shutdown}


Event OnStageSet(int auiStageID, int auiItemID)
	; start shutdown timer
	StartTimerGameTime(ShutdownTimerDuration)
endEvent

Event OnTimerGameTime(int aiTimerID)		
	; stop the quest
	Stop()
endEvent
