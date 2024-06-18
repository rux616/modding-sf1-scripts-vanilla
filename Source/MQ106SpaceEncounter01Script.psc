Scriptname MQ106SpaceEncounter01Script extends Quest

ReferenceAlias Property TheHelix Mandatory Const Auto
ReferenceAlias Property TheHelixMovetoMarker Mandatory Const Auto

Event OnQuestInit()
    ;move the Helix and enable it
    SpaceshipReference HelixREF = TheHelix.GetShipRef()
    HelixRef.moveto(TheHelixMoveToMArker.GetRef())
    HelixRef.EnableWithGravJump()
EndEvent