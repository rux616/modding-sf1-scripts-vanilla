Scriptname DR009_MalfunctioningPlatformScript extends ObjectReference

float property MovementSpeed auto Const
float property MinWaitSeconds auto Const
float property MaxWaitSeconds auto Const
WwiseEvent property TravelSoundEvent auto Const

int waitTimerID = 0
int travelSoundEventInstanceID = -1

ObjectReference[] travelPositions

event OnCellLoad()
    travelPositions = GetLinkedRefChain()

    TravelToRandomPosition()
endEvent

event OnUnload()
	if(travelSoundEventInstanceID != -1 && TravelSoundEvent != NONE)
        WwiseEvent.StopInstance(travelSoundEventInstanceID)
    EndIf
endEvent

Event OnTranslationComplete()
    if(TravelSoundEvent != NONE)
        WwiseEvent.StopInstance(travelSoundEventInstanceID)
        travelSoundEventInstanceID = -1
    endIf

    WaitRandomSeconds()
EndEvent

function TravelToRandomPosition()
    int travelPostionIndex = Utility.RandomInt(0, travelPositions.Length - 1)
    ObjectReference travelPosition = travelPositions[travelPostionIndex]

    self.TranslateToRef(travelPosition, MovementSpeed)

    if(travelSoundEventInstanceID == -1 && TravelSoundEvent != NONE)
        travelSoundEventInstanceID = TravelSoundEvent.Play(self)
    endIf
endFunction

function WaitRandomSeconds()
    float waitSeconds = Utility.RandomFloat(MinWaitSeconds, MaxWaitSeconds)

    StartTimer(waitSeconds, waitTimerID)
endFunction

event OnTimer(int aiTimerID)
	if(aiTimerID == waitTimerID)
        TravelToRandomPosition()
	endIf
endEvent