Scriptname SBTempleDoorScript extends ObjectReference
{Script for Starborn Temple doors.
 Robot followers can't enter Temples because they can't operate in ZeroG, so force them to wait outside.}

Group AutofillProperties
    SQ_FollowersScript property SQ_Followers Auto Const Mandatory
    ActorValue property SBTempleDoorWaiting Auto Const Mandatory
    Keyword property ActorTypeRobot Auto Const Mandatory
EndGroup


Event OnLoad()   
    Actor[] allFollowers = SQ_Followers.GetFollowers(True, True)
    int i = 0
    While (i < allFollowers.Length)
        Actor current = allFollowers[i]
        if (current.GetValue(SBTempleDoorWaiting) > 0)
            current.SetValue(SBTempleDoorWaiting, 0)
            SQ_Followers.CommandFollow(current)
        EndIf
        i = i + 1
    EndWhile
EndEvent

Event OnActivate(ObjectReference akActivator)
    if (akActivator == Game.GetPlayer())
        Actor[] activeFollowers = SQ_Followers.GetFollowers(True, False)
        int i = 0
        While (i < activeFollowers.Length)
            Actor current = activeFollowers[i]
            if (current.HasKeyword(ActorTypeRobot))
                current.SetValue(SBTempleDoorWaiting, 1)
                SQ_Followers.CommandWait(current)
            EndIf
            i = i + 1
        EndWhile
    EndIf
EndEvent