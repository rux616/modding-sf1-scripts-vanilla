Scriptname UC01_DebugRockAliasScript extends ReferenceAlias

Struct SequenceDatum
    string Description
    {Quick editor-facing description of which sequence this is}

    int ButtonInt
    {Message box button we're looking for. This should match the index in the UC01_ShipSim_DebugMenu message object}

    ActorValue ManagingValue
    {Actor value used to drive this sequence}

    float ValueMax
    {Actor value level to express it's at its max}

    float ValueMin
    {Actor value level to express it's at its min}

    Scene StartUpScene
    {Scene to play when this sequence starts}

    Scene PowerUpScene
    {Scene to play when this sequence goes from low to high}

    Scene PowerDownScene
    {Scene to play when this sequence goes from high to low}

    Scene WrapUpScene
    {Scene to play when the whole sequence is finished}

    float MaxSwings
    {How many times we should swing between max and min}

    float SwingTimeMin
    {The max amount of time a swing should last}

    float SwingTimeMax
    {The min amount of time a swing should last}
EndStruct

Message Property UC01_ShipSim_DebugMenu Mandatory Const Auto
{Main debug menu}

SequenceDatum[] Property SequenceData Mandatory Const Auto
{Collection of each sequence types data}

Quest Property UC01 Mandatory Const Auto
{UC01 base quest property}

int Property PlayerUsedDebugSystemStage = 420 Const Auto
{Stage to set on UC01 if the player uses this system}

int Property ActiveSequence = -1 Auto
{If there's a sequence active, store it here}

int iSwingCount; Var used to count how many times this sequence has swung
int iTimerID = 1 const

Event OnActivate(ObjectReference akActionRef)
    if ActiveSequence == -1
        int ButtonReturn = UC01_ShipSim_DebugMenu.Show()

        int iIndex = SequenceData.FindStruct("ButtonInt", ButtonReturn)

        if iIndex >= 0
            ActiveSequence = iIndex

            if UC01.IsRunning()
                UC01.SetStage(PlayerUsedDebugSystemStage)
            EndIf

            SequenceDatum myDatum = SequenceData[ActiveSequence]
            myDatum.StartUpScene.Start()
            float RandLength = Utility.RandomFloat(myDatum.SwingTimeMin, myDatum.SwingTimeMax)

            StartTimer(RandLength, iTimerID)
        endif
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iTimerID
        SequenceDatum myDatum = SequenceData[ActiveSequence]
        
        myDatum.WrapUpScene.Start()
        ActiveSequence = -1
    endif
EndEvent