Scriptname BE_SC02QuestScript extends Quest
{Script for BE_SC02, Mutiny.}
;
;In BE_SC02, some of the mutineers have killed their captain, and some haven't; their dialogue reflects that.
;Since that's tied to dialogue anyway, just check which voicetype we got and kill the captain if we need to.

Group QuestProperties
    VoiceType[] property MutineersWhoKillCaptain Auto Const Mandatory
EndGroup

Group AutofillProperties CollapsedOnBase
    REParentScript property RE_Parent Auto Const Mandatory
    ActorValue property Health Auto Const Mandatory
    ReferenceAlias property Captain Auto Const Mandatory
    ReferenceAlias property Mutineer Auto Const Mandatory
EndGroup

Function SetupCaptain()
    Actor captainRef = Captain.GetActorRef()
    if (MutineersWhoKillCaptain.Find(Mutineer.GetActorRef().GetVoicetype()) >= 0)
        RE_Parent.KillWithForce(captainRef)
    Else
        captainRef.DamageValue(Health, captainRef.GetValue(Health) - 1)
        captainRef.SetRestrained()
    EndIf
EndFunction