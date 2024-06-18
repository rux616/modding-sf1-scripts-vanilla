Scriptname PlaceHazardOnDestroyed extends ObjectReference Const
{Places the selected hazard when this reference is destroyed.}

Hazard Property HazardToPlace Mandatory Const Auto
float Property xOffset = 0.0 Const Auto
float Property yOffset = 0.0 Const Auto
float Property zOffset = 0.0 Const Auto
bool Property SnapOffsetToNavmesh = false Const Auto

;This array should only be 0, 3 or 6 elements long to avoid placement errors. 0 is Right(positive) and Left(negative), 1 is front(positive) and behind(negative), 2 is up(positive) and down(negative), 3 pitch in degrees, 4 roll in degrees, 5 heading/yaw in degrees.

Event OnDestroyed(ObjectReference akDestroyer)
    float[] Offset = new float[3]
    Offset[0] = xOffset
    Offset[1] = yOffset
    Offset[2] = zOffset
    PlaceAtMe(HazardToPlace, 1, false, false, true, Offset, None, SnapOffsetToNavmesh)
    ;PlaceAtMe(PackinToPlace)
EndEvent
