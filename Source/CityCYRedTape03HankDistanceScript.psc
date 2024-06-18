Scriptname CityCYRedTape03HankDistanceScript extends Quest
{Checks Hank's distance to his ship, then sets stage}

ReferenceAlias Property Hank Mandatory Const Auto
ReferenceAlias Property EquipmentMarker Mandatory Const Auto
Int i = 0

struct DistanceCheckStage

	Int StageToSet = -1
	{Stage to Set}

	float TargetDistance
	{The needed distance between this and the target}

	Int PrereqStage = -1
	{OPTIONAL - Stage that must be set for this script's functionality to execute}

	Int TurnOffStageDone = -1
	{OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored}
endStruct


DistanceCheckStage[] property DistanceCheckStages auto Const
{ array of stage/distance check data }


Function StartDistanceCheck()
    If i < DistanceCheckStages.Length
        DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
        RegisterForDistanceLessThanEvent(Hank.GetRef(), EquipmentMarker.GetRef(), theDistanceCheck.TargetDistance)
    EndIf
EndFunction


Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	Debug.Trace(self + " " + akObj2 + " OnDistanceLessThan " + afdistance + " Event ID = " + aiEventID)

    DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
    If ( theDistanceCheck.PrereqStage == -1 || GetStageDone(theDistanceCheck.PrereqStage) ) && ( theDistanceCheck.TurnOffStageDone == -1 || !GetStageDone(theDistanceCheck.TurnOffStageDone) )
        If i < DistanceCheckStages.Length
            i += 1
        EndIf  
        SetStage(theDistanceCheck.StageToSet)
    EndIf
endEvent

