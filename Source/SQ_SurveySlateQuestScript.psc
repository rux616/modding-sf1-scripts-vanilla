Scriptname SQ_SurveySlateQuestScript extends Quest

Message property SQ_SurveySlateAddedMessage auto const mandatory
Message property SQ_SurveySlateReplacedMessage auto const mandatory

int property SaveInstanceDataStage = 10 auto Const

bool questStarted = false
int waitforStartTimerID = 1 Const

int iSlateAdded = 0
int iSurveyPercent = 0

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    iSlateAdded = aiValue1
    iSurveyPercent = aiValue2
    debug.trace(self + " Send survey slate message")
    if iSlateAdded > 0
        SQ_SurveySlateAddedMessage.Show()
    else
        SQ_SurveySlateReplacedMessage.Show()
    endif
    SetStage(SaveInstanceDataStage)
    Stop()
EndEvent
