Scriptname UC08QuestScript extends Quest

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
{Followers quest property}

ReferenceAlias Property Hadrian Mandatory Const Auto
{Ref alias for Hadrian}

ReferenceAlias Property Kaiser Mandatory Const Auto
{Ref alias for Kaiser}

GlobalVariable Property UC08_HadrianKaiserFollowingPlayer Mandatory Const Auto RequiresGuard(FollowerStateGuard)
{Global used to track if Hadrian and Kaiser are currently following the player}

Keyword Property SQ_Followers_UseFollowPlayerCustom Mandatory Const Auto
{Keyword used to manage the companions using their custom followers package or not}

Guard FollowerStateGuard

Function ToggleFollowerState(int iForceState = -1)
    LockGuard FollowerStateGuard
    int iFollowerState = UC08_HadrianKaiserFollowingPlayer.GetValueInt()
    Actor HadACT = Hadrian.GetActorRef()
    Actor KaiACT = Kaiser.GetActorRef()

    if iForceState >= 0
        ;We want to force the system on in these cases, so set the toggle to "on" for the moment so it'll get switched below
        if iForceState == 0
            UC08_HadrianKaiserFollowingPlayer.SetValue(1)
        ;We want to force the system on in these cases, so set the toggle to "off" for the moment so it'll get switched below
        elseif iForceState == 1
            UC08_HadrianKaiserFollowingPlayer.SetValue(0)
        endif
    endif

    if iFollowerState < 1
        UC08_HadrianKaiserFollowingPlayer.SetValue(1)
        HadACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
        KaiACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
        SQ_Followers.SetRoleActive(HadACT, false)
        SQ_Followers.SetRoleActive(KaiACT, false)
        SQ_Followers.CommandFollow(HadACT)
        SQ_Followers.CommandFollow(KaiACT)
    else
        UC08_HadrianKaiserFollowingPlayer.SetValue(0)
        HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
        KaiACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
        SQ_Followers.SetRoleInactive(HadACT, false)
        SQ_Followers.SetRoleInactive(KaiACT, false)
    endif

    HadAct.EvaluatePackage()
    KaiAct.EvaluatePackage()
    EndLockGuard    
EndFunction

Function CatchUpFollowers()
    ObjectReference PlayREF = Game.GetPlayer()
    Kaiser.GetRef().Moveto(PlayREF)
    Hadrian.GetRef().Moveto(PlayREF)
EndFunction

Function JumpFollowersToPackageDest()
    Kaiser.GetActorRef().MoveToPackageLocation()
    Hadrian.GetActorRef().MoveToPackageLocation()
EndFunction

Function EVPFollowers()
    Kaiser.GetActorRef().EvaluatePackage()
    Hadrian.GetActorRef().EvaluatePackage()
EndFunction

Function PauseFollowers()
    SQ_Followers.SetRoleInactive(Hadrian.GetActorRef(), false)
    SQ_Followers.SetRoleInactive(Kaiser.GetActorRef(), false)
EndFunction

Function ResumeFollowers()
    Actor HadACT = Hadrian.GetActorRef()
    Actor KaiACT = Kaiser.GetActorRef()
    SQ_Followers.SetRoleActive(HadACT, false)
    SQ_Followers.SetRoleActive(KaiACT, false)

    SQ_Followers.CommandFollow(HadACT)
    SQ_Followers.CommandFollow(KaiACT)
    EVPFollowers()
EndFunction

Function ToggleLazPlants(RefCollectionAlias akTargetCollection)
    int i = 0
    int iCount = akTargetCollection.GetCount()

    while i < iCount
        ObjectReference currRef = akTargetCollection.GetAt(i)

        currRef.PlayAnimation("Stage2")

        i += 1
    endwhile
EndFunction