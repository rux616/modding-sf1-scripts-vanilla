Scriptname BE_SC04QuestScript extends Quest
{Script for BE_SC04, Bargaining.}
;
;On request, spawn a marker the enemy ship can start traveling to during its departure scene.
;TODO - TTP 28918 & 24141 - This needs more work, but I can't test it because undocking crashes the game and/or makes the enemy ship disappear.

Group AutofillProperties CollapsedOnBase
    ReferenceAlias property Captain Auto Const Mandatory
    ReferenceAlias property CaptainEssentialAlias Auto Const Mandatory
    ReferenceAlias property TargetShip Auto Const Mandatory
    ReferenceAlias property TargetShipJumpTravelMarker Auto Const Mandatory
    Static property XMarker Auto Const Mandatory
EndGroup

Event OnQuestStarted()
    ((Self as Quest) as BEScript).WaitUntilInitialized()
    CaptainEssentialAlias.ForceRefTo(Captain.GetRef())
EndEvent

Function SpawnJumpTravelMarker()
    SpaceshipReference targetShipRef = TargetShip.GetRef() as SpaceshipReference
    float[] offset = new float[6]
    offset[0] = 250
    TargetShipJumpTravelMarker.ForceRefTo(targetShipRef.PlaceAtMe(XMarker, akOffsetValues=offset))
    targetShipRef.EvaluatePackage()
EndFunction