Scriptname UC02_ScannerQuestScript extends Quest

int Property WWiseEventInstanceID Auto
{Float used to hang onto the instance ID of the WWise event kicked off with the Terrormorph}

int Property DistanceDisplayFrequency = 5 Const Auto
{How many second to wait between displays of the distance message while this quest is running}

int Property PrereqStage = 110 Const Auto
{Need to wait until this stage it set before we want to start showing this message}

int Property ShutdownStage = 1000 Const Auto
{If this stage is done, stop trying to display the message}

Message Property UC02_DistanceToMorph Mandatory Const Auto
{Message object used to display the current distance between player and beast}

ReferenceAlias Property Terrormorph Mandatory Const Auto
{Ref alias for the Terrormorph}

int iTimerID = 1 const

Function DisplayDistanceMessage()
    if GetStageDone(PrereqStage) && !GetStageDone(ShutdownStage)
        int iDistance = Game.GetPlayer().GetDistance(Terrormorph.GetRef()) as int
        UC02_DistanceToMorph.Show(iDistance)
        StartTimer(DistanceDisplayFrequency, iTimerID)
    endif
EndFunction

Event OnTimer(int aiTimerID)
    DisplayDistanceMessage()
EndEvent