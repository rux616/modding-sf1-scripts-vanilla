Scriptname PiracyInfo_LoseSC_Script extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    SpaceshipReference shipRef = akSpeakerRef as SpaceshipReference
    debug.trace(self + " akSpeakerRef=" + akSpeakerRef + " shipRef=" + shipRef)
    (GetOwningQuest() as DialogueGenericPiracyShipQScript).PiracyLoseSpeechChallenge(shipRef)
EndEvent