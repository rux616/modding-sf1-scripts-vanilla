Scriptname CCT_Enviro_BehaviorScript extends Quest Const
{optional script for CCT_Enviro quests}

ReferenceAlias property BehaviorActor auto const mandatory
{ behavior actor alias }

Spell property BehaviorAbility auto const
{ optional ability to apply via function call }

guard abilityGuard protectsFunctionLogic

Function ApplyBehaviorAbility(bool bApply = true)
    if BehaviorAbility
        LockGuard abilityGuard
            Actor behaviorActorRef = BehaviorActor.GetActorRef()
            if bApply
                behaviorActorRef.AddSpell(BehaviorAbility)
            Else
                behaviorActorRef.RemoveSpell(BehaviorAbility)
            endif
        EndLockGuard
    endif
EndFunction