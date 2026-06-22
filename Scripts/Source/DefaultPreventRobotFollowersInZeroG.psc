Scriptname DefaultPreventRobotFollowersInZeroG extends Quest Default

Group MatchingProperties
    ReferenceAlias Property InteriorRobotBay Auto Const Mandatory
    {Alias to move Vasco, must match InteriorRobotBay in SQ_PlayerShip.}
    ReferenceAlias Property HomeShipCrewMarker Auto Const Mandatory
    {Alias to move non-Vasco robot followers, must match HomeShipCrewMarker in SQ_PlayerShip.}
    RefCollectionAlias Property Followers Auto Const Mandatory
    {Alias for Followers, must match ActiveFollowers in SQ_Followers.}
EndGroup

Group AutofillProperties
    ActorBase Property Crew_Elite_Vasco Auto Const Mandatory
    {Autofill for Vasco who has unique handling.}
    SQ_FollowersScript Property SQ_Followers Auto Const Mandatory
    {Autofill SQ_Followers quest.}
    Keyword Property PreventRobotFollowersInZeroG Auto Const Mandatory
    {Autofill keyword for locations that should not allow robots without the AllowRobotFollowersWarp keyword due to zero-g.}
    Keyword Property ActorTypeRobot Auto Const Mandatory
    {Autofill keyword for all robots.}
    Keyword Property AllowRobotFollowerWarp Auto Const Mandatory
    {Autofill keyword for robots that are allowed to be in zero-g.}
EndGroup

; When the quest starts, register for OnLocationChange and OnExitShipInterior to track where the player is going.
Event OnQuestInit()
    Actor PlayerRef = Game.GetPlayer()
    RegisterForRemoteEvent(PlayerRef, "OnLocationChange")
    RegisterForRemoteEvent(PlayerRef, "OnExitShipInterior")
EndEvent

; Check if the player is entering/leaving a zero-g location where robot followers without the AllowRobotFollowersWrap keyword are not allowed.
; Call the appropriate function to make them active or inactive.
Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    Debug.Trace(Self + "PreventRobotFollowers: OnLocationChange event fired. akSender = " + akSender + " akOldLoc = " + akOldLoc + " akNewLoc = " + akNewLoc)
    If akSender == Game.GetPlayer()
        Bool OldPrevent = akOldLoc.HasKeyword(PreventRobotFollowersInZeroG)
        Bool NewPrevent = akNewLoc.HasKeyword(PreventRobotFollowersInZeroG)
        If OldPrevent != NewPrevent
            SetFollowerZeroGInactive(NewPrevent)
        EndIf
    EndIf
EndEvent

; If the area has a ShipCell that leads to an Interior cell in the same location, make sure non zero-g followers are set to inactive.
Event Actor.OnExitShipInterior(Actor akSender, ObjectReference akShip)
    Debug.Trace(Self + "PreventRobotFollowers: OnExitShipInterior event fired. akSender = " + akSender + " akShip = " + akShip)
    If Game.GetPlayer().GetCurrentLocation().HasKeyword(PreventRobotFollowersInZeroG)
        Debug.Trace(Self + "PreventRobotFollowers: OnExitShipInterior: LocationsToCheck = " + Game.GetPlayer().GetCurrentLocation())
        SetFollowerZeroGInactive(True)
    EndIf
EndEvent

; Toggle a follower inactive or active due to zero-g.
Guard ZeroGSetupGuard ProtectsFunctionLogic
Function SetFollowerZeroGInactive(bool abShouldBeInactive)
    Lockguard ZeroGSetupGuard
        Debug.Trace(Self + "PreventRobotFollowers: SetFollowerZeroGInactive function called. abShouldBeInactive = " + abShouldBeInactive)
        Actor[] FollowerRefs = Followers.GetActorArray()
        Actor Vasco = Crew_Elite_Vasco.GetUniqueActor()
        ObjectReference CrewMarkerRef = HomeShipCrewMarker.GetRef()
        Int i = 0
        While i < FollowerRefs.Length
            Actor ChosenActor = FollowerRefs[i]
            If ChosenActor.HasKeyword(ActorTypeRobot) && !ChosenActor.HasKeyword(AllowRobotFollowerWarp)
                Debug.Trace(Self + "PreventRobotFollowers: SetFollowerZeroGInactive: Passed keyword check")
                Actor[] ChosenActorArray = new Actor[1]
                ChosenActorArray[0] = ChosenActor
                If ChosenActor == Vasco
                    Debug.Trace(Self + "PreventRobotFollowers: SetFollowerZeroGInactive: Actor is Vasco")
                    CrewMarkerRef = InteriorRobotBay.GetRef()
                EndIf
                If abShouldBeInactive
                    SQ_Followers.TeleportFollowers(CrewMarkerRef, ChosenActorArray, IncludeFollowingFollowers = True, IncludeWaitingFollowers = True, StartFollowingAfterTeleport = False, StartWaitingAfterTeleport = True, SkipWaitingFollowersObjective = True)
                Else
                    SQ_Followers.TeleportFollowers(CrewMarkerRef, ChosenActorArray)
                EndIf                
            EndIf

            i += 1

        EndWhile
    EndLockGuard    

EndFunction
