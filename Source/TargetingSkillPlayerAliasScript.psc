Scriptname TargetingSkillPlayerAliasScript extends ReferenceAlias

ActorValue property TargetCountAV Auto Const Mandatory RequiresGuard(MyGuard) 

Guard MyGuard

bool function TryToModifyTargetCount(int targetCountModifier, int MaxTargetCount = 0)
    LockGuard MyGuard 

        Actor player = Game.GetPlayer()
        float currentCount = player.GetValue(TargetCountAV)
        bool shouldmodify = true

        if (targetCountModifier > 0)
            shouldmodify = currentCount < MaxTargetCount
        else 
            shouldmodify = currentCount > 0
        endif

        if (shouldmodify)
            player.SetValue(TargetCountAV, currentCount + targetCountModifier)
        EndIf
        
        return shouldmodify

    EndLockGuard
EndFunction