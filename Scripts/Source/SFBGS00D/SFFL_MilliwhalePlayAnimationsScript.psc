Scriptname SFBGS00D:SFFL_MilliwhalePlayAnimationsScript extends TopicInfo

Idle Property IdleToPlay Auto Const Mandatory

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    (akSpeakerRef as Actor).PlayIdle(IdleToPlay)
EndEvent