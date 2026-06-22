Scriptname UC06_CompanionWaitScript extends ReferenceAlias Const

ReferenceAlias Property Alias_WaitHereMarker Mandatory Const Auto

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

Keyword Property WaitTriggerKeyword Mandatory Const Auto

ReferenceAlias Property Alias_ResumeTrigger Mandatory Const Auto

RefCollectionAlias Property Alias_WaitingCompanions Mandatory Const Auto

Group CompanionResponseMarkup
    bool Property PlayCompanionResponseScene = false Const Auto

    Scene Property CompanionResponseScene Const Auto

    Quest Property CompanionResponsePrereqQuest Const Auto

    int Property CompanionResponsePrereqStage Const Auto

    ReferenceAlias Property Companion Const Auto
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
    ObjectReference myTrigger = GetRef()
    if akActionRef == Game.GetPlayer() 

    ;WaitTriggerKeyword is applied to the alias data. The script will know which function to use depending on whether the keyword is applied

        if myTrigger.HasKeyword(WaitTriggerKeyword)
            Actor[] ActorsNewlyToldToWaitAtMyRef = SQ_Followers.AllFollowersWait(Alias_WaitHereMarker.GetRef())
                int i = 0
                While i < ActorsNewlyToldToWaitAtMyRef.Length
                    Alias_WaitingCompanions.AddRef(ActorsNewlyToldToWaitAtMyRef[i])
                    i += 1
                endWhile
            Alias_ResumeTrigger.GetRef().EnableNoWait()

            ;If there's a scene that's supposed to play when the player enters this trigger...
            if PlayCompanionResponseScene && CompanionResponsePrereqQuest.GetStageDone(CompanionResponsePrereqStage) && Companion.GetRef() != none
                CompanionResponseScene.Start()
            endif
        else
            Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray() 
                if ActorsToFollowMyRef[0] != None           
                    SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef)
                    Alias_WaitingCompanions.RemoveAll()
                endif
            myTrigger.DisableNoWait()
        endif
    endif
EndEvent

Event OnCellDetach()
    ;Support for player fast traveling away without picking up their companion
    Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray() 
        if ActorsToFollowMyRef[0] != None  
            SQ_Followers.TeleportFollowers(Game.GetPlayer(), SpecificFollowersToTeleport = ActorsToFollowMyRef)         
            SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef)
            Alias_WaitingCompanions.RemoveAll()
        endif
        ObjectReference myTrigger = GetRef()
        if !myTrigger.HasKeyword(WaitTriggerKeyword) && myTrigger.IsEnabled()
            myTrigger.DisableNoWait()
        endif
endEvent