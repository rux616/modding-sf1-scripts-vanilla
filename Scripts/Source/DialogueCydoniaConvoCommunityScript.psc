Scriptname DialogueCydoniaConvoCommunityScript extends Quest
{Shared script for the Cydonia Community Center Conversation quests}

Float Property MeetingDuration Mandatory Const Auto
Int Property StageToCheckGetDone Mandatory Const Auto

;Starts a user-specified timer in GameTime. It should be noted that this works best for Mars, since its days are so similar to GST.
Event OnQuestInit()
    StartTimerGameTime(MeetingDuration)
EndEvent

;After the timer duration ends, check to see if the player arrived to the scene, which sets the specified stage. If not, shut the quest down so the NPCs can be released.
Event OnTimerGameTime(int aiTimerID)
    If !GetStageDone(StageToCheckGetDone)
        Stop()
    EndIf
EndEvent
