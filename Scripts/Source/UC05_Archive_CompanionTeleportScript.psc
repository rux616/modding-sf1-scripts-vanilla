Scriptname UC05_Archive_CompanionTeleportScript extends ReferenceAlias
{Followers told to wait in Armistice Archives are moved outside the vault to prevent them from getting stuck}

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

Int Property StageToCheck Auto Const

Cell Property CityNewAtlantisArmisticeArchives Auto Const Mandatory

Auto State Waiting

Event OnCellDetach()
    Actor[] WaitingFollowers = SQ_Followers.GetFollowers(IncludeFollowingFollowers = false, IncludeWaitingFollowers = true)
    if WaitingFollowers[0] != None && GetOwningQuest().GetStageDone(StageToCheck)
        goToState("Done")
        int i = 0
        while i < WaitingFollowers.Length
            if WaitingFollowers[i].GetParentCell() == CityNewAtlantisArmisticeArchives
                SQ_Followers.CommandFollow(WaitingFollowers[i])
                WaitingFollowers[i].MoveTo(Game.GetPlayer())
            endif
            i += 1
        endWhile
    endif
endEvent
EndState

State Done
EndState