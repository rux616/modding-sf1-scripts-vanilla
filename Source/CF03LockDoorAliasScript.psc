Scriptname CF03LockDoorAliasScript extends ReferenceAlias
{Dismiss the player's follower when they enter the Lock.}

SQ_FollowersScript property SQ_Followers Auto Const Mandatory
ReferenceAlias property CF03_PlayerShipPilotSeat Auto Const Mandatory

;When the player activates the exterior load door, send all of their followers back to their ship to wait.
Event OnActivate(ObjectReference akActivator)
    if (akActivator == Game.GetPlayer())
        SQ_Followers.AllFollowersWait(CF03_PlayerShipPilotSeat.GetRef())
    EndIf
EndEvent