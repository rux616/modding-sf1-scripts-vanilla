Scriptname UC_CompanionLearnsVVAliveInfoScript extends TopicInfo

ActorValue Property UC_COMP_KnowsVaeVictisLives Mandatory Const Auto
{Actor value used to track if the companion's previously learned Vae Victis is alive}

GlobalVariable Property UC_COMP_KnowsVaeVictisLives_Global Mandatory Const Auto
{Value to check for to see if the companion has previously learned that VV's alive}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    float fVVValue = UC_COMP_KnowsVaeVictisLives_Global.GetValue()

    if akSpeakerRef.GetValue(UC_COMP_KnowsVaeVictisLives) < fVVValue
        akSpeakerRef.SetValue(UC_COMP_KnowsVaeVictisLives, fVVValue)
    endif
EndEvent
